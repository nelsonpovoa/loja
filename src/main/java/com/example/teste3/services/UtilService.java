package com.example.teste3.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.teste3.models.Usuario;
import com.example.teste3.repository.UserRepository;

@Service
public class UtilService {

	@Autowired
	private UserRepository userRepository;

	public List<Usuario> findAll() {
		return userRepository.findAll();
	}

	public Optional<Usuario> getUsuarioById(Long id) {
		return userRepository.findById(id);
	}

	public void create(Usuario util) {
		// TODO Auto-generated method stub
		userRepository.save(util);
	}
}
