package hiworld.sample.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service("sampleService")
public interface SampleService {

	void insertMember(Map<String, Object> commandMap) throws Exception;
	
	/*
	 * 게시글 목록(리스트)은 다건을 불러오니까 Map이 여러개 모인 List로 불러옴
	 */
	List<Map<String, Object>> selectBoardList(Map<String, Object> commandMap) throws Exception;
	
	/*
	 * 추억쌓기 목록 불러오기
	 */
	List<Map<String, Object>> selectLocationList(Map<String, Object> commandMap) throws Exception;
	
	void insertBoard(Map<String, Object> commandMap) throws Exception;
	
	/*
	 * 게시글 상세는 1건만 불러오니까 그냥 Map으로 불러옴
	 */
	Map<String, Object> selectBoardDetail(Map<String, Object> commandMap) throws Exception;
	
	/*
	 * 회원정보가 있는지 없는지 매칭
	 */
	boolean isMember(Map<String, Object> commandMap, HttpServletRequest request) throws Exception;
	
	/*
	 * 회원 로그아웃
	 */
	void logoutMember(HttpServletRequest request) throws Exception;
	
	/*
	 * 게시글 상세 클릭 시, 조회수 1 증가
	 */
	void updateBoardHitCnt(Map<String, Object> commandMap, HttpSession session) throws Exception;
	
	/*
	 * 게시글 수정
	 */
	void updateBoard(Map<String, Object> commandMap) throws Exception;
	
	/*
	 * 게시글 영구삭제(DELETE)처리
	 */
	void deleteBoard(Map<String, Object> commandMap) throws Exception;
	
	/*
	 * 게시글 삭제상태로만 update
	 */
	void updateBoardDelState(Map<String, Object> commandMap) throws Exception;
	
	/*
	 * 추억쌓기 1건 insert
	 */
	void insertMyLoaction(Map<String, Object> commandMap, HttpServletRequest request) throws Exception;
	
}
