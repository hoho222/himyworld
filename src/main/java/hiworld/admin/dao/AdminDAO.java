package hiworld.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import hiworld.common.dao.AbstractDAO;

@Repository("adminDAO")
public class AdminDAO extends AbstractDAO{
	public void insertFile(Map<String, Object> map) throws Exception{
		insert("admin.insertFile", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBanner(Map<String, Object> map) {
		
		return (List<Map<String, Object>>)selectList("admin.selectBanner", map);
	}
	
	public void deleteBanner(Map<String, Object> map) throws Exception{
		insert("admin.deleteBanner", map);
	}
}
