package com.example.teste3.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.example.teste3.models.Contact;

@Repository
public interface ContactRepository extends PagingAndSortingRepository<Contact, Integer> {

	// VERIFICAR SE FUNCIONA!
	@Query("select c from Contact c where c.activo = true and c.pai is null")
    Page<Contact> findAll(Pageable pageable);
    
    Page<Contact> findAll(Specification<Contact> specification, Pageable pageable);

    Page<Contact> findByActivoAndPai(boolean activo, String pai, Pageable pageable);
    Page<Contact> findByPai(String pai, Pageable pageable);
    
	Page<Contact> findByNomeContaining(String name, Pageable pagingSort);

	Page<Contact> findByNomeContainingIgnoreCase(String name, Pageable paging);

	// da erro este metodo
	// No property 'findAllActives' found for type 'Contact'
	//List<Contact> findAllActives();
}
