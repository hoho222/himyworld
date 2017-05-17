package hiworld.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service("adminService")
public interface AdminService {
	void insertBanner(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	List<Map<String, Object>> selectBanner(Map<String, Object> map) throws Exception;
	
	void deleteBanner(Map<String, Object> map) throws Exception;
	
}
