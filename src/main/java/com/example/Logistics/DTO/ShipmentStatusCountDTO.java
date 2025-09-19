package com.example.Logistics.DTO;

import com.example.Logistics.Entity.ShipmentStatus;

public class ShipmentStatusCountDTO {
	
	private ShipmentStatus status;
	private Long count;
	
	public ShipmentStatusCountDTO() {
		// TODO Auto-generated constructor stub
	}

	public ShipmentStatusCountDTO(ShipmentStatus status, Long count) {
		super();
		this.status = status;
		this.count = count;
	}

	public ShipmentStatus getStatus() {
		return status;
	}

	public Long getCount() {
		return count;
	}
	
}
