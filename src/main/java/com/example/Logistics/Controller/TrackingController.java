package com.example.Logistics.Controller;

import com.example.Logistics.Service.TrackingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
public class TrackingController {

    @Autowired
    private TrackingService trackingService;

    @GetMapping("/tracking")
    public String trackingPage(HttpSession session, Model model) {
        String username = (String) session.getAttribute("loggedInUser");
        if (username == null) username = "guest";

        model.addAttribute("username", username);
        return "tracking"; // JSP page
    }

    @GetMapping("/tracking/status")
    @ResponseBody
    public String getTrackingStatus(HttpSession session) {
        String username = (String) session.getAttribute("loggedInUser");
        if (username == null) return "Pickup";
        return trackingService.getLatestStatus(username);
    }
}
