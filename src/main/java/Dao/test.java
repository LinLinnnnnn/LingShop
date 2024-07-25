package Dao;

import java.util.List;

import Entity.Product;
import Entity.User;

public class test {

//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//ProductDAO dao = new ProductDAO();
//
////List<Product> lst = dao.findAll();
////Product pro = lst.get(0);
////System.out.println(pro.getName());
////System.out.println(pro.getProductImages().get(1).getPath());
////System.out.println(pro.getQuantity());
//
////Product pro = dao.findByID(8);
////System.out.println("Tên nè: " + pro.getName());
//
//	}
	public static void main(String[] args) {
		UserDAO dao1 = new UserDAO();
		User u = dao1.findByUserName("linh");

		System.out.println(u.getOrders().get(0).getF_name());
	}

}
