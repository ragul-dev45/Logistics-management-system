package com.example.Logistics.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;


import com.example.Logistics.DTO.UserReportDto;

@Service
public class UserReportService {

    public List<UserReportDto> getReportsForUser(String username) {
        // Hardcoded reports for user 'hari'
        List<UserReportDto> reports = new ArrayList<>();

        if ("hari".equalsIgnoreCase(username)) {
            reports.add(new UserReportDto(5000.0, 2000.0, LocalDate.of(2025, 9, 15), true, false));
            reports.add(new UserReportDto(3000.0, 1000.0, LocalDate.of(2025, 10, 5), false, true));
        }

        return reports;
    }
}
