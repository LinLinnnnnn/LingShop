package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import Entity.Category;
import Entity.Product;
import Utils.JpaUtils;

public class CategoryDAO extends MainDAO<Category, Integer> {
	public EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	@Override
	public Category insert(Category entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Category update(Category entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Category delete(Integer key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Category> findAll() {
		String jpql = "SELECT otu FROM Category otu";
		TypedQuery<Category> query = em.createQuery(jpql, Category.class);
		return query.getResultList();
	}

	@Override
	public Category findByID(Integer key) {
		// TODO Auto-generated method stub
		return em.find(Category.class, key);
	}
	 public List<Product> findProductsByCategoryId(int categoryId) {
		 String jpql = "SELECT p FROM Product p WHERE p.category.id = :categoryId";
		 TypedQuery<Product> query = em.createQuery(jpql, Product.class);
		 query.setParameter("categoryId", categoryId);
	        return query.getResultList();
	    }
}
