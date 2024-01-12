package com.example.teste3.services;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.teste3.models.Usuario;
import com.example.teste3.models.enums.ProfileEnum;
import com.example.teste3.repository.UserRepository;
import com.example.teste3.security.UserSpringSecurity;
import com.example.teste3.security.exceptions.AuthorizationException;
import com.example.teste3.security.exceptions.DataBindingViolationException;
import com.example.teste3.security.exceptions.ObjectNotFoundException;


//@Configuration
public class UserService {

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
	@Autowired
	private UserRepository userRepository;

	public Usuario findById(Long id) {
		UserSpringSecurity userSpringSecurity = authenticated();
		if (!Objects.nonNull(userSpringSecurity)
				|| !userSpringSecurity.hasRole(ProfileEnum.ADMIN) && !id.equals(userSpringSecurity.getId()))
			throw new AuthorizationException("Acesso negado!");

		Optional<Usuario> user = this.userRepository.findById(id);
		return user.orElseThrow(() -> new ObjectNotFoundException(
				"Usuário não encontrado! Id: " + id + ", Tipo: " + Usuario.class.getName()));
	}

	@Transactional
	public Usuario create(Usuario obj) {
		obj.setId(null);
		obj.setPassword(this.bCryptPasswordEncoder.encode(obj.getPassword()));
		obj.setProfiles(Stream.of(ProfileEnum.USER.getCode()).collect(Collectors.toSet()));
		obj = this.userRepository.save(obj);
		return obj;
	}

	@Transactional
	public Usuario update(Usuario obj) {
		Usuario newObj = findById(obj.getId());
		newObj.setPassword(obj.getPassword());
		newObj.setPassword(this.bCryptPasswordEncoder.encode(obj.getPassword()));
		return this.userRepository.save(newObj);
	}

	public void delete(Long id) {
		findById(id);
		try {
			this.userRepository.deleteById(id);
		} catch (Exception e) {
			throw new DataBindingViolationException("Não é possível excluir pois há entidades relacionadas!");
		}
	}

	public static UserSpringSecurity authenticated() {
		try {
			return (UserSpringSecurity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		} catch (Exception e) {
			return null;
		}
	}

	public List<Usuario> findAll() {
		return userRepository.findAll();
	}
}
