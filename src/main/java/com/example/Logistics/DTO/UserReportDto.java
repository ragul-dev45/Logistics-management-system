package com.example.Logistics.DTO;

import java.time.LocalDate;

public class UserReportDto {

    private String name;
    private String origin;
    private String destination;
    private String status;
    private LocalDate estimatedDate;
    private Double amountPaid;
    private Double pendingAmount;

    public UserReportDto(String name, String origin, String destination, String status,
                         LocalDate estimatedDate, Double amountPaid, Double pendingAmount) {
        this.name = name;
        this.origin = origin;
        this.destination = destination;
        this.status = status;
        this.estimatedDate = estimatedDate;
        this.amountPaid = amountPaid;
        this.pendingAmount = pendingAmount;
    }

    // Getters
    public String getName() { return name; }
    public String getOrigin() { return origin; }
    public String getDestination() { return destination; }
    public String getStatus() { return status; }
    public LocalDate getEstimatedDate() { return estimatedDate; }
    public Double getAmountPaid() { return amountPaid; }
    public Double getPendingAmount() { return pendingAmount; }
}
