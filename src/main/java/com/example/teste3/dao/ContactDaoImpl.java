package com.example.teste3.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.teste3.models.Contact;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

@Repository
@Transactional
public class ContactDaoImpl implements ContactDao {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Contact> getItems() {
        String query ="From Contact where pai is null order by id desc ";

        return em.createQuery(query).getResultList();

    }

	@Override
	public void registar(Contact contacto) {
		em.merge(contacto);
		
	}

	@Override
	public List<Contact> getAllContactsByIdPai(Long id) {
		String query ="From Contact where pai.id = "+id+" order by id asc ";
		return em.createQuery(query).getResultList();
	}

	@Override
	public Contact getContact(Long id) {
		//TypedQuery<Contact> createNamedQuery = em.createNamedQuery("findQuery", Contact.class);
		//createNamedQuery.setParameter("id", id);
		
		String query = "select c from Contact c where c.id = ?1";
		Contact c = (Contact)em.createQuery(query).setParameter(1, id).getSingleResult();
		
		return c;
	}
// TypedQuery<Person> createNamedQuery = em.createNamedQuery("findQuery", Person.class);
//	createNamedQuery.setParameter("id", id);

}

