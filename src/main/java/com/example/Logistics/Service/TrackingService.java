package com.example.Logistics.Service;

import com.example.Logistics.DTO.TrackingDto;
import com.example.Logistics.Entity.Tracking;
import com.example.Logistics.Repository.TrackingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class TrackingService {

    @Autowired
    private TrackingRepository trackingRepository;

    public List<TrackingDto> getTrackingForUser(String username) {
        List<Tracking> list = trackingRepository.findByUsername(username);
        return list.stream()
                .map(t -> new TrackingDto(t.getTrackingNumber(), t.getStatus()))
                .collect(Collectors.toList());
    }

    public String getLatestStatus(String username) {
        List<Tracking> list = trackingRepository.findByUsername(username);
        if (list.isEmpty()) return "Pickup";
        return list.get(list.size() - 1).getStatus();
    }
}
