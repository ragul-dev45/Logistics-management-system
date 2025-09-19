package com.example.Logistics.Controller;

import com.example.Logistics.Entity.User;
import com.example.Logistics.Service.AdminUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/users")
public class AdminUserController {

    private final AdminUserService adminUserService;

    public AdminUserController(AdminUserService adminUserService) {
        this.adminUserService = adminUserService;
    }

    // List all users
    @GetMapping
    public String listUsers(Model model) {
        model.addAttribute("users", adminUserService.getAllUsers());
        return "manageUsers";
    }

    // Show add user form
    @GetMapping("/add")
    public String showAddUserForm(Model model) {
        model.addAttribute("user", new User());
        return "addUser";
    }

    // Save new user
    @PostMapping("/add")
    public String saveUser(@ModelAttribute("user") User user) {
        adminUserService.saveUser(user);
        return "redirect:/users";
    }

    // Show edit form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("user", adminUserService.getUserById(id).orElseThrow());
        return "editUser";
    }

    // Update user
    @PostMapping("/edit/{id}")
    public String updateUser(@PathVariable Long id, @ModelAttribute("user") User user) {
        user.setId(id); // ensure ID is preserved
        adminUserService.saveUser(user);
        return "redirect:/users";
    }

    // Delete user
    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        adminUserService.deleteUser(id);
        return "redirect:/users";
    }
}
