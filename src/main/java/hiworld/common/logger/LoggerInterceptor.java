package hiworld.common.logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hiworld.common.logger.LoggerInterceptor;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import hiworld.common.logger.LoggerInterceptor;

public class LoggerInterceptor extends HandlerInterceptorAdapter {
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
	
	/*
	 * client -> controller로의 요청을 처리하는 전처리기(pre)
	 * preHandler는 controller가 호출되기 전에 실행됨
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("======================================          START         ======================================");
			log.debug(" Request URI \t:  " + request.getRequestURI());
		}
		
		HttpSession session = request.getSession();
		
		String memberId = (String)session.getAttribute("loginId");
		
		//exclude-mapping 대신, 요청된 url
		String requestUrl = request.getRequestURL().toString();
		
		if(requestUrl.contains("/hiworld/index.do") || requestUrl.contains("/hiworld/login.do") || requestUrl.contains("/hiworld/loginAct.do") || requestUrl.contains("/hiworld/join.do") || requestUrl.contains("/hiworld/joinAct.do")){
			return true;
		}
		
		//세션 체크
		if(memberId == null){
			response.sendRedirect("/hiworld/login.do");
			return false;
		}
		return super.preHandle(request, response, handler);
	}
	
	/*
	 * controller -> client로의 응답을 처리하는 후처리기(post)
	 * postHandler는 controller가 실행되고 나서 호출됨
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("======================================           END          ======================================\n");
		}
	}
}
