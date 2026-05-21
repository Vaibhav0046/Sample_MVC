package com.visitortracker.controller;

import com.visitortracker.model.Visitor;
import com.visitortracker.service.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequestMapping("/visitor")
public class VisitorController {

    @Autowired
    private VisitorService visitorService;

    @GetMapping("/list")
    public String listVisitors(HttpServletRequest request, Model model) {
        if (request.getSession().getAttribute("adminUser") == null) {
            return "redirect:/admin/login";
        }
        model.addAttribute("visitors", visitorService.findAll());
        return "visitor-list";
    }

    @PostMapping("/search")
    public String searchVisitors(HttpServletRequest request,
                                 @RequestParam(required = false) String fromDate,
                                 @RequestParam(required = false) String toDate,
                                 @RequestParam(required = false) String browser,
                                 Model model) {
        if (request.getSession().getAttribute("adminUser") == null) {
            return "redirect:/admin/login";
        }
        LocalDate from = parseDate(fromDate);
        LocalDate to = parseDate(toDate);
        List<Visitor> visitors = visitorService.search(from, to, browser);
        model.addAttribute("visitors", visitors);
        model.addAttribute("fromDate", fromDate);
        model.addAttribute("toDate", toDate);
        model.addAttribute("browser", browser);
        return "visitor-list";
    }

    @GetMapping("/delete")
    public String deleteVisitor(HttpServletRequest request, @RequestParam Long id) {
        if (request.getSession().getAttribute("adminUser") == null) {
            return "redirect:/admin/login";
        }
        visitorService.deleteById(id);
        return "redirect:/visitor/list";
    }

    @GetMapping("/new")
    public String showAddForm(HttpServletRequest request, Model model) {
        if (request.getSession().getAttribute("adminUser") == null) {
            return "redirect:/admin/login";
        }
        model.addAttribute("visitor", new Visitor());
        return "visitor-form";
    }

    @PostMapping("/save")
    public String saveVisitor(HttpServletRequest request, Visitor visitor) {
        if (request.getSession().getAttribute("adminUser") == null) {
            return "redirect:/admin/login";
        }
        if (visitor.getVisitDate() == null) {
            visitor.setVisitDate(LocalDate.now());
        }
        visitorService.save(visitor);
        return "redirect:/visitor/list";
    }

    private LocalDate parseDate(String date) {
        if (date == null || date.trim().isEmpty()) {
            return null;
        }
        return LocalDate.parse(date, DateTimeFormatter.ISO_DATE);
    }
}