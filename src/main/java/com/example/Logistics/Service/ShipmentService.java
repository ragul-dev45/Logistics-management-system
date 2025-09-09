package com.example.Logistics.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Logistics.DTO.ShipmentDTO;
import com.example.Logistics.DTO.ShipmentStatusCountDTO;
import com.example.Logistics.Entity.Shipment;
import com.example.Logistics.Entity.ShipmentStatus;
import com.example.Logistics.Repository.ShipmentRepository;

@Service
public class ShipmentService {
	
	@Autowired
	private ShipmentRepository repo;
	
	public List<ShipmentDTO> getAllShipments() {
        return repo.findAll()
                .stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }
	
	 public long getTotalShipments() {
	        return repo.count();
	    }
	 
	 
	 public Optional<ShipmentDTO> getShipmentById(int id) {
	        return repo.findById(id).map(this::toDTO);
	    }
	 
	  public ShipmentDTO updateShipment(ShipmentDTO shipmentDTO) {
	        Shipment shipment = toEntity(shipmentDTO);
	        Shipment updated = repo.save(shipment);
	        return toDTO(updated);
	    }

	    public void deleteShipmentById(int id) {
	        repo.deleteById(id);
	    }
	
	 public Map<String, Long> getShipmentsByStatus() {
		    List<ShipmentStatusCountDTO> list = repo.countShipmentsByStatus();
		    Map<String, Long> statusMap = new HashMap<>();
		    for (ShipmentStatusCountDTO dto : list) {
		        statusMap.put(dto.getStatus().name(), dto.getCount());
		    }
		    return statusMap;
		}
	
	 public ShipmentDTO addShipment(ShipmentDTO shipmentDTO) {
	        Shipment shipment = toEntity(shipmentDTO);
	        LocalDateTime now = LocalDateTime.now();
	        shipment.setInsertedAt(now);
	        shipment.setUpdatedAt(now);
	        Shipment saved = repo.save(shipment);
	        return toDTO(saved);
	    }

	
    private Shipment toEntity(ShipmentDTO dto) {
        Shipment shipment = new Shipment();
        if (dto.getId() != null) {
            shipment.setId(dto.getId());
        }     
        shipment.setOrigin(dto.getOrigin());
        shipment.setDestination(dto.getDestination());
        shipment.setStatus(ShipmentStatus.valueOf(dto.getStatus()));
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
        dto.setInsertedAt(shipment.getInsertedAt());
        dto.setUpdatedAt(shipment.getUpdatedAt());
        return dto;
    }
}
