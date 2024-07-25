package Serlvet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.fasterxml.jackson.databind.util.BeanUtil;

import Dao.OrderDAO;
import Dao.UserDAO;
import Entity.Order;
import Entity.User;

/**
 * Servlet implementation class DangKi
 */
@WebServlet("/DangKi")
public class DangKi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangKi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("breadcrumb_item", "DangKi");
		request.getRequestDispatcher("/views/Sign_up.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = new User();
		try {
			String tk = request.getParameter("username");
			String pw = request.getParameter("password");
			String f_name = request.getParameter("f_name");
			String l_name = request.getParameter("l_name");
			BeanUtils.populate(user, request.getParameterMap());
			UserDAO Udao = new UserDAO();
			User u = Udao.findByUserName(tk);
		if(	 u == null) {
			Udao.insert(user);
			OrderDAO Odao = new OrderDAO() ;
			Order o = new Order();
			o.setF_name(f_name);
			System.out.println(f_name+ "fnam");
			System.out.println(l_name+ "lname");
			o.setL_name(l_name);
			o.setUser(user);
			Odao.insert(o);
			request.setAttribute("usernameed",tk);
			request.setAttribute("passworded", pw);
			request.getRequestDispatcher("/views/Login.jsp").forward(request, response);
		}else {
			request.setAttribute("mess_err", "Tài khoản đã tồn tại");
			request.getRequestDispatcher("/views/Sign_up.jsp").forward(request, response);
		}
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
