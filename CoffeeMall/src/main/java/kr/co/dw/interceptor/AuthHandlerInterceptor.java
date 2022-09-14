package kr.co.dw.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.dw.domain.UserDTO;

public class AuthHandlerInterceptor extends HandlerInterceptorAdapter{
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		
		HttpSession session =	request.getSession(false);
		
		if (session != null) {
			UserDTO login = (UserDTO)session.getAttribute("login");
				if (login == null) { 
					
					response.sendRedirect("/user/loginget");
					return false;
				}else {
					return true;
				}
	
		}else {
			response.sendRedirect("/user/loginget");
			return false;
		}
	}

	
	
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

}
