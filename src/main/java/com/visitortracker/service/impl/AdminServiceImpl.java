package com.visitortracker.service.impl;

import com.visitortracker.model.Admin;
import com.visitortracker.repository.AdminDao;
import com.visitortracker.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    @Transactional(readOnly = true)
    public Admin login(String username, String password) {
        return adminDao.findByUsernameAndPassword(username, password);
    }
}