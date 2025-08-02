<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Fuel Indeed | User Login</title>
    <link rel="stylesheet" href="./resources/css/shared.css">
    <link rel="stylesheet" href="./resources/css/userLogin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="user-login-container">
        <div class="user-login-left">
            <div class="login-hero">
                <svg width="120" height="120" viewBox="0 0 24 24" class="user-icon">
                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z" fill="#003366"/>
                </svg>
                <h1>Welcome Back!</h1>
                <p>Login to access your fuel delivery account</p>
                
                <div class="benefits">
                    <div class="benefit-item">
                        <svg width="24" height="24" viewBox="0 0 24 24">
                            <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" fill="#4CAF50"/>
                        </svg>
                        <span>Quick fuel delivery in under 60 minutes</span>
                    </div>
                    <div class="benefit-item">
                        <svg width="24" height="24" viewBox="0 0 24 24">
                            <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" fill="#4CAF50"/>
                        </svg>
                        <span>Track your orders in real-time</span>
                    </div>
                    <div class="benefit-item">
                        <svg width="24" height="24" viewBox="0 0 24 24">
                            <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" fill="#4CAF50"/>
                        </svg>
                        <span>Manage your payment methods</span>
                    </div>
                </div>
            </div>
            
            <div class="fuel-car-animation">
                <svg width="200" height="100" viewBox="0 0 200 100">
                    <!-- Car body -->
                    <rect x="30" y="40" width="140" height="30" rx="5" fill="#003366"/>
                    <!-- Car top -->
                    <rect x="50" y="25" width="80" height="15" rx="5" fill="#1a4d80"/>
                    <!-- Wheels -->
                    <circle cx="60" cy="75" r="10" fill="#333"/>
                    <circle cx="140" cy="75" r="10" fill="#333"/>
                    <!-- Windows -->
                    <rect x="55" y="30" width="30" height="10" rx="2" fill="#a0d1f2"/>
                    <rect x="115" y="30" width="30" height="10" rx="2" fill="#a0d1f2"/>
                </svg>
            </div>
        </div>
        
        <div class="user-login-right">
            <div class="user-login-card card">
                <div class="login-header">
                    <h2>User Login</h2>
                    <p>Enter your credentials to continue</p>
                </div>
                
                <form action="UserLogin" method="POST" class="login-form">
                    <div class="form-group">
                        <label for="contactNumber">
                            <i class="fas fa-mobile-alt"></i> Contact Number
                        </label>
                        <div class="input-with-country">
                            <select id="countryCode" name="countryCode">
                                <option value="+91">+91 (IN)</option>
                                <option value="+1">+1 (US)</option>
                                <option value="+44">+44 (UK)</option>
                            </select>
                            <input type="tel" id="contactNumber" name="contactNumber" required 
                                   placeholder="Enter your registered number" pattern="[0-9]{10}">
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
                            <label for="remember">Remember me</label>
                        </div>
                        <a href="#" class="forgot-password">Forgot Password?</a>
                    </div>
                    
                    <button type="submit" class="btn btn-primary btn-login">
                        <i class="fas fa-sign-in-alt"></i> Login
                    </button>
                    
                    <div class="social-login">
                        <div class="divider">
                            <span>or login with</span>
                        </div>
                        <div class="social-buttons">
                            <a href="#" class="social-btn google">
                                <i class="fab fa-google"></i> Google
                            </a>
                            <a href="#" class="social-btn facebook">
                                <i class="fab fa-facebook-f"></i> Facebook
                            </a>
                        </div>
                    </div>
                    
                    <div class="register-link">
                        Don't have an account? <a href="registerUser">Register here</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script>
        document.querySelector('.toggle-password').addEventListener('click', function() {
            const passwordInput = this.previousElementSibling;
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });
        
        <% if (request.getParameter("error") != null) { %>
            alert('<%= request.getParameter("error") %>');
        <% } %>
        
        // Auto-focus on contact number field
        document.getElementById('contactNumber').focus();
    </script>
</body>
</html>