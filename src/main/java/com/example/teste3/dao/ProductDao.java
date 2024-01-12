package com.example.teste3.dao;

import java.util.List;

import com.example.teste3.models.Product;
import com.example.teste3.utils.Tuplo;

public interface ProductDao {

	List<Product> getProducts();
	
	void eliminar(Long id);

    void registar(Product prod);

	List<Product> getProducts(int tipo, int idSubTipo);

	void delete(Long id);

	Product getProduto(Long id);
	
	List<Tuplo> getProductsByCategory(Boolean activos);

	List<Product> getProductsActivos(int tipo, int idSubTipo);
	
	List<Product> getProductsActivos(int tipo, int idSubTipo, short ordenacao);

	Boolean actualizaNovidade(Long id, Boolean val);

	Boolean actualizaActivo(Long id, Boolean val);

	List<Product> getProductsActivos(short tipo, short idSubTipo, short ordenacao, short fieldPesq, String field);
	
}
