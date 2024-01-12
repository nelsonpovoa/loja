package com.example.teste3.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.teste3.dao.UsuarioDao;
import com.example.teste3.models.Usuario;
import com.example.teste3.utils.JWTUtil2;

@RestController
public class AuthController {

    @Autowired
    private UsuarioDao ud;

    @Autowired
    JWTUtil2 jwtUtil;

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(@RequestBody Usuario usr) {

        Usuario usr2 = ud.obtenerUsuarioPorCredenciales(usr);

        if(usr2 != null) {
            String token = jwtUtil.create(String.valueOf(usr2.getId()), usr2.getEmail());
            return token;
        }else {
            return "FAIL";
        }

    }
}
