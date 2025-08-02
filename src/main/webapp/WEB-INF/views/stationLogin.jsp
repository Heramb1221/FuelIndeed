<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Fuel Indeed | Station Login</title>
    <link rel="stylesheet" href="./resources/css/shared.css">
    <link rel="stylesheet" href="./resources/css/stationLogin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="station-login-container">
        <div class="station-login-left">
            <div class="station-login-hero">
                <svg width="120" height="120" viewBox="0 0 24 24" class="station-icon">
                    <path d="M1 13h6v8H1v-8zm6-12h6v6H7V1zm6 12h6v8h-6v-8zM7 7h6v6H7V7zm12-6h4v20h-4V1z" fill="#003366"/>
                    <path d="M3 13h2v6H3v-6zm6-12h2v4H9V1zm6 12h2v6h-2v-6z" fill="#FFD700"/>
                </svg>
                <h1>Fuel Station Portal</h1>
                <p>Manage your fuel inventory and deliveries</p>
                
                <div class="features-list">
                    <div class="feature-item">
                        <svg width="24" height="24" viewBox="0 0 24 24">
                            <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" fill="#4CAF50"/>
                        </svg>
                        <span>Update fuel availability in real-time</span>
                    </div>
                    <div class="feature-item">
                        <svg width="24" height="24" viewBox="0 0 24 24">
                            <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" fill="#4CAF50"/>
                        </svg>
                        <span>Manage delivery personnel</span>
                    </div>
                    <div class="feature-item">
                        <svg width="24" height="24" viewBox="0 0 24 24">
                            <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" fill="#4CAF50"/>
                        </svg>
                        <span>Track and fulfill customer orders</span>
                    </div>
                </div>
            </div>
            
            <div class="station-animation">
                <div class="fuel-pump">
                    <svg width="120" height="120" viewBox="0 0 24 24">
                        <path d="M18 10h-1V4H7v6H6c-1.66 0-3 1.34-3 3v7h4v-2h10v2h4v-7c0-1.66-1.34-3-3-3z" fill="#005F6B"/>
                        <path d="M9 9h6v6H9z" fill="#FFD700"/>
                    </svg>
                </div>
                <div class="fuel-drops">
                    <div class="petrol-drop"></div>
                    <div class="diesel-drop"></div>
                </div>
            </div>
        </div>
        
        <div class="station-login-right">
            <div class="station-login-card card">
                <div class="login-header">
                    <h2>Station Login</h2>
                    <p>Enter your registered station credentials</p>
                </div>
                
                <form action="StationLogin" method="POST" class="login-form">
                    <div class="form-group">
                        <label for="contactNumber">
                            <i class="fas fa-mobile-alt"></i> Station Contact Number
                        </label>
                        <div class="input-with-country">
                            <select id="countryCode" name="countryCode">
                                <option value="+91">+91 (IN)</option>
                                <option value="+1">+1 (US)</option>
                                <option value="+44">+44 (UK)</option>
                            </select>
                            <input type="tel" id="contactNumber" name="contactNumber" required 
                                   placeholder="Enter registered contact number">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">
                            <i class="fas fa-lock"></i> Password
                        </label>
                        <div class="password-input">
                            <input type="password" id="password" name="password" required 
                                   placeholder="Enter your password">
                            <i class="fas fa-eye toggle-password"></i>
                        </div>
                    </div>
                    
                    <div class="form-options">
                        <div class="remember-me">
                            <input type="checkbox" id="remember" name="remember">
                            <label for="remember">Remember this device</label>
                        </div>
                        <a href="#" class="forgot-password">Forgot Password?</a>
                    </div>
                    
                    <button type="submit" class="btn btn-station-login">
                        <i class="fas fa-sign-in-alt"></i> Login to Dashboard
                    </button>
                    
                    <div class="register-link">
                        Not registered yet? <a href="registerStation">Register your station</a>
                    </div>
                </form>
            </div>
            
            <div class="station-security-info">
                <div class="security-item">
                    <i class="fas fa-shield-alt"></i>
                    <span>All login activities are monitored</span>
                </div>
                <div class="security-item">
                    <i class="fas fa-clock"></i>
                    <span>Session will timeout after 30 minutes</span>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        // Toggle password visibility
        document.querySelector('.toggle-password').addEventListener('click', function() {
            const passwordInput = this.previousElementSibling;
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });
        
        // Display error message if exists
        <% if (request.getParameter("error") != null) { %>
            alert('<%= request.getParameter("error") %>');
        <% } %>
        
        // Auto-focus on contact number field
        document.getElementById('contactNumber').focus();
    </script>
</body>
</html>