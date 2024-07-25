package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import Entity.Order;

import Entity.Product;
import Utils.JpaUtils;

public class OrderDAO extends MainDAO<Order, Integer> {
	public EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	@Override
	public Order insert(Order entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Order update(Order entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Order delete(Integer key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Order> findAll() {
		String jpql = "SELECT otu FROM Order otu";
		TypedQuery<Order> query = em.createQuery(jpql, Order.class);
		return query.getResultList();
	}

	@Override
	public Order findByID(Integer key) {
		// TODO Auto-generated method stub
		return em.find(Order.class, key);
	}
//	 public List<Product> findProductsByOrderId(int OrderId) {
//		 String jpql = "SELECT p FROM Product p WHERE p.Order.id = :OrderId";
//		 TypedQuery<Product> query = em.createQuery(jpql, Product.class);
//		 query.setParameter("OrderId", OrderId);
//	        return query.getResultList();
//	    }
	 
	 public Order findOrderByUserID(int userID) {
		 try {
			 String jpql = "SELECT o FROM Order o WHERE o.user.id = :userID";
			 TypedQuery<Order> query = em.createQuery(jpql, Order.class);
			 query.setParameter("userID", userID);
		        return query.getResultList().get(0);
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}

	    }
}
