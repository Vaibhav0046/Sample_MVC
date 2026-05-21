package com.visitortracker.service;

import com.visitortracker.model.Visitor;

import java.time.LocalDate;
import java.util.List;

public interface VisitorService {
    void save(Visitor visitor);
    List<Visitor> findAll();
    List<Visitor> search(LocalDate fromDate, LocalDate toDate, String browser);
    void deleteById(Long id);
    long countAll();
}