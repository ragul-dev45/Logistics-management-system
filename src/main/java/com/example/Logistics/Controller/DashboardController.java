package com.example.Logistics.Controller;

import com.example.Logistics.DTO.UserDTO;
import com.example.Logistics.Service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class DashboardController {

    @Autowired
    private UserService userService;

    // Dashboard
    @GetMapping("/")
    public String dashboard() {
        return "dashboard";
    }

}