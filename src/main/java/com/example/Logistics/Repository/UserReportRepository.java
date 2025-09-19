package com.example.Logistics.Repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.Logistics.Entity.UserReport;

@Repository
public interface UserReportRepository extends JpaRepository<UserReport, Long> {
    List<UserReport> findByName(String name); // filter by logged-in user
}
