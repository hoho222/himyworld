package hiworld.sample.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import hiworld.common.dao.AbstractDAO;

@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
		
		return (List<Map<String, Object>>)selectList("sample.selectBoardList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectLocationList(Map<String, Object> map) {
		
		return (List<Map<String, Object>>)selectList("sample.selectLocationList", map);
	}
	
	public void insertBoard(Map<String, Object> map) throws Exception{
		insert("sample.insertBoard", map);
	}
	
	public void insertMember(Map<String, Object> map) throws Exception{
		insert("sample.insertMember", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) {
		
		return (Map<String, Object>)selectOne("sample.selectBoardDetail", map);
	}
	
	public int isMember(Map<String, Object> map) {
		
		return (int)selectOne("sample.isMember", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLoginInfo(Map<String, Object> map) {
		
		return (Map<String, Object>)selectOne("sample.selectLoginInfo", map);
	}
	
	public void updateBoardHitCnt(Map<String, Object> map) throws Exception{
		update("sample.updateBoardHitCnt", map);
	}

	public void updateBoard(Map<String, Object> map) throws Exception{
		insert("sample.updateBoard", map);
	}
	
	public void deleteBoard(Map<String, Object> map) throws Exception{
		delete("sample.deleteBoard", map);
	}
	
	public void updateBoardDelState(Map<String, Object> map) throws Exception{
		delete("sample.updateBoardDelState", map);
	}
	
	@SuppressWarnings("unchecked")
	public int selectBoardListAllCnt() {
		
		return (int)selectOne("sample.selectBoardListAllCnt");
	}
	
	@SuppressWarnings("unchecked")
	public int selectLoactionListAllCnt() {
		
		return (int)selectOne("sample.selectLoactionListAllCnt");
	}
	
	public void insertMyLoaction(Map<String, Object> map) throws Exception{
		insert("sample.insertMyLoaction", map);
	}
	
}
