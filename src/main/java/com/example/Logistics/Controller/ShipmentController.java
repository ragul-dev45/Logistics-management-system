package com.example.Logistics.Controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.Logistics.DTO.ShipmentDTO;
import com.example.Logistics.Service.ShipmentService;

import jakarta.validation.Valid;

@Controller
public class ShipmentController {
	
	@Autowired
	private ShipmentService service;
	
	
	@GetMapping("/adminHome")
	public String adminHome(Model model) {
	    long totalShipments = service.getTotalShipments();
	    Map<String, Long> shipmentStatusCounts = service.getShipmentsByStatus();

	    model.addAttribute("totalShipments", totalShipments);
	    model.addAttribute("shipmentStatusCounts", shipmentStatusCounts);

	    return "adminHome";
	}
	@GetMapping("/shipmentList")
	public String shipmentLists(Model model) {
		List<ShipmentDTO> shipments = service.getAllShipments();
		model.addAttribute("shipments", shipments);
        return "shipmentList";
	}
	
	@GetMapping("/shipments/new")
	 public String showAddForm(Model model) {
        model.addAttribute("shipmentDTO", new ShipmentDTO());
        return "shipmentform";
    }
	
	@PostMapping("/shipments/new")
    public String addShipment(@Valid @ModelAttribute ShipmentDTO shipmentDTO,BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "shipmentform";
        }
        service.addShipment(shipmentDTO);
        return "redirect:/shipmentList";
    }
	
    @GetMapping("/shipments/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model) {
        Optional<ShipmentDTO> shipmentOpt = service.getShipmentById(id);
        if (shipmentOpt.isPresent()) {
            model.addAttribute("shipmentDTO", shipmentOpt.get());
            return "shipmentform";  // Reuse the same form for add/edit
        } else {
            return "redirect:/shipmentList";
        }
    }

    @PostMapping("/shipments/edit/{id}")
    public String updateShipment(@PathVariable("id") int id, @Valid @ModelAttribute ShipmentDTO shipmentDTO, BindingResult result) {
    	
    	 if (!service.getShipmentById(id).isPresent()) {
    	        return "redirect:/shipmentList"; 
    	 }
    	 
        if (result.hasErrors()) {
            return "shipmentform";
        }
        shipmentDTO.setId(id); // Ensure ID is set for update
        service.updateShipment(shipmentDTO);
        return "redirect:/shipmentList";
    }

    // --- Delete Method ---

    @GetMapping("/shipments/delete/{id}")
    public String deleteShipment(@PathVariable("id") int id) {
        service.deleteShipmentById(id);
        return "redirect:/shipmentList";
    }
	
}
