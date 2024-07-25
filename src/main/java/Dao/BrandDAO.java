package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import Entity.Brand;
import Entity.Product;
import Utils.JpaUtils;

public class BrandDAO extends MainDAO<Brand, Integer> {
	public EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	@Override
	public Brand insert(Brand entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Brand update(Brand entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Brand delete(Integer key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Brand> findAll() {
		String jpql = "SELECT otu FROM Brand otu";
		TypedQuery<Brand> query = em.createQuery(jpql, Brand.class);
		return query.getResultList();
	}

	@Override
	public Brand findByID(Integer key) {
		return 	em.find(Brand.class, key);
	}
	 public List<Product> findProductsByBrandId(int BrandId) {
		 String jpql = "SELECT p FROM Product p WHERE p.Brand.id = :BrandId";
		 TypedQuery<Product> query = em.createQuery(jpql, Product.class);
		 query.setParameter("BrandId", BrandId);
	        return query.getResultList();
	    }
}
