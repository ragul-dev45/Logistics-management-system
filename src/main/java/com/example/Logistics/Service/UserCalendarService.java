package com.example.Logistics.Service;

import com.example.Logistics.DTO.UserCalendarDto;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserCalendarService {

    public List<UserCalendarDto> getUserEvents(String username) {
        // Hardcoded events for demonstration
        List<UserCalendarDto> events = new ArrayList<>();
        events.add(new UserCalendarDto("Shipment #101", "2025-09-10", "Pending"));
        events.add(new UserCalendarDto("Shipment #102", "2025-09-12", "Delivered"));
        events.add(new UserCalendarDto("Shipment #103", "2025-09-15", "In Progress"));
        events.add(new UserCalendarDto("Follow-up Call", "2025-09-18", "Pending"));

        return events;
    }
}
