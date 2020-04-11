package board.review.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import member.domain.AuthInfo;

public class ReviewInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		
		HttpSession session = req.getSession();
		AuthInfo authinfo = (AuthInfo)session.getAttribute("division");
		
		if(authinfo == null) {
			res.sendRedirect("/member/signin");
			return false;
		}
		
		
		if(authinfo == null || authinfo.getDivision() != "S1") {
			res.sendRedirect("/");
			return false;
		}
		return true;
	}
}
