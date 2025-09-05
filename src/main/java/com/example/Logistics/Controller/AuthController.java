package com.example.Logistics.Controller;

import com.example.Logistics.DTO.UserDTO;
import com.example.Logistics.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
                            Model model) {
        String role = userService.login(username, password);

        if ("ADMIN".equalsIgnoreCase(role)) {
            return "redirect:/admin";
        } else if ("USER".equalsIgnoreCase(role)) {
            return "redirect:/user";
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "login";
        }
    }

    @GetMapping("/admin")
    public String adminPage() {
        return "admin"; // create admin.jsp
    }

    @GetMapping("/user")
    public String userPage() {
        return "user"; // create user.jsp
    }
}