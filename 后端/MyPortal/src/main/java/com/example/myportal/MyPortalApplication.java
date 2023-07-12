package com.example.myportal;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

//@SpringBootApplication
//public class MyPortalApplication {
//
//    public static void main(String[] args) {
//        SpringApplication.run(MyPortalApplication.class, args);
//    }
//}
//
//@RestController
//class AdminController {
//
//    @Autowired
//    private JdbcTemplate jdbcTemplate;
//
//    @GetMapping("/admin/dashboard")
//    public List<Map<String, Object>> getDashboard() {
//        String query = "SELECT * FROM dashboard";
//        return jdbcTemplate.queryForList(query);
//    }
//
//    @GetMapping("/admin/products")
//    public List<Map<String, Object>> getProducts() {
//        String query = "SELECT * FROM products";
//        return jdbcTemplate.queryForList(query);
//    }
//
//    @GetMapping("/admin/messages")
//    public List<Map<String, Object>> getMessages() {
//        String query = "SELECT * FROM messages";
//        return jdbcTemplate.queryForList(query);
//    }
//}

@SpringBootApplication
public class MyPortalApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyPortalApplication.class, args);
    }

}
