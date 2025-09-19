package com.example.Logistics.Controller;

import com.example.Logistics.DTO.UserCalendarDto;
import com.example.Logistics.Service.UserCalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class UserCalendarController {

    @Autowired
    private UserCalendarService calendarService;

    @GetMapping("/calendar")
    public String showCalendar(Model model) {
        String username = " ";
        List<UserCalendarDto> events = calendarService.getUserEvents(username);

        model.addAttribute("username", username);
        model.addAttribute("events", events);

        return "calendar"; // userCalendar.jsp
    }
}
