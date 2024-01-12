package com.example.teste3.dao;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

import org.springframework.transaction.annotation.Transactional;

import com.example.teste3.models.Usuario;

import java.util.List;

@Repository
@Transactional
public class UsuarioDaoImpl implements UsuarioDao {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Usuario> getUsuarios() {
        String query ="From Usuario";

        return em.createQuery(query).getResultList();

    }

    @Override
    public void eliminar(Long id) {
        Usuario u = em.find(Usuario.class, id);
        em.remove(u);
    }

    @Override
    public void registrar(Usuario usuario) {
        em.merge(usuario);
    }

    @Override
    public boolean verificarEmailPassword(Usuario usr) {
        //String query = "FROM Usuario WHERE email='"+usr.getEmail()+"' AND password='"+usr.getPassword()+"'";
        String query = "FROM Usuario WHERE email= :email "; // AND password= :pass
        List<Usuario> lista = em.createQuery(query)
                .setParameter("email", usr.getEmail())
                //.setParameter("pass", usr.getPassword())
                .getResultList();

        if(lista.isEmpty()) {
            return false;
        }

        String passHash = lista.get(0).getPassword();

        Argon2 argon2 = Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2i);
        boolean lapasswordEsLaMisma = argon2.verify(passHash, usr.getPassword());

        /*
        if (lista.isEmpty()){
            return false;
        }else{
            return true;
        }*/

        //return !lista.isEmpty();
        return lapasswordEsLaMisma;
    }

    @Override
    public Usuario obtenerUsuarioPorCredenciales(Usuario usr) {
        String query = "FROM Usuario WHERE email= :email "; // AND password= :pass
        List<Usuario> lista = em.createQuery(query)
                .setParameter("email", usr.getEmail())
                //.setParameter("pass", usr.getPassword())
                .getResultList();

        if(lista.isEmpty()) {
            return null;
        }

        String passHash = lista.get(0).getPassword();

        Argon2 argon2 = Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2i);
        boolean lapasswordEsLaMisma = argon2.verify(passHash, usr.getPassword());


        if (lapasswordEsLaMisma){
            return lista.get(0);
        }

        return null;
    }
}

