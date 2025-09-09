package com.example.Logistics.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.Logistics.DTO.UserReportDto;
import com.example.Logistics.Service.UserReportService;

@Controller
public class UserReportController {

    @Autowired
    private UserReportService reportService;

    @GetMapping("report")
    public String showReports(Model model) {
        String username = "hari"; // Hardcoded for now
        List<UserReportDto> reports = reportService.getReportsForUser(username);

        model.addAttribute("username", username);
        model.addAttribute("reports", reports);

        return "UserReports"; // goes to userReports.jsp
    }
}
