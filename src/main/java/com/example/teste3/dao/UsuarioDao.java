package com.example.teste3.dao;

import java.util.List;

import com.example.teste3.models.Usuario;

public interface UsuarioDao {

    List<Usuario> getUsuarios();

    void eliminar(Long id);

    void registrar(Usuario usuario);

    boolean verificarEmailPassword(Usuario usr);

    Usuario obtenerUsuarioPorCredenciales(Usuario usr);
}
