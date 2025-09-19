package com.example.Logistics.Controller;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;   // ✅ Correct import
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Logistics.DTO.ShipmentDTO;
import com.example.Logistics.Service.AdminReportService;

@Controller
public class AdminReport {
    @Autowired
    private AdminReportService service;

    private void addDefaultMonthlyReport(Model model) {
        YearMonth currentMonth = YearMonth.now();
        Map<String, Long> monthlySummary = service.getMonthlyShipmentSummary(currentMonth);
        model.addAttribute("monthlySummary", monthlySummary);
        model.addAttribute("monthlySummaryMonth", currentMonth.toString());
        model.addAttribute("month", currentMonth.toString());
    }

    @GetMapping("/reports")
    public String showReports(@RequestParam(value = "month", required = false) String month, Model model) {
        YearMonth selectedMonth;
        if (month != null && !month.isEmpty()) {
            selectedMonth = YearMonth.parse(month);
        } else {
            selectedMonth = YearMonth.now();
        }

        Map<String, Long> monthlySummary = service.getMonthlyShipmentSummary(selectedMonth);
        model.addAttribute("monthlySummary", monthlySummary);
        model.addAttribute("monthlySummaryMonth", selectedMonth.toString());
        model.addAttribute("month", selectedMonth.toString());

        return "Adminreport";
    }

    @GetMapping("/reports/byStatus")
    public String showReportByStatus(Model model) {
        Map<String, Long> statusCounts = service.getShipmentCountByStatus();
        model.addAttribute("statusCounts", statusCounts);

        addDefaultMonthlyReport(model);

        return "Adminreport";
    }

    @GetMapping("/reports/byDateRange")
    public String showDateRangeForm(Model model) {
        model.addAttribute("showDateForm", true);

        addDefaultMonthlyReport(model);

        return "Adminreport";
    }

    @PostMapping("/reports/byDateRange")
    public String generateDateRangeReport(
        @RequestParam("startDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
        @RequestParam("endDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
        Model model) {

        List<ShipmentDTO> shipments = service.getShipmentByDateRange(startDate, endDate);
        model.addAttribute("showDateForm", true);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("shipments", shipments);

        addDefaultMonthlyReport(model);

        return "Adminreport";
    }
}
