package com.visitortracker.repository;

import com.visitortracker.model.Visitor;

import java.time.LocalDate;
import java.util.List;

public interface VisitorDao {
    void save(Visitor visitor);
    List<Visitor> findAll();
    List<Visitor> search(LocalDate fromDate, LocalDate toDate, String browser);
    void deleteById(Long id);
    long countAll();
}