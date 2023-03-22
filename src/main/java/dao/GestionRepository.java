package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import Util.JPAUTIL;
import entities.Client;

public class GestionRepository {

	EntityTransaction et;
	EntityManager em;
	
	public GestionRepository() {
		super();
		this.em = JPAUTIL.getEntityManager("GestionStock");
		this.et = em.getTransaction();
	}

	public Object save(Object o) {
		if (!et.isActive()) {
	        et.begin();
	    }
		em.persist(o);
		et.commit();
		return o;
	}
	
	public List<Object> findALL(Object objectClass){
		
	
		List<Object> objets = (List<Object>) em.createQuery("SELECT p from "+objectClass.getClass().getName()+" p",objectClass.getClass()).getResultList();
		
		return objets;
	}
	
	public Object findById(int id,Object objectClass) {
		
		Object o =em.find(objectClass.getClass(), id);
		return o;
		
	}
	public Object update(Object objectClass) {
		
		if (!et.isActive()) {
	        et.begin();
	    }
		Object o = em.merge(objectClass);
		et.commit();
		return o;
		
	}
	public Object updateORsave(Object objectClass,int id) {
			
			Object oldobjet=findById(id,objectClass);
			Object result=null;
			if(oldobjet!=null) {
		
				
				result=update(objectClass);
			}else if(oldobjet==null) {
				
			result = save(objectClass);
			}
			
			return result;
			
		}
	
	public Object delete(int id,Object objectClass) {
		
		Object o =em.find(objectClass.getClass(), id);
		if (!et.isActive()) {
	        et.begin();
	    }
		em.remove(o);
		et.commit();
		return o;
		
	}
}
