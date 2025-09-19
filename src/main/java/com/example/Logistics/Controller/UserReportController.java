package com.example.Logistics.Controller;

import java.util.List;
import jakarta.servlet.http.HttpSession;

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

    @GetMapping("/report")
    public String showReports(HttpSession session, Model model) {
        // Get logged-in username from session (from UserDashboard login)
        String username = (String) session.getAttribute("loggedInUser");

        if (username == null) {
            // Session expired or not logged in
            return "redirect:/login";
        }

        // Fetch reports for this user
        List<UserReportDto> reports = reportService.getReportsForUser(username);
        model.addAttribute("reports", reports);

        return "UserReports"; // JSP page
    }
}
