<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Application Under Review</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #333;
        }
        
        .approval-container {
            max-width: 600px;
            width: 90%;
            text-align: center;
            padding: 40px 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .approval-icon {
            font-size: 80px;
            color: #FFA500;
            margin-bottom: 20px;
            animation: pulse 2s infinite;
        }
        
        h1 {
            color: #2c3e50;
            margin-bottom: 15px;
        }
        
        p {
            color: #7f8c8d;
            margin-bottom: 25px;
            line-height: 1.6;
        }
        
        .contact-info {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            margin: 25px 0;
            border-left: 4px solid #3498db;
        }
        
        .contact-info p {
            margin-bottom: 5px;
        }
        
        .btn {
            display: inline-block;
            padding: 12px 25px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: 500;
            transition: all 0.3s;
            margin-top: 10px;
        }
        
        .btn:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }
        
        .btn i {
            margin-right: 8px;
        }
        
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
        
        @media (max-width: 480px) {
            .approval-container {
                padding: 30px 20px;
            }
            
            .approval-icon {
                font-size: 60px;
            }
            
            h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="approval-container">
        <div class="approval-icon">
            <i class="fas fa-hourglass-half"></i>
        </div>
        
        <h1>Application Under Review</h1>
        
        <p>Thank you for submitting your application to Fuel Indeed. Your registration is currently being reviewed by our team.</p>
        
        <p>This process typically takes 24-48 hours. You will receive a confirmation email once your account has been approved.</p>
        
        <div class="contact-info">
            <p>If you have any questions or need immediate assistance:</p>
            <p><i class="fas fa-envelope"></i> support@fuelindeed.com</p>
            <p><i class="fas fa-phone"></i> +1 (800) 123-4567</p>
        </div>
        
        <p>We appreciate your patience and look forward to serving you soon!</p>
        
        <a href="index" class="btn">
            <i class="fas fa-sign-in-alt"></i> Return to Login
        </a>
    </div>
</body>
</html>