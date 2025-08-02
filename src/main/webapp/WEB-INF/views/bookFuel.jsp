<%@page import="com.heramb.model.Users" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fuel Delivery Booking</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            color: #333;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .booking-container {
            max-width: 600px;
            width: 100%;
        }
        
        .booking-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        
        .booking-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .booking-header h2 {
            color: #2c3e50;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .booking-header h2 i {
            margin-right: 10px;
            color: #3498db;
        }
        
        .booking-header p {
            color: #7f8c8d;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #2c3e50;
        }
        
        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 15px;
            transition: border-color 0.3s;
        }
        
        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: #3498db;
            outline: none;
        }
        
        .form-row {
            display: flex;
            gap: 15px;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        .submit-btn {
            width: 100%;
            padding: 14px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .submit-btn:hover {
            background-color: #2980b9;
        }
        
        .submit-btn i {
            margin-right: 8px;
        }
        
        .fuel-icon {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .fuel-icon i {
            font-size: 50px;
            color: #3498db;
        }
        
        @media (max-width: 576px) {
            .form-row {
                flex-direction: column;
                gap: 0;
            }
            
            .booking-card {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="booking-container">
        <div class="booking-card">
            <div class="fuel-icon">
                <i class="fas fa-gas-pump"></i>
            </div>
            
            <div class="booking-header">
                <h2><i class="fas fa-calendar-alt"></i> Book Fuel Delivery</h2>
                <p>Fill the form to schedule your fuel delivery</p>
            </div>
            
            <form id="fuelBookingForm" action="fuelBookingForm" method="POST">
                <div class="form-row">
                    <div class="form-group">
						<%
							Users user = (Users) request.getAttribute("user");
						%>
						<label for="fuelType">Fuel Type</label>
                        <select id="fuelType" name="fuelType" required>
                            <option value="">-- Select Fuel Type --</option>
                            <option value="PETROL">Petrol</option>
                            <option value="DIESEL">Diesel</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="quantity">Quantity (liters)</label>
                        <input type="number" id="quantity" name="quantity" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="deliveryAddress">Delivery Address</label>
                    <textarea id="deliveryAddress" name="deliveryAddress" rows="3" required><%= (user != null) ? user.getAddress() : "" %></textarea>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="deliveryDate">Delivery Date</label>
                        <input type="date" id="deliveryDate" name="deliveryDate" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="deliveryTime">Delivery Time</label>
                        <input type="time" id="deliveryTime" name="deliveryTime" required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="fullName">Full Name</label>
                        <input type="text" id="fullName" name="fullName" value="<%= user.getName() %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="contactNumber">Contact Number</label>
                        <input type="tel" id="contactNumber" name="contactNumber" value="<%= user.getContact() %>" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="specialInstructions">Special Instructions (Optional)</label>
                    <textarea id="specialInstructions" name="specialInstructions" rows="2"></textarea>
                </div>
                
                <button type="submit" class="submit-btn">
                    <i class="fas fa-check-circle"></i> Confirm Booking
                </button>
            </form>
        </div>
    </div>
</body>
</html>