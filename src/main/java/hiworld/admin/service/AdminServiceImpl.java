package hiworld.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import hiworld.admin.dao.AdminDAO;
import hiworld.common.util.FileUtils;

@Service("adminService")
public class AdminServiceImpl implements AdminService  {
	
	@Resource(name="fileUtils")
    private FileUtils fileUtils;
	
	@Resource(name="adminDAO")
	private AdminDAO adminDAO;
	
	@Override
	public void insertBanner(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		
		for(int i=0; i<list.size(); i++){
			adminDAO.insertFile(list.get(i));
		}

	}
	
	@Override
	public List<Map<String, Object>> selectBanner(Map<String, Object> map) throws Exception{
		return adminDAO.selectBanner(map);
	}
	
	@Override
	public void deleteBanner(Map<String, Object> map) throws Exception {
		
		adminDAO.deleteBanner(map);
		

	}
	
}
