package com.example.teste3.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.teste3.models.Usuario;

@Repository
public interface UserRepository extends JpaRepository<Usuario, Long> {

    @Transactional(readOnly = true)
    Usuario findByUsername(String username);
    
    @Query("select u from Usuario u where username = :login")
    UserDetails findByLogin(@Param("login") String login);

}