package Dao;

import java.util.List;

abstract public class MainDAO <E,K>{
	abstract public E insert(E entity);
	abstract public E update(E entity);
	abstract public E delete(K key);
	abstract public List<E> findAll();
	abstract public E findByID(K key);
}
