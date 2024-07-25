//package Filter;
//
//
//import java.io.IOException;
//
//import java.util.Date;
//
//import javax.servlet.FilterChain;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.poly.entity.User;
//
//
//@WebFilter(filterName = "LoginFilter", urlPatterns = {"/accountBai3/sign-in","/*"})
//public class LoggerFilter implements HttpFilter {
//	@Override	
//	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
//			throws IOException, ServletException {
//		System.out.println("Loggg đã chạy");
//		User user = (User) req.getSession().getAttribute("user");
//		String uri = req.getRequestURI();
//		System.out.println("có không" +user );
//		Date time = new Date();
//		if(user != null) {
//			System.out.println("Log: Tài khoản đăng nhập" + user.getUserID() + "-" +uri+ "-" +time );
//		}
//	
//		chain.doFilter(req, resp);
//	}
//
//}
