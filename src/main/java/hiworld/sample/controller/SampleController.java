package hiworld.sample.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import hiworld.admin.dao.AdminDAO;
import hiworld.admin.service.AdminService;
import hiworld.common.common.CommandMap;
import hiworld.sample.dao.SampleDAO;
import hiworld.sample.service.SampleService;

@Controller
public class SampleController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="sampleDAO")
	private SampleDAO sampleDAO;
	
	@Resource(name="sampleService")
	private SampleService sampleService;
	
	@Resource(name="adminDAO")
	private AdminDAO adminDAO;
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	@RequestMapping(value="/index.do")
	public ModelAndView index(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/index");
		
		commandMap.put("conPath", "front");
		
		List<Map<String,Object>> bannerList = adminService.selectBanner(commandMap);
		
		mv.addObject("bannerList", bannerList);
		
		return mv;
	}
	
	@RequestMapping(value="/join.do")
	public ModelAndView join(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/front/join");
		
		return mv;
	}
	
	@RequestMapping(value="/joinAct.do")
	public ModelAndView joinAct(@RequestParam Map<String,Object> p) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:/index.do");
		
		sampleService.insertMember(p);
		
		return mv;
	}
	
	@RequestMapping(value="/login.do")
	public ModelAndView login(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/front/login");
		
		return mv;
	}
	
	@RequestMapping(value="/loginAct.do")
	public String loginAct(@RequestParam Map<String,Object> p, HttpServletRequest request, final RedirectAttributes redirectAttributes) throws Exception {
		
		if(sampleService.isMember(p, request)){
			return "redirect:/index.do";
		} else {
			redirectAttributes.addFlashAttribute("returnMsg", "로그인 실패! 아이디 또는 비밀번호를 확인해 주세요.");
			return "redirect:/login.do";
		}
		
	}
	
	@RequestMapping(value="/logout.do")
	public ModelAndView logout(@RequestParam Map<String,Object> p, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:/index.do");
		
		sampleService.logoutMember(request);
		
		return mv;
	}
	
	/*
	 * 게시판 목록 (다건 select 양식)
	 */
	@RequestMapping(value="/BoardList.do")
	public ModelAndView BoardList(@RequestParam Map<String,Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/front/boardList");
		
		String seq = (commandMap.get("seq")).toString();
		
		int startPage = 0;
		 
		int endPage = 0;
		int page = 0;
		try{
			// 시작페이지 설정 1~5 페이지 일경우 1​​
			startPage =((Integer.parseInt(seq) - 1)) / 5 * 5 + 1;
			//ex) 현재 6페이지 일경우 (6-1) /5 * 5 +1 = 1 -> 6 페이지 부터 시작​​
		 
			endPage = startPage + 5 - 1;                             
		 
			if(seq != null && seq != ""){
				if(!seq.equals("1")){
					//첫페이지가 아닐경우 그 페이지에 맞는 목록 뽑아옴​
					int temp = (Integer.parseInt(seq)-1)*15;    
					page= temp;
						
				}else if(seq.equals("1")){
				//페이지 번호가 1이면 처음부터 15개​
					page = 0;         
				}
			}
		} catch(Exception e){
		//이상한 페이지 번호 들어오면 해당 게시판 처음으로 리다이렉트​
			mv = new ModelAndView("redirect:/BoardList.do?seq=1"); 
			return mv;     
		}
	   //전체 게시물 갯수 뽑아옴 ​
	 
		int rownumInt = sampleDAO.selectBoardListAllCnt();
		String rownum = String.valueOf(rownumInt);
		//pageNum 변수는 전체 페이지의 수​
		int pageNum = Integer.parseInt(rownum)/15+1; 
		// 게시물이 딱 15개일 경우 다음페이지가 생기지 않게 -1 해줌​
 
		if(Integer.parseInt(rownum)%15 == 0){       
			pageNum--;
		}
 
 
		if(endPage > pageNum){
		//예를 들어 마지막페이지가 12페이지인 경우 endPage가 15페이지 까지 출력되기때문에 12페이지로 바꿔줌​
 
			endPage = pageNum;  
 
		}     
			commandMap.put("page", page);
			List<Map<String,Object>> list = sampleService.selectBoardList(commandMap);
	        mv.addObject("list", list);
	        
	        mv.addObject("page",page);
	        mv.addObject("totalCnt",rownumInt);
	        mv.addObject("pageNum",pageNum);
	        mv.addObject("start",startPage);
	        mv.addObject("end",endPage);
	        mv.addObject("seq",seq);
	        
	        return mv;
	}

	@RequestMapping(value="/BoardWrite.do")
	public ModelAndView BoardWrite(Map<String,Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/front/boardWrite");
		
		return mv;
	}
	
	
	@RequestMapping(value="/BoardWriteAct.do")
	public ModelAndView BoardWriteAct(@RequestParam Map<String,Object> p) throws Exception {
		//글 작성후엔 목록으로 리다이렉트
		ModelAndView mv = new ModelAndView("redirect:/BoardList.do?seq=1"); 
		
		sampleService.insertBoard(p);

		return mv;
	}
	
	/*
	 * 게시판 하나의 글 상세보기 (1건 select 양식)
	 */
	@RequestMapping(value="/BoardDetail.do")
	public ModelAndView BoardDetail(@RequestParam Map<String,Object> p, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/front/boardDetail");
		
		//조회수 먼저 증가
		sampleService.updateBoardHitCnt(p, session);
		
		//해당 글 내용 select
		Map<String,Object> detailMap = sampleService.selectBoardDetail(p);
		mv.addObject("detailMap", detailMap);
		
		return mv;
	}
	
	@RequestMapping(value="/BoardEdit.do")
	public ModelAndView BoardEdit(@RequestParam Map<String,Object> p) throws Exception {
		
		ModelAndView mv = new ModelAndView("/front/boardEdit");
		
		//수정할 글 내용 select
		Map<String,Object> detailMap = sampleService.selectBoardDetail(p);
		mv.addObject("detailMap", detailMap);
		
		return mv;
	}
	
	@RequestMapping(value="/BoardEditAct.do")
	public ModelAndView BoardEditAct(@RequestParam Map<String,Object> p) throws Exception {
		//글 수정 완료 후엔 목록으로 리다이렉트
		ModelAndView mv = new ModelAndView("redirect:/BoardList.do?seq=1"); 
		
		sampleService.updateBoard(p);

		return mv;
	}
	
	@RequestMapping(value="/BoardDelete.do")
	public ModelAndView BoardDelete(@RequestParam Map<String,Object> p) throws Exception {
		//글 삭제 후엔 목록으로 리다이렉트
		ModelAndView mv = new ModelAndView("redirect:/BoardList.do?seq=1"); 
		
		sampleService.deleteBoard(p);

		return mv;
	}
	
	@RequestMapping(value="/BoardDeleteState.do")
	public ModelAndView BoardDeleteState(@RequestParam Map<String,Object> p) throws Exception {
		//글 삭제 후엔 목록으로 리다이렉트
		ModelAndView mv = new ModelAndView("redirect:/BoardList.do?seq=1"); 
		
		sampleService.updateBoardDelState(p);

		return mv;
	}
	
	@RequestMapping(value="/MyLocation.do")
	public ModelAndView MyLocation(@RequestParam Map<String,Object> p) throws Exception {
		
		ModelAndView mv = new ModelAndView("/front/myLocation"); 
		
		String seq = "1";
		
		if(p.get("seq") != null){
			seq = (p.get("seq")).toString();
		} 
		int startPage = 0;
		 
		int endPage = 0;
		int page = 0;
		try{
			// 시작페이지 설정 1~5 페이지 일경우 1​​
			startPage =((Integer.parseInt(seq) - 1)) / 5 * 5 + 1;
			//ex) 현재 6페이지 일경우 (6-1) /5 * 5 +1 = 1 -> 6 페이지 부터 시작​​
		 
			endPage = startPage + 5 - 1;                             
		 
			if(seq != null && seq != ""){
				if(!seq.equals("1")){
					//첫페이지가 아닐경우 그 페이지에 맞는 목록 뽑아옴​
					int temp = (Integer.parseInt(seq)-1)*5;    
					page= temp;
						
				}else if(seq.equals("1")){
				//페이지 번호가 1이면 처음부터 5개​
					page = 0;         
				}
			}
		} catch(Exception e){
		//이상한 페이지 번호 들어오면 해당 게시판 처음으로 리다이렉트​
			mv = new ModelAndView("redirect:/MyLocation.do"); 
			return mv;     
		}
	   //전체 게시물 갯수 뽑아옴 ​
	 
		int rownumInt = sampleDAO.selectLoactionListAllCnt();
		String rownum = String.valueOf(rownumInt);
		//pageNum 변수는 전체 페이지의 수​
		int pageNum = Integer.parseInt(rownum)/5+1; 
		// 게시물이 딱 5개일 경우 다음페이지가 생기지 않게 -1 해줌​
 
		if(Integer.parseInt(rownum)%5 == 0){       
			pageNum--;
		}
 
 
		if(endPage > pageNum){
		//예를 들어 마지막페이지가 12페이지인 경우 endPage가 15페이지 까지 출력되기때문에 12페이지로 바꿔줌​
 
			endPage = pageNum;  
 
		}     
		p.put("page", page);
		List<Map<String,Object>> list = sampleService.selectLocationList(p);
        mv.addObject("list", list);
        mv.addObject("page",page);
        mv.addObject("totalCnt",rownumInt);
        mv.addObject("pageNum",pageNum);
        mv.addObject("start",startPage);
        mv.addObject("end",endPage);
        mv.addObject("seq",seq);
        
		return mv;
	}
	
	@RequestMapping(value="/testMapArgumentResolver.do")
	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("");
		
		if(commandMap.isEmpty() == false){
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : "+entry.getKey()+", value : "+entry.getValue());
				
			}
		}
		return mv;
	}
	
	@RequestMapping(value="/mylocation_act.do")
	public ModelAndView myLocationAct(@RequestParam Map<String,Object> p, HttpServletRequest request) throws Exception {
		//글 작성후엔 목록으로 리다이렉트
		ModelAndView mv = new ModelAndView("redirect:/MyLocation.do?seq=1"); 
		
		sampleService.insertMyLoaction(p, request);

		return mv;
	}
	
	
}
