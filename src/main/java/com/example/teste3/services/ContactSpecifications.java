package com.example.teste3.services;

import org.springframework.data.jpa.domain.Specification;

import com.example.teste3.models.Contact;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;

public class ContactSpecifications {
	

	public static Specification<Contact> isActivo(boolean activo) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get("activo"), activo);
    }
	
	public static Specification<Contact> hasPaiNull(Contact pai) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get("pai"), pai);
    }
	
	
	public static Specification<Contact> olderThan(int age) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.greaterThan(root.get("age"), age);
    }

	public static Predicate olderThan(CriteriaBuilder criteriaBuilder, Root<Contact> root, int age) {
        return criteriaBuilder.greaterThan(root.get("age"), age);
    }

    public static Predicate hasName(CriteriaBuilder criteriaBuilder, Root<Contact> root, String name) {
        return criteriaBuilder.equal(root.get("nome"), name);
    }

    
    public static Predicate isActive(CriteriaBuilder criteriaBuilder, Root<Contact> root, Boolean isActive) {
        return criteriaBuilder.equal(root.get("isActive"), isActive);
    }

    public static Predicate hasPaiIsNull(CriteriaBuilder criteriaBuilder, Root<Contact> root, Contact pai) {
        return criteriaBuilder.isTrue(root.get("pai"));
    }

    
	public static Predicate activoAndPaiIsNull(CriteriaBuilder criteriaBuilder, Root<Contact> root, String hasName, Boolean activo, Contact pai) {
        Predicate isActivo = isActive(criteriaBuilder, root, activo);
        Predicate hasPaiPredicate = hasPaiIsNull(criteriaBuilder, root, pai);
        return criteriaBuilder.and(isActivo, hasPaiPredicate);
    }
	
//	  public static Specification<Contact> activo() {
//	        return (root, query, criteriaBuilder) -> criteriaBuilder.greaterThan(root.get("age"), age);
//	    }
	  
	/*
	    public static Specification<Contact> olderThanAndHasName(Boolean activo, Contact pai) {
	        Specification<Contact> olderThanSpec = olderThan(age);
	        Specification<Contact> hasNameSpec = hasName(name);
	        return olderThanSpec.and(hasNameSpec);
	    }
	  */
}
