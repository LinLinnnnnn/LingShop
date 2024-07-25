package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import Entity.ProductImage;
import Utils.JpaUtils;


public class ProductImageDAO extends MainDAO<ProductImage, Integer > {
	
	public EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}



//	public List<ProductImage> selectProductImageLikeById(String videoId) {
//		String jpql = "SELECT o.ProductImage FROM Favorite o WHERE o.video.id=:vid";
//		TypedQuery<ProductImage> query = em.createQuery(jpql, ProductImage.class);
//		query.setParameter("vid", videoId);
//		return query.getResultList();
//
//	}
//
//	public List<ProductImage> findByRole(boolean role) {
//		String jpql = "SELECT o FROM ProductImage o WHERE o.Admin=:role";
//
//		TypedQuery<ProductImage> query = em.createQuery(jpql, ProductImage.class);
//		query.setParameter("role", role);
//
//		return query.getResultList();
//	}
//
//	public List<ProductImage> findByKeyword(String fullname) {
//		String jpql = "SELECT o FROM ProductImage o WHERE  o.Fullname LIKE :fullname";
//		TypedQuery<ProductImage> query = em.createQuery(jpql, ProductImage.class);
//		query.setParameter(0, fullname);
//		return query.getResultList();
//	}
//
//	public ProductImage findOne(String ProductImagename, String password) {
//
//		String jpql = "SELECT o FROM ProductImage o WHERE o.id=:id AND o.Password=:pw";
//		TypedQuery<ProductImage> query = em.createQuery(jpql, ProductImage.class);
//		query.setParameter("id", ProductImagename);
//		query.setParameter("pw", password);
//		return query.getSingleResult();
//	}
//
//	public ProductImage findByPhone(String mail) {
//		String jpql = "SELECT o FROM ProductImage o WHERE  o.Email=:mail";
//		TypedQuery<ProductImage> query = em.createQuery(jpql, ProductImage.class);
//		query.setParameter(0, mail);
//		return query.getSingleResult();
//	}
//
//	public List<ProductImage> findPage(int page, int size) {
//		String jpql = "SELECT o FROM ProductImage o";
//
//		TypedQuery<ProductImage> query = em.createQuery(jpql, ProductImage.class);
//		query.setFirstResult(page * size);
//		query.setMaxResults(size);
//		return query.getResultList();
//
//	}


	@Override
	public ProductImage insert(ProductImage entity) {
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
	public ProductImage update(ProductImage entity) {
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
	public ProductImage delete(Integer key) {
		try {
			em.getTransaction().begin();
			ProductImage us = this.findByID(key);
			em.remove(us);
			em.getTransaction().commit();
			return us;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException();
		}

		
	}

	@Override
	public List<ProductImage> findAll() {
		String jpql = "SELECT otu FROM ProductImage otu";
		TypedQuery<ProductImage> query = em.createQuery(jpql, ProductImage.class);

		return query.getResultList();
	}

	@Override
	public ProductImage findByID(Integer key) {
		return em.find(ProductImage.class, key);
	}
	  public List<ProductImage> selectImageFromProduct(int productId) {
	        String jpql = "SELECT pi FROM ProductImage pi WHERE pi.product.id = :productId";
	        TypedQuery<ProductImage> query = em.createQuery(jpql, ProductImage.class);
	        query.setParameter("productId", productId);
	        return query.getResultList();
	    }

	
}
