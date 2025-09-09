package com.example.Logistics.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Logistics.DTO.UserDTO;
import com.example.Logistics.Service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    // Show login page
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    // Show registration page
    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("userDTO", new UserDTO());
        return "register";
    }

    // Handle registration
    @PostMapping("/register")
    public String registerUser(@ModelAttribute("userDTO") UserDTO dto, Model model) {
        String result = userService.registerUser(dto);
        if ("success".equals(result)) {
            model.addAttribute("success", "Registration successful! Please login.");
            return "login";
        } else {
            model.addAttribute("error", result);
            return "register";
        }
    }

    // Handle login
    @PostMapping("/login")
    public String loginUser(@RequestParam String username,
                            @RequestParam String password,
                            HttpSession session,
                            Model model) {
        String role = userService.login(username, password);

        if ("ADMIN".equalsIgnoreCase(role) || "USER".equalsIgnoreCase(role)) {
            // store username in session
            session.setAttribute("loggedInUser", username);
            return "userdashboard";  // redirect to user dashboard
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "login";
        }
    }

    // Dashboard
    @GetMapping("/dashboard")
    public String dashboard() {
        return "dashboard";
    }
    @GetMapping("/shipments")
    public String shipments() {
        return "shipments";
    }
    @GetMapping("/about")
    public String about() {
        return "about";
    }
    
}
