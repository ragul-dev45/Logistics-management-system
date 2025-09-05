package com.example.Logistics.Service;

import com.example.Logistics.DTO.UserDTO;
import com.example.Logistics.Entity.User;
import com.example.Logistics.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    // Register user
    public String registerUser(UserDTO dto) {
        if (userRepository.findByUsername(dto.getUsername()) != null) {
            return "Username already exists";
        }
        if (userRepository.findByEmail(dto.getEmail()) != null) {
            return "Email already exists";
        }
        if (!dto.getPassword().equals(dto.getConfirmPassword())) {
            return "Passwords do not match";
        }

        User user = new User();
        user.setUsername(dto.getUsername());
        user.setEmail(dto.getEmail());
        user.setPassword(passwordEncoder.encode(dto.getPassword()));
        user.setRole("USER");
        userRepository.save(user);

        return "success";
    }

    // Login
    public String login(String username, String password) {
        User user = userRepository.findByUsername(username);
        if (user != null && passwordEncoder.matches(password, user.getPassword())) {
            return user.getRole(); // ADMIN or USER
        }
        return "INVALID";
    }
}
