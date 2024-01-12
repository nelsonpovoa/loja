package com.example.teste3.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.teste3.models.Menu;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Repository
@Transactional
public class MenuDaoImpl implements MenuDao {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Menu> getItems() {
        String query ="From Menu where activo=true order by ordem";

        return em.createQuery(query).getResultList();

    }


}

