package com.example.teste3.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.example.teste3.models.Usuario;


public class UserPrincipal implements UserDetails{

	
	private String username;
	private String password;
	private Collection<? extends GrantedAuthority> authorities;
	
	
	public UserPrincipal(Usuario user) {
		this.username = user.getUsername();
		this.password = user.getPassword();
		
		System.out.format("user %s pass %s", user.getUsername(), user.getPassword());
		
		List<SimpleGrantedAuthority> authorities = new ArrayList();
		
		authorities = user.getProfiles().stream().map(role -> {
			return new SimpleGrantedAuthority("ROLE_".concat(role.getDescription()));
		}).collect(Collectors.toList());
		
		/*authorities = user.getRoles().stream().map(role -> {
			return new SimpleGrantedAuthority("ROLE_".concat(role.getName()));
		}).collect(Collectors.toList());
		*/
		
		this.authorities = authorities;
		
	}
	
	public static UserPrincipal create(Usuario user) {
		return new UserPrincipal(user);
	}
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.authorities;
	}

	@Override
	public String getPassword() {
		return this.password;
	}

	@Override
	public String getUsername() {
		return this.username;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

	
	
}
