package Filter;


import java.io.IOException;


import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.User;




@WebFilter(filterName = "AuthFilter" , urlPatterns = {"/AD_Add","/AD_Add/*","/AD_List","/AD_Show_SP","/AD_Update_SP","/AD_Delete_SP","/AD_Add_SP"})
public class AuthFilter implements HttpFilter{

	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		String uri = req.getRequestURI();
		User user = (User) req.getSession().getAttribute("user");
		String error = "";
		System.out.println("AuthFilter running");
		if(user == null) {
			error = resp.encodeURL("Please login to use this function!");
			System.out.println("Vui lòng đăng nhập!");
		}
		else if(!user.isRole() 
				&& (uri.contains("/AD_Add") || 
                        uri.contains("/AD_List") ||
                        uri.contains("/AD_Show_SP") ||
                        uri.contains("/AD_Update_SP") ||
                        uri.contains("/AD_Delete_SP") ||
                        uri.contains("/AD_Add_SP"))) {
			System.out.println("Vui lòng đăng nhập với vai trò admin");
			error = resp.encodeURL("Please login with admin role");	
		}
		if(!error.isEmpty()) {
			req.getSession().setAttribute("securi", error);
			resp.sendRedirect("views/Login.jsp?error="+resp.encodeURL(error));
		}
		else {
			System.out.println("No Error!");
			chain.doFilter(req, resp);
	
			
		}
	}

}
