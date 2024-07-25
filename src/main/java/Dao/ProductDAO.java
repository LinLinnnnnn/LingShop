package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import Entity.Product;
import Utils.JpaUtils;

public class ProductDAO extends MainDAO<Product, Integer> {
	public EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}

	@Override
	public Product insert(Product entity) {
		// TODO Auto-generated method stub
		try {
			em.getTransaction().begin();

			em.persist(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException();
		}
	}

	@Override
	public Product update(Product entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException();
		}
	}

	@Override
	public Product delete(Integer key) {
		// TODO Auto-generated method stub
		try {
			em.getTransaction().begin();
			Product product = this.findByID(key);
			em.remove(product);
			em.getTransaction().commit();
			System.out.println("Xóa gòi");
			return product;
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("không có xóa ");
			throw new RuntimeException();
		}
	}

	@Override
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		String jpql = "SELECT otu FROM Product otu";
		TypedQuery<Product> query = em.createQuery(jpql, Product.class);
		return query.getResultList();
	}

	
	@Override
	public Product findByID(Integer key) {
		// TODO Auto-generated method stub
		return em.find(Product.class, key);
	}
	
	
	 public void deleteImagesByProductId(int productId) {
	        try {
	        em.getTransaction().begin();
	            String jpql = "DELETE FROM ProductImage pi WHERE pi.product.id = :productId";
	            em.createQuery(jpql)
	              .setParameter("productId", productId)
	              .executeUpdate();
	            em.getTransaction().commit();
	        } catch (Exception e) {
	        	em.getTransaction().rollback();
	            e.printStackTrace();
	            // Handle exception
	        }
	    }

}
