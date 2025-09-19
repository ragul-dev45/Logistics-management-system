package com.example.Logistics.Service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Logistics.DTO.UserReportDto;
import com.example.Logistics.Entity.UserReport;
import com.example.Logistics.Repository.UserReportRepository;

@Service
public class UserReportService {

    @Autowired
    private UserReportRepository reportRepository;

    public List<UserReportDto> getReportsForUser(String username) {
        List<UserReport> reports = reportRepository.findByName(username);

        return reports.stream()
                .map(r -> new UserReportDto(
                        r.getName(),
                        r.getOrigin(),
                        r.getDestination(),
                        r.getStatus(),
                        r.getEstimatedDate(),
                        r.getAmountPaid(),
                        r.getPendingAmount()
                ))
                .collect(Collectors.toList());
    }
}
