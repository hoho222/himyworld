package hiworld.admin.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.*;
import org.junit.runner.Request;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hiworld.admin.dao.AdminDAO;
import hiworld.admin.service.AdminService;
import hiworld.common.common.CommandMap;
import hiworld.sample.service.SampleService;

@Controller
public class AdminController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminDAO")
	private AdminDAO adminDAO;
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	@RequestMapping(value="/admin_index.do")
	public ModelAndView adminIndex(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/admin_index");
		
		return mv;
	}
	
	@RequestMapping(value="/admin_banner.do")
	public ModelAndView adminBanner(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/admin_banner");
		
		commandMap.put("conPath", "admin");
		
		List<Map<String, Object>> bannerList = adminService.selectBanner(commandMap);
		
		mv.addObject("bannerList",bannerList);
		
		return mv;
	}
	
	@RequestMapping(value="/admin_banner_act.do")
	public ModelAndView adminBannerAct(@RequestParam Map<String,Object> p, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin_banner.do");
		
		adminService.insertBanner(p, request);
		
		return mv;
	}
	

	@RequestMapping(value="/admin_banner_delete.do")
	public ModelAndView adminBannerDelete(@RequestParam Map<String,Object> p) throws Exception {
		System.out.println("삭제 피 > "+p);
		ModelAndView mv = new ModelAndView("redirect:/admin_banner.do"); 
		adminService.deleteBanner(p);

		return mv;
	}
	
}
