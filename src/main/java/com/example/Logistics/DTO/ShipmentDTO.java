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
import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public class ShipmentDTO {

    private Integer id;

    @NotBlank(message = "Origin should not be empty")
    private String origin;

    @NotBlank(message = "Destination should not be empty")
    private String destination;

    @NotBlank(message = "Status should not be empty")
    private String status;

    @NotBlank(message = "Name should not be empty")
    private String name;

    @NotNull(message = "Date should not be empty")
    private LocalDate estimatedDate;

    private LocalDateTime insertedAt;
    private LocalDateTime updatedAt;

    // ---------- Constructors ----------
    public ShipmentDTO() {
    }

    public ShipmentDTO(Integer id, String origin, String destination, String status,
                       String name, LocalDate estimatedDate,
                       LocalDateTime insertedAt, LocalDateTime updatedAt) {
        this.id = id;
        this.origin = origin;
        this.destination = destination;
        this.status = status;
        this.name = name;
        this.estimatedDate = estimatedDate;
        this.insertedAt = insertedAt;
        this.updatedAt = updatedAt;
    }

    // ---------- Getters & Setters ----------
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getEstimatedDate() {
        return estimatedDate;
    }

    public void setEstimatedDate(LocalDate estimatedDate) {
        this.estimatedDate = estimatedDate;
    }

    public LocalDateTime getInsertedAt() {
        return insertedAt;
    }

    public void setInsertedAt(LocalDateTime insertedAt) {
        this.insertedAt = insertedAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    // ---------- equals & hashCode ----------
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ShipmentDTO)) return false;
        ShipmentDTO that = (ShipmentDTO) o;
        return id != null && id.equals(that.id);
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
