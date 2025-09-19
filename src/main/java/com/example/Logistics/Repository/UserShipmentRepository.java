package com.example.Logistics.Repository;

import com.example.Logistics.Entity.UserShipmentEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface UserShipmentRepository extends JpaRepository<UserShipmentEntity, Integer> {
    List<UserShipmentEntity> findByName(String name); // fetch shipments for a specific user
}
