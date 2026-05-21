package com.visitortracker.repository;

import com.visitortracker.model.Admin;

public interface AdminDao {
    Admin findByUsernameAndPassword(String username, String password);
}