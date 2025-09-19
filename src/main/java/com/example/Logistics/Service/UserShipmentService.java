package com.example.Logistics.Service;

import com.example.Logistics.Entity.UserShipmentEntity;
import com.example.Logistics.Repository.UserShipmentRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserShipmentService {

    private final UserShipmentRepository repository;

    public UserShipmentService(UserShipmentRepository repository) {
        this.repository = repository;
    }

    public List<UserShipmentEntity> getShipmentsByName(String name) {
        return repository.findByName(name);
    }
}
