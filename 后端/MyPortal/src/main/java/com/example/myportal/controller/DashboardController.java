package com.example.myportal.controller;

import com.example.myportal.dao.DashboardRepository;
import com.example.myportal.entity.Dashboard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/dashboard")
public class DashboardController {
    private final DashboardRepository dashboardRepository;

    @Autowired
    public DashboardController(DashboardRepository dashboardRepository) {
        this.dashboardRepository = dashboardRepository;
    }

    @GetMapping
    public List<Dashboard> getDashboard() {
        return dashboardRepository.findAll();
    }
}