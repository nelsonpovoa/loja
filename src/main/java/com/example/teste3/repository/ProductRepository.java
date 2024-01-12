package com.example.teste3.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.example.teste3.models.Product;

@Repository
public interface ProductRepository extends PagingAndSortingRepository<Product, Integer> {

    Page<Product> findAll(Pageable pageable);

	Page<Product> findByNameContaining(String name, Pageable pagingSort);

	Page<Product> findByNameContainingIgnoreCase(String keyword, Pageable paging);
	
	Page<Product> findByNameContainingIgnoreCaseAndSubTipoIn(String keyword,List<Integer> subTipo, Pageable paging);
	
	
	
}
