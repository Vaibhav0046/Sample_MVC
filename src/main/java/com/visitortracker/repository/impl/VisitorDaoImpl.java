package com.visitortracker.repository.impl;

import com.visitortracker.model.Visitor;
import com.visitortracker.repository.VisitorDao;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Repository
public class VisitorDaoImpl implements VisitorDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void save(Visitor visitor) {
        if (visitor.getId() == null) {
            entityManager.persist(visitor);
        } else {
            entityManager.merge(visitor);
        }
    }

    @Override
    public List<Visitor> findAll() {
        TypedQuery<Visitor> query = entityManager.createQuery("SELECT v FROM Visitor v ORDER BY v.visitDate DESC", Visitor.class);
        return query.getResultList();
    }

    @Override
    public List<Visitor> search(LocalDate fromDate, LocalDate toDate, String browser) {
        StringBuilder queryString = new StringBuilder("SELECT v FROM Visitor v WHERE 1=1");
        if (fromDate != null) {
            queryString.append(" AND v.visitDate >= :fromDate");
        }
        if (toDate != null) {
            queryString.append(" AND v.visitDate <= :toDate");
        }
        if (browser != null && !browser.trim().isEmpty()) {
            queryString.append(" AND LOWER(v.browser) LIKE :browser");
        }
        queryString.append(" ORDER BY v.visitDate DESC");

        TypedQuery<Visitor> query = entityManager.createQuery(queryString.toString(), Visitor.class);
        if (fromDate != null) {
            query.setParameter("fromDate", fromDate);
        }
        if (toDate != null) {
            query.setParameter("toDate", toDate);
        }
        if (browser != null && !browser.trim().isEmpty()) {
            query.setParameter("browser", "%" + browser.toLowerCase() + "%");
        }
        return query.getResultList();
    }

    @Override
    public void deleteById(Long id) {
        Visitor visitor = entityManager.find(Visitor.class, id);
        if (visitor != null) {
            entityManager.remove(visitor);
        }
    }

    @Override
    public long countAll() {
        return entityManager.createQuery("SELECT COUNT(v) FROM Visitor v", Long.class).getSingleResult();
    }
}