package com.example.teste3.configs;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.example.teste3.models.Usuario;
import com.example.teste3.models.enums.ProfileEnum;
import com.example.teste3.models.enums.TipoEnum;
import com.example.teste3.repository.UserRepository;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@Component
public class LoginSucesso extends SavedRequestAwareAuthenticationSuccessHandler {
	@Autowired
	private UserRepository userRepository;
	
	@Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws ServletException, IOException {

		// pega o login do usuário logado
		String login = authentication.getName(); 
		// busca o usuário no banco pelo login
		Usuario usuario = userRepository.findByUsername(login);	
		
		String redirectURL = "";
		if (temAutorizacao(usuario, "ADMIN")) {
            redirectURL = "/auth/admin/admin-index";
        } else if (temAutorizacao(usuario, "USER")) {
            redirectURL = "/auth/user/user-index";
        } else if (temAutorizacao(usuario, "BIBLIOTECARIO")) {
            redirectURL = "/auth/biblio/biblio-index";
        }		
        response.sendRedirect(redirectURL);         
    }
	/**
	 * Método que verifica qual papel o usuário tem na aplicação 
	 * */
	private boolean temAutorizacao(Usuario usuario, String papel) {
		for (ProfileEnum pp : usuario.getProfiles()) {
			if (pp.getDescription().equals(papel)) {
				return true;
			}
	    }
		return false;
	}
}

