package com.example.teste3.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.example.teste3.models.Contact;
import com.example.teste3.repository.ContactRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;

@Service
public class ContactService {
	@Autowired
	ContactRepository repository;

	@Autowired
	private final EntityManager entityManager;
	
	public ContactService(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
	
	public List<Contact> getAllContacts(Integer pageNo, Integer pageSize, String sortBy) {
		Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy));

		Page<Contact> pagedResult = repository.findAll(paging);

		if (pagedResult.hasContent()) {
			return pagedResult.getContent();
		} else {
			return new ArrayList<Contact>();
		}
	}
	
	public Page<Contact> getContacts(boolean activo, Boolean pai, String name, Pageable pageable) {

        Specification<Contact> isActivo = ContactSpecifications.isActivo(activo);
        Specification<Contact> hasPaiNull = ContactSpecifications.hasPaiNull(null);
        
        // Nao está a funcionar a junção! so funciona com o isActivo.
        //Specification<Contact> juncao = isActivo.and(hasPaiNull); 
        
        return repository.findAll(isActivo, pageable);
    }

	
	
	public List<Contact> getContacts2(boolean activo, Boolean pai, String name, Pageable pageable) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Contact> query = criteriaBuilder.createQuery(Contact.class);
        Root<Contact> root = query.from(Contact.class);

        Contact cont = null;
        Predicate predicate = ContactSpecifications.activoAndPaiIsNull(criteriaBuilder, root, name, activo, cont);
        query.where(predicate);
        
        TypedQuery<Contact> typedQuery = entityManager.createQuery(query);
        return typedQuery.getResultList();
        
    }


}