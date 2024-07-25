package Serlvet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserDAO;
import Entity.User;

/**
 * Servlet implementation class DangNhap
 */
@WebServlet("/DangNhap")
public class DangNhap extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DangNhap() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getSession().setAttribute("user", null);
		request.setAttribute("breadcrumb_item", "DangNhap");
		request.getRequestDispatcher("/views/Login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		signIn(request, response);
	}

	private void signIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String username = request.getParameter("username");
			String pw = request.getParameter("password");

			UserDAO dao = new UserDAO();
			User user = dao.findByUserName(username);
			System.out.println("user: " + user.getUsername());
			System.out.println("pw : " + user.getPassword());
			if (user != null) {
				if (!user.getPassword().equalsIgnoreCase(pw)) {
					request.setAttribute("message", "Sai mật khẩu!");
					request.getRequestDispatcher("/views/Login.jsp").forward(request, response);
				} else {
					request.getSession().setAttribute("user", user);
					System.out.println("session1:" + user);
					if (user.isRole()) {
						response.sendRedirect("/LingShop/AD_List");
					}else {
						response.sendRedirect("/LingShop/TrangChu");
					}
					

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "Tài khoản không tồn tại!");
			request.getRequestDispatcher("/views/Login.jsp").forward(request, response);
		}

	}

}
