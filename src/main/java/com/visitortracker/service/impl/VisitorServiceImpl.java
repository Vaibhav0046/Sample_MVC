package com.visitortracker.service.impl;

import com.visitortracker.model.Visitor;
import com.visitortracker.repository.VisitorDao;
import com.visitortracker.service.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
public class VisitorServiceImpl implements VisitorService {

    @Autowired
    private VisitorDao visitorDao;

    @Override
    @Transactional
    public void save(Visitor visitor) {
        visitorDao.save(visitor);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Visitor> findAll() {
        return visitorDao.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Visitor> search(LocalDate fromDate, LocalDate toDate, String browser) {
        return visitorDao.search(fromDate, toDate, browser);
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        visitorDao.deleteById(id);
    }

    @Override
    @Transactional(readOnly = true)
    public long countAll() {
        return visitorDao.countAll();
    }
}