package com.example.Logistics.Controller;

import com.example.Logistics.Entity.UserShipmentEntity;
import com.example.Logistics.Service.UserShipmentService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class UserShipmentController {

    private final UserShipmentService service;

    public UserShipmentController(UserShipmentService service) {
        this.service = service;
    }

    @GetMapping("/shipments")
    public String viewUserShipments(HttpSession session, Model model) {
        String username = (String) session.getAttribute("loggedInUser");
        if (username == null) {
            return "redirect:/login";
        }

        List<UserShipmentEntity> shipments = service.getShipmentsByName(username);
        model.addAttribute("shipments", shipments);
        return "user-shipments"; // JSP page
    }
}
