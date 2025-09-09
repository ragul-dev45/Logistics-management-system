package com.example.Logistics.DTO;

import java.time.LocalDateTime;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@EqualsAndHashCode
public class ShipmentDTO {
	
	 	private Integer id;
	 	@NotBlank(message = "Origin should not be empty")
	    private String origin;
	 	@NotBlank(message = "Destination should not be empty")
	    private String destination;
	 	@NotBlank(message = "Status should not be empty")
	    private String status;
	 	private LocalDateTime insertedAt;
	 	private LocalDateTime updatedAt;
}
