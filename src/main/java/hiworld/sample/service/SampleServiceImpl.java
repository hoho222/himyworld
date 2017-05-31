package hiworld.sample.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Service;

import hiworld.common.util.FileUtils;
import hiworld.sample.dao.SampleDAO;

@Service("sampleService")
public class SampleServiceImpl implements SampleService {
	
	@Resource(name="fileUtils")
    private FileUtils fileUtils;
	
	@Resource(name="sampleDAO")
	private SampleDAO sampleDAO;
	
	@Override
	public void insertMember(Map<String, Object> map) throws Exception {
		sampleDAO.insertMember(map);
	}
	
	@Override
	public boolean memberOverlap(Map<String,Object> map) throws Exception{
		
		List<Map<String, Object>> selectUserList = sampleDAO.selectMemberList(map);
		
		if(selectUserList.isEmpty()) {
			//중복된 ID 없음 -> 가입가능
			return true;
		} else {
			//중복된 ID 있음 -> 가입불가
			return false;
		}
		
	}

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sampleDAO.selectBoardList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectLocationList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sampleDAO.selectLocationList(map);
	}
	
	@Override
	public void insertBoard(Map<String, Object> map) throws Exception {
		
		sampleDAO.insertBoard(map);
	}
	
	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		
		return sampleDAO.selectBoardDetail(map);
	}
	
	@Override
	public boolean isMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		int isMemberOk = sampleDAO.isMember(map);
		
		//해당 id, 패스워드로 조회 시, 조회 결과가 없거나(해당회원 가입X), 2건 이상이면 로그인 안됨
		if(isMemberOk != 0 && isMemberOk < 2){
			Map<String, Object> loginInfo = sampleDAO.selectLoginInfo(map);
			String memberId = (loginInfo.get("ID")).toString();
			String memberName = (loginInfo.get("NAME")).toString();
			
			session.setAttribute("loginId", memberId);
			session.setAttribute("loginName", memberName);
			return true;
		} else {
			return false;
		}
		
	}
	
	@Override
	public void logoutMember(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
	}
	
	@Override
	public void updateBoardHitCnt(Map<String, Object> map, HttpSession session) throws Exception {
		
		String loginId = (String)session.getAttribute("loginId");
		
		Map<String, Object> writerInfo = selectBoardDetail(map);
		
		//자기가 쓴 글은 조회수 증가 안함(id로 비교)
		if(loginId.equals(writerInfo.get("USER_ID"))){
			
		} else {
			sampleDAO.updateBoardHitCnt(map);
		}
		
	}
	
	@Override
	public void updateBoard(Map<String, Object> map) throws Exception {
		
		sampleDAO.updateBoard(map);
	}
	
	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		
		sampleDAO.deleteBoard(map);
	}
	
	@Override
	public void updateBoardDelState(Map<String, Object> map) throws Exception {
		
		sampleDAO.updateBoardDelState(map);
	}
	
	@Override
	public void insertMyLoaction(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		
		for(int i=0; i<list.size(); i++){
			sampleDAO.insertMyLoaction(list.get(i));
		}
	}
}
