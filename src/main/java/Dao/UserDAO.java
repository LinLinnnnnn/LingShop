package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import Entity.User;
import Utils.JpaUtils;


public class UserDAO extends MainDAO<User, Integer > {
	
	public EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}



//	public List<User> selectUserLikeById(String videoId) {
//		String jpql = "SELECT o.user FROM Favorite o WHERE o.video.id=:vid";
//		TypedQuery<User> query = em.createQuery(jpql, User.class);
//		query.setParameter("vid", videoId);
//		return query.getResultList();
//
//	}
//
//	public List<User> findByRole(boolean role) {
//		String jpql = "SELECT o FROM User o WHERE o.Admin=:role";
//
//		TypedQuery<User> query = em.createQuery(jpql, User.class);
//		query.setParameter("role", role);
//
//		return query.getResultList();
//	}
//
//	public List<User> findByKeyword(String fullname) {
//		String jpql = "SELECT o FROM User o WHERE  o.Fullname LIKE :fullname";
//		TypedQuery<User> query = em.createQuery(jpql, User.class);
//		query.setParameter(0, fullname);
//		return query.getResultList();
//	}
//
//	public User findOne(String username, String password) {
//
//		String jpql = "SELECT o FROM User o WHERE o.id=:id AND o.Password=:pw";
//		TypedQuery<User> query = em.createQuery(jpql, User.class);
//		query.setParameter("id", username);
//		query.setParameter("pw", password);
//		return query.getSingleResult();
//	}
//
//	public User findByPhone(String mail) {
//		String jpql = "SELECT o FROM User o WHERE  o.Email=:mail";
//		TypedQuery<User> query = em.createQuery(jpql, User.class);
//		query.setParameter(0, mail);
//		return query.getSingleResult();
//	}
//
//	public List<User> findPage(int page, int size) {
//		String jpql = "SELECT o FROM User o";
//
//		TypedQuery<User> query = em.createQuery(jpql, User.class);
//		query.setFirstResult(page * size);
//		query.setMaxResults(size);
//		return query.getResultList();
//
//	}


	@Override
	public User insert(User entity) {
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
	public User update(User entity) {
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
	public User delete(Integer key) {
		try {
			em.getTransaction().begin();
			User us = this.findByID(key);
			em.remove(us);
			em.getTransaction().commit();
			return us;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException();
		}

		
	}

	@Override
	public List<User> findAll() {
		String jpql = "SELECT otu FROM User otu";
		TypedQuery<User> query = em.createQuery(jpql, User.class);

		return query.getResultList();
	}

	@Override
	public User findByID(Integer key) {
		return em.find(User.class, key);
	}
	

	public User findByUserName(String username) {
		try {
			String jpql = "SELECT otu FROM User otu Where otu.username = :username";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			 query.setParameter("username", username);
			return query.getSingleResult();
		} catch (Exception e) {
			// TODO: handle exception
			 return null;
		}
		
	}

}
