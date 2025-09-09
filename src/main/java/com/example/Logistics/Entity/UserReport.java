package com.example.Logistics.Entity;

import java.time.LocalDate;

public class UserReport {
    private Long userId;
    private Double totalPaid;
    private Double pending;
    private LocalDate dueDate;
    private Boolean delivered;
    private Boolean inProgress;

    // Getters & Setters
    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }

    public Double getTotalPaid() { return totalPaid; }
    public void setTotalPaid(Double totalPaid) { this.totalPaid = totalPaid; }

    public Double getPending() { return pending; }
    public void setPending(Double pending) { this.pending = pending; }

    public LocalDate getDueDate() { return dueDate; }
    public void setDueDate(LocalDate dueDate) { this.dueDate = dueDate; }

    public Boolean getDelivered() { return delivered; }
    public void setDelivered(Boolean delivered) { this.delivered = delivered; }

    public Boolean getInProgress() { return inProgress; }
    public void setInProgress(Boolean inProgress) { this.inProgress = inProgress; }
}
