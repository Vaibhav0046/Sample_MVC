package com.visitortracker.controller;

import com.visitortracker.service.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DashboardController {

    @Autowired
    private VisitorService visitorService;

    @GetMapping({"/", "/dashboard"})
    public String showDashboard(HttpServletRequest request, Model model) {
        if (request.getSession().getAttribute("adminUser") == null) {
            return "redirect:/admin/login";
        }
        model.addAttribute("totalVisitors", visitorService.countAll());
        return "dashboard";
    }
}