package com.example.Logistics.DTO;

import java.time.LocalDate;

public class UserReportDto {
    private Double totalPaid;
    private Double pending;
    private LocalDate dueDate;
    private Boolean delivered;
    private Boolean inProgress;

    public UserReportDto(Double totalPaid, Double pending, LocalDate dueDate, Boolean delivered, Boolean inProgress) {
        this.totalPaid = totalPaid;
        this.pending = pending;
        this.dueDate = dueDate;
        this.delivered = delivered;
        this.inProgress = inProgress;
    }

    // Getters
    public Double getTotalPaid() { return totalPaid; }
    public Double getPending() { return pending; }
    public LocalDate getDueDate() { return dueDate; }
    public Boolean getDelivered() { return delivered; }
    public Boolean getInProgress() { return inProgress; }
}
