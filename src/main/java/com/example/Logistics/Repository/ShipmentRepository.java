package com.example.Logistics.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.Logistics.DTO.ShipmentStatusCountDTO;
import com.example.Logistics.Entity.Shipment;

public interface ShipmentRepository extends JpaRepository<Shipment, Integer>{
	
	
	 @Query("SELECT new com.example.Logistics.DTO.ShipmentStatusCountDTO(s.status, COUNT(s)) FROM Shipment s GROUP BY s.status")
	    List<ShipmentStatusCountDTO> countShipmentsByStatus();
	
}
