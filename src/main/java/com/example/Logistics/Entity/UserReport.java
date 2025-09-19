package com.example.Logistics.Entity;

import java.time.LocalDate;
import jakarta.persistence.*;

@Entity
@Table(name = "userreport") // updated table name
@Access(AccessType.FIELD)
public class UserReport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "origin")
    private String origin;

    @Column(name = "destination")
    private String destination;

    @Column(name = "status")
    private String status;

    @Column(name = "estimated_date")
    private LocalDate estimatedDate;

    @Column(name = "amount_paid")
    private Double amountPaid;

    @Column(name = "pending_amount")
    private Double pendingAmount;

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getOrigin() { return origin; }
    public void setOrigin(String origin) { this.origin = origin; }

    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public LocalDate getEstimatedDate() { return estimatedDate; }
    public void setEstimatedDate(LocalDate estimatedDate) { this.estimatedDate = estimatedDate; }

    public Double getAmountPaid() { return amountPaid; }
    public void setAmountPaid(Double amountPaid) { this.amountPaid = amountPaid; }

    public Double getPendingAmount() { return pendingAmount; }
    public void setPendingAmount(Double pendingAmount) { this.pendingAmount = pendingAmount; }
}
