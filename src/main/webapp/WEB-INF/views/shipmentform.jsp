<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.Logistics.DTO.ShipmentDTO" %>

<%
    ShipmentDTO shipmentDTO = (ShipmentDTO) request.getAttribute("shipmentDTO");
    boolean isEdit = (shipmentDTO != null && shipmentDTO.getId() != null);
%>

<html>
<head>
    <title><%= isEdit ? "Edit Shipment" : "Add New Shipment" %></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #47c7ab;
            margin: 40px;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        form {
            background: #cfc25f;
            padding: 25px 30px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            max-width: 400px;
        }
        div {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #555;
        }
        input[type="text"],
        input[type="date"],
        select {
            width: 100%;
            padding: 8px 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }
        input:focus, select:focus {
            border-color: #007bff;
            outline: none;
        }
        button {
            background-color: #007bff;
            border: none;
            padding: 10px 18px;
            color: white;
            font-weight: 600;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<h2><%= isEdit ? "Edit Shipment" : "Add New Shipment" %></h2>

<form method="POST" action="<%= isEdit ? ("/shipments/edit/" + shipmentDTO.getId()) : "/shipments/new" %>">

    <% if (isEdit) { %>
        <input type="hidden" name="id" value="<%= shipmentDTO.getId() %>" />
    <% } %>

    <div>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= shipmentDTO != null && shipmentDTO.getName() != null ? shipmentDTO.getName() : "" %>" />
    </div>

    <div>
        <label for="origin">Origin:</label>
        <input type="text" id="origin" name="origin" value="<%= shipmentDTO != null && shipmentDTO.getOrigin() != null ? shipmentDTO.getOrigin() : "" %>" />
    </div>

    <div>
        <label for="destination">Destination:</label>
        <input type="text" id="destination" name="destination" value="<%= shipmentDTO != null && shipmentDTO.getDestination() != null ? shipmentDTO.getDestination() : "" %>" />
    </div>

    <div>
        <label for="estimatedDate">Estimated Date:</label>
        <input type="date" id="estimatedDate" name="estimatedDate"
               value="<%= shipmentDTO != null && shipmentDTO.getEstimatedDate() != null ? shipmentDTO.getEstimatedDate().toString() : "" %>" />
    </div>

    <div>
        <label for="status">Status:</label>
        <select id="status" name="status">
            <option value="">--Select--</option>
            <option value="PENDING" <%= shipmentDTO != null && "PENDING".equals(shipmentDTO.getStatus()) ? "selected" : "" %>>Pending</option>
            <option value="IN_TRANSIT" <%= shipmentDTO != null && "IN_TRANSIT".equals(shipmentDTO.getStatus()) ? "selected" : "" %>>In Transit</option>
            <option value="DELIVERED" <%= shipmentDTO != null && "DELIVERED".equals(shipmentDTO.getStatus()) ? "selected" : "" %>>Delivered</option>
        </select>
    </div>

    <div>
        <button type="submit"><%= isEdit ? "Update Shipment" : "Add Shipment" %></button>
    </div>

</form>

</body>
</html>