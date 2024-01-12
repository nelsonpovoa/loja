package com.example.teste3.dao;

import java.util.List;

import com.example.teste3.models.Contact;

public interface ContactDao {

	List<Contact> getItems();

	void registar(Contact contacto);

	List<Contact> getAllContactsByIdPai(Long id);

	Contact getContact(Long id);
	
}
