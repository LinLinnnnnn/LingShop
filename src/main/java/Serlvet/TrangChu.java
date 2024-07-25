package Serlvet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.CategoryDAO;
import Dao.OrderDAO;
import Dao.ProductDAO;
import Entity.Category;
import Entity.Order;
import Entity.Product;
import Entity.User;

/**
 * Servlet implementation class TrangChu
 */
@WebServlet({ "/TrangChu", "/GioHang", "/DanhSachSP", "/ChiTietSP", "/ThongTinCaNhan" })
public class TrangChu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TrangChu() {
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
		String uri = request.getRequestURL().toString();
		String fw = "";
		if (uri.contains("/TrangChu")) {
			ProductDAO productDao = new ProductDAO();
			CategoryDAO categoryDao = new CategoryDAO();
			List<Product> lstProduct = productDao.findAll();
			List<Category> listCategory = categoryDao.findAll();
			request.setAttribute("listProduct", lstProduct);
			request.setAttribute("listCategory", listCategory);
			HttpSession session1 = request.getSession(true);
			session1.setAttribute("listCategory", listCategory);
			 HttpSession session = request.getSession(false); // Lấy session đã tồn tại (nếu có)
		        if (session != null) {
		            User user = (User) session.getAttribute("user"); 
		        }
			fw = "index.jsp";

		} else if (uri.contains("/GioHang")) {
			request.setAttribute("breadcrumb_item", "GioHang");
			fw = "cart.jsp";
		} else if (uri.contains("/DanhSachSP")) {
			CategoryDAO categoryDao = new CategoryDAO();
			request.setAttribute("breadcrumb_item", "DanhSach");
			String id = request.getParameter("category_id");
			if (id == null) {
				ProductDAO dao = new ProductDAO();
				request.setAttribute("listProduct", dao.findAll());
			} else {
				Integer category_id = Integer.parseInt(id);
				request.setAttribute("listProduct", categoryDao.findProductsByCategoryId(category_id));
			}
			fw = "full-sp.jsp";

		} else if (uri.contains("/ChiTietSP")) {
			ProductDAO productDao = new ProductDAO();
			request.setAttribute("breadcrumb_item", "ChiTietSanPham");
			Integer product_id = Integer.parseInt(request.getParameter("product_id"));
			request.setAttribute("product_id", product_id);
			Product product = productDao.findByID(product_id);
			request.setAttribute("product", product);
			fw = "detailItem.jsp";

		} else if (uri.contains("/ThongTinCaNhan")) {
			  HttpSession session = request.getSession(false); // Lấy session đã tồn tại (nếu có)
		        if (session != null) {
		        	 User user = (User) session.getAttribute("user"); 
		        	 request.setAttribute("user", user);
		        	OrderDAO oD = new OrderDAO();
		        	Order o = oD.findOrderByUserID(user.getId());
		        	request.setAttribute("order", o);
		        	 request.setAttribute("breadcrumb_item", "ThongTinCaNhan");
		 			fw = "user-profile.jsp";
		        }else {
		        	request.setAttribute("breadcrumb_item", "ThongTinCaNhan");
					fw = "Login.jsp";
		        }
			

		}
		System.out.println("session2:" + request.getSession().getAttribute("user"));
		request.getRequestDispatcher("/views/" + fw).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
