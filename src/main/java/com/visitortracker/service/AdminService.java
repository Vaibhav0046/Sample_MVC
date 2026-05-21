package com.visitortracker.service;

import com.visitortracker.model.Admin;

public interface AdminService {
    Admin login(String username, String password);
}