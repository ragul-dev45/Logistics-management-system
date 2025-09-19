package com.example.Logistics.Repository;

import com.example.Logistics.Entity.Tracking;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface TrackingRepository extends JpaRepository<Tracking, Long> {
    List<Tracking> findByUsername(String username);
}
