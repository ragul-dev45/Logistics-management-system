package com.example.Logistics.Service;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.stream.Collectors;

//import org.hibernate.mapping.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Logistics.DTO.ShipmentDTO;
import com.example.Logistics.DTO.ShipmentStatusCountDTO;
import com.example.Logistics.Entity.Shipment;
import com.example.Logistics.Entity.ShipmentStatus;
import com.example.Logistics.Repository.AdminReportRepository;
@Service
public class AdminReportService {
	
	  @Autowired
	    private AdminReportRepository repo;
	
	
	public Map<String, Long> getShipmentsByStatus() {
	    List<ShipmentStatusCountDTO> list = repo.countShipmentsByStatus();
	    Map<String, Long> statusMap = new HashMap<>();
	    for (ShipmentStatusCountDTO dto : list) {
	        statusMap.put(dto.getStatus().name(), dto.getCount());
	    }
	    return statusMap;
	}
	public Map<String, Long> getShipmentCountByStatus() {
	    return repo.findAll().stream()
	            .collect(Collectors.groupingBy(
	                s -> s.getStatus().name(), // Group by status (enum name)
	                Collectors.counting()));
	}
 public List<ShipmentDTO> getShipmentByDateRange(LocalDate startDate, LocalDate endDate) {
	    // Get the shipments from the repository
	    List<Shipment> shipments = repo.findByEstimatedDateBetween(startDate, endDate);

	    // Convert each shipment to its corresponding DTO
	    List<ShipmentDTO> dtos = new ArrayList<>();
	    for (Shipment s : shipments) {
	        dtos.add(toDTO(s));  // Use your converter here
	    }

	    // Return the list of ShipmentDTOs
	    return dtos;
	}
 private Shipment toEntity(ShipmentDTO dto) {
     Shipment shipment = new Shipment();
     if (dto.getId() != null) {
         shipment.setId(dto.getId());
     }     
     shipment.setOrigin(dto.getOrigin());
     shipment.setDestination(dto.getDestination());
     shipment.setStatus(ShipmentStatus.valueOf(dto.getStatus()));
     shipment.setName(dto.getName());
     shipment.setEstimatedDate(dto.getEstimatedDate());
     shipment.setInsertedAt(dto.getInsertedAt());
     shipment.setUpdatedAt(dto.getUpdatedAt());
     return shipment;
 }

 // Helper: Convert Entity to DTO
 private ShipmentDTO toDTO(Shipment shipment) {
     ShipmentDTO dto = new ShipmentDTO();
     dto.setId(shipment.getId());
     dto.setOrigin(shipment.getOrigin());
     dto.setDestination(shipment.getDestination());
     dto.setStatus(shipment.getStatus().name());
     dto.setName(shipment.getName());
     dto.setEstimatedDate(shipment.getEstimatedDate());
     dto.setInsertedAt(shipment.getInsertedAt());
     dto.setUpdatedAt(shipment.getUpdatedAt());
     return dto;
 }

 
 public Map<String, Long> getMonthlyShipmentSummary(YearMonth yearMonth) {
     LocalDate firstDayOfMonth = yearMonth.atDay(1);
     LocalDate lastDayOfMonth = yearMonth.atEndOfMonth();

     List<Shipment> shipments = repo.findByEstimatedDateBetween(firstDayOfMonth, lastDayOfMonth);

     return shipments.stream()
             .collect(Collectors.groupingBy(s -> s.getEstimatedDate().toString(), Collectors.counting()));
 }
 
}
