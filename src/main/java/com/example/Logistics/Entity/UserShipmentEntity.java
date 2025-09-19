package com.example.Logistics.Entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "user_shipment")
public class UserShipmentEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String name; // logged-in user

    @Column(nullable = false)
    private String origin;

    @Column(nullable = false)
    private String destination;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ShipmentStatus status;

    @Column(nullable = false)
    private LocalDate estimatedDate;

    // ---------- Constructors ----------
    public UserShipmentEntity() {}

    public UserShipmentEntity(int id, String name, String origin, String destination,
                              ShipmentStatus status, LocalDate estimatedDate) {
        this.id = id;
        this.name = name;
        this.origin = origin;
        this.destination = destination;
        this.status = status;
        this.estimatedDate = estimatedDate;
    }

    // ---------- Getters & Setters ----------
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getOrigin() { return origin; }
    public void setOrigin(String origin) { this.origin = origin; }

    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }

    public ShipmentStatus getStatus() { return status; }
    public void setStatus(ShipmentStatus status) { this.status = status; }

    public LocalDate getEstimatedDate() { return estimatedDate; }
    public void setEstimatedDate(LocalDate estimatedDate) { this.estimatedDate = estimatedDate; }
}
