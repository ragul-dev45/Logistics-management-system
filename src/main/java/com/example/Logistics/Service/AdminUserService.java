package com.example.Logistics.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.Logistics.Entity.User;
import com.example.Logistics.Repository.UserRepository;

@Service
public class AdminUserService {

    private final UserRepository userRepository;

    public AdminUserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // Get all users
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    // Save or update a user
    public User saveUser(User user) {
        return userRepository.save(user);
    }

    // Get user by id
    public Optional<User> getUserById(Long id) {
        return userRepository.findById(id);
    }

    // Delete user
    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }
}
