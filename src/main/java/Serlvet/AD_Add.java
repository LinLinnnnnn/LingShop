package Serlvet;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import Dao.BrandDAO;
import Dao.CategoryDAO;
import Dao.ProductDAO;
import Dao.ProductImageDAO;
import Entity.Brand;
import Entity.Category;
import Entity.Product;
import Entity.ProductImage;

/**
 * Servlet implementation class AD_Add
 */
@MultipartConfig()
@WebServlet({ "/AD_Add", "/AD_Show_SP", "/AD_Update_SP", "/AD_Add_SP" })
public class AD_Add extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AD_Add() {
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
		String uri = request.getRequestURI();
		ProductDAO dao = new ProductDAO();
		CategoryDAO categoryDAO = new CategoryDAO();
		BrandDAO brandDAO = new BrandDAO();
		List<Category> listCategory = categoryDAO.findAll();
		List<Brand> listBrand = brandDAO.findAll();
		if (uri.contains("/AD_Show_SP")) {
			Integer product_id = Integer.parseInt(request.getParameter("product_id"));
			if (product_id != null) {
				Product product = dao.findByID(product_id);
				request.setAttribute("product", product);
			}
		}
		request.setAttribute("listCategory", listCategory);
		request.setAttribute("listBrand", listBrand);
		request.getRequestDispatcher("/views/ad_add_product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = request.getRequestURL().toString();
		if (url.contains("/AD_Add_SP")) {
			System.out.println("dô insert");
			this.Create(request, response);
			request.getRequestDispatcher("/views/ad_add_product.jsp").forward(request, response);
		} else if (url.contains("/AD_Update_SP")) {
			if (request.getParameter("product_id") != null) {
				System.out.println("dô uptade");
				this.Update(request, response);
				request.setAttribute("mess", "Cập nhật thành công");
				ProductDAO dao = new ProductDAO();

				request.setAttribute("listProduct", dao.findAll());
				request.getRequestDispatcher("/views/ad_list_Item.jsp").forward(request, response);
			}
		}
	}

	protected void Create(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			ProductDAO dao = new ProductDAO();
			CategoryDAO categoryDAO = new CategoryDAO();
			BrandDAO brandDAO = new BrandDAO();
			File dir = new File(request.getServletContext().getRealPath("/img"));
			if (!dir.exists()) { // tạo nếu chưa tồn tại
				dir.mkdirs();
			}
			Collection<Part> parts = request.getParts();

			for (Part photo : parts) {
//					File photoFile = new File(dir, photo.getSubmittedFileName());
//					photo.write(photoFile.getAbsolutePath());
				System.out.println(photo.getSubmittedFileName());
			}
			Product product = new Product();
			BeanUtils.populate(product, request.getParameterMap());
			ProductImageDAO imgDao = new ProductImageDAO();
			Integer brand_id = Integer.parseInt(request.getParameter("brand_id"));
			product.setBrand(brandDAO.findByID(brand_id));
			Integer category_id = Integer.parseInt(request.getParameter("product_category_id"));
			product.setCategory(categoryDAO.findByID(category_id));
			dao.insert(product);
			int i = 0;
			for (Part photo : parts) {
				if (i < 4) {
					ProductImage img = new ProductImage();
					img.setPath(photo.getSubmittedFileName());
					img.setProduct(product);
					System.out.println(photo.getSubmittedFileName());
					imgDao.insert(img);
					i++;
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

	protected void Update(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			ProductDAO dao = new ProductDAO();
			CategoryDAO categoryDAO = new CategoryDAO();
			BrandDAO brandDAO = new BrandDAO();
			File dir = new File(request.getServletContext().getRealPath("/img"));
			if (!dir.exists()) { // tạo nếu chưa tồn tại
				dir.mkdirs();
			}
			Collection<Part> parts = request.getParts();

//				for (Part photo: parts) {
//					File photoFile = new File(dir, photo.getSubmittedFileName());
//					photo.write(photoFile.getAbsolutePath());
//					System.out.println(photo.getSubmittedFileName());
//				}
			Product product = dao.findByID(Integer.parseInt(request.getParameter("product_id")));
			BeanUtils.populate(product, request.getParameterMap());
			ProductImageDAO imgDao = new ProductImageDAO();
			Integer brand_id = Integer.parseInt(request.getParameter("brand_id"));
			product.setBrand(brandDAO.findByID(brand_id));
			Integer category_id = Integer.parseInt(request.getParameter("product_category_id"));
			product.setCategory(categoryDAO.findByID(category_id));
			if (product.getId() == Integer.parseInt(request.getParameter("product_id"))) {
				dao.update(product); // Cập nhật sản phẩm nếu có ID
			} else {
				System.out.println("Cập nhật k thành công");
			}
			int i = 0;

			for (Part photo : parts) {
				if (photo.getSubmittedFileName() != null) {
					System.out.println("dô bước 1");
					if (i < 4) {
						List<ProductImage> img = imgDao
								.selectImageFromProduct(Integer.parseInt(request.getParameter("product_id")));
						if (img.size() == 4) {
							System.out.println("dô bước 2");
							System.out.println("img.size();" + img.size());
							img.get(i).setPath(photo.getSubmittedFileName());
							imgDao.update(img.get(i));
							i++;
						}
					}
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

}
