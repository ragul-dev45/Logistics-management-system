package com.example.Logistics.DTO;

public class UserCalendarDto {
    private String title;
    private String date; // YYYY-MM-DD
    private String status; // Delivered, Pending, In Progress

    public UserCalendarDto() {}

    public UserCalendarDto(String title, String date, String status) {
        this.title = title;
        this.date = date;
        this.status = status;
    }

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}
