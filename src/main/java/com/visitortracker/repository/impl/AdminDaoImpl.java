package com.visitortracker.repository.impl;

import com.visitortracker.model.Admin;
import com.visitortracker.repository.AdminDao;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

@Repository
public class AdminDaoImpl implements AdminDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Admin findByUsernameAndPassword(String username, String password) {
        TypedQuery<Admin> query = entityManager.createQuery(
                "SELECT a FROM Admin a WHERE a.username = :username AND a.password = :password", Admin.class);
        query.setParameter("username", username);
        query.setParameter("password", password);
        return query.getResultStream().findFirst().orElse(null);
    }
}