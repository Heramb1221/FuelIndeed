<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Fuel Indeed | User Registration</title>
    <link rel="stylesheet" href="./resources/css/shared.css">
    <link rel="stylesheet" href="./resources/css/registerUser.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="register-container">
        <div class="register-left">
            <div class="register-header">
                <svg width="60" height="60" viewBox="0 0 24 24" class="register-icon">
                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z" fill="#003366"/>
                </svg>
                <h1>Create Your Account</h1>
                <p>Join thousands of users enjoying convenient fuel delivery</p>
            </div>
            
            <div class="benefits-list">
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
                    <span>Competitive fuel prices with no hidden charges</span>
                </div>
                <div class="benefit-item">
                    <svg width="24" height="24" viewBox="0 0 24 24">
                        <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" fill="#4CAF50"/>
                    </svg>
                    <span>Secure payment options</span>
                </div>
            </div>
            
            <div class="fuel-animation">
                <div class="petrol-droplet"></div>
                <div class="diesel-droplet"></div>
            </div>
        </div>
        
        <div class="register-right">
            <div class="register-card card">
                <form id="registrationForm" action="registerNewUser" method="POST" novalidate>
                    <div class="form-group">
                        <label for="fullName">Full Name</label>
                        <input type="text" id="fullName" name="fullName" required 
                               placeholder="Enter your full name">
                        <div class="error-message" id="nameError"></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="contactNumber">Contact Number</label>
                        <div class="input-with-country">
                            <select id="countryCode" name="countryCode">
                                <option value="+91">+91 (IN)</option>
                                <option value="+1">+1 (US)</option>
                                <option value="+44">+44 (UK)</option>
                            </select>
                            <input type="tel" id="contactNumber" name="contactNumber" required 
                                   placeholder="Enter your mobile number" pattern="[0-9]{10}">
                        </div>
                        <div class="error-message" id="contactError"></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" required 
                               placeholder="Enter your email address">
                        <div class="error-message" id="emailError"></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Create Password</label>
                        <div class="password-input">
                            <input type="password" id="password" name="password" required 
                                   placeholder="Create a password" minlength="8">
                            <i class="fas fa-eye toggle-password"></i>
                        </div>
                        <div class="password-strength">
                            <div class="strength-meter">
                                <div class="strength-bar"></div>
                            </div>
                            <span class="strength-text">Password strength</span>
                        </div>
                        <div class="error-message" id="passwordError"></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <div class="password-input">
                            <input type="password" id="confirmPassword" name="confirmPassword" required 
                                   placeholder="Confirm your password">
                            <i class="fas fa-eye toggle-password"></i>
                        </div>
                        <div class="error-message" id="confirmPasswordError"></div>
                    </div>
                    
                    <div class="form-group address-group">
                        <label for="address">Address</label>
                        <textarea id="address" name="address" rows="3" required 
                                  placeholder="Enter your full address"></textarea>
                        <div class="error-message" id="addressError"></div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="city">City</label>
                            <input type="text" id="city" name="city" required 
                                   placeholder="Enter your city">
                            <div class="error-message" id="cityError"></div>
                        </div>
                        
                        <div class="form-group">
                            <label for="pincode">Pincode</label>
                            <input type="text" id="pincode" name="pincode" required 
                                   placeholder="Enter pincode" pattern="[0-9]{6}">
                            <div class="error-message" id="pincodeError"></div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="latitude">Latitude</label>
                            <input type="text" id="latitude" name="latitude" required 
                                   placeholder="Enter Latitutde">
                        </div>
                        
                        <div class="form-group">
                            <label for="longitude">Longitude</label>
                            <input type="text" id="longitude" name="longitude" required 
                                   placeholder="Enter longitude">
                        </div>
                    </div>
                    
                    <div class="form-group terms-group">
                        <input type="checkbox" id="terms" name="terms" required>
                        <label for="terms">I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a></label>
                        <div class="error-message" id="termsError"></div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary btn-register">
                        Create Account
                    </button>
                    
                    <div class="login-link">
                        Already have an account? <a href="adminLogin">Log in</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script>
        // Password visibility toggle
        document.querySelectorAll('.toggle-password').forEach(icon => {
            icon.addEventListener('click', function() {
                const passwordInput = this.previousElementSibling;
                const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            });
        });
        
        // Password strength indicator
        document.getElementById('password').addEventListener('input', function() {
            const password = this.value;
            const strengthBar = document.querySelector('.strength-bar');
            const strengthText = document.querySelector('.strength-text');
            
            // Reset
            strengthBar.style.width = '0%';
            strengthBar.style.backgroundColor = '#ddd';
            
            if (password.length === 0) {
                strengthText.textContent = 'Password strength';
                return;
            }
            
            // Calculate strength (simple version)
            let strength = 0;
            if (password.length >= 8) strength += 25;
            if (/[A-Z]/.test(password)) strength += 25;
            if (/[0-9]/.test(password)) strength += 25;
            if (/[^A-Za-z0-9]/.test(password)) strength += 25;
            
            // Update UI
            strengthBar.style.width = strength + '%';
            
            if (strength < 50) {
                strengthBar.style.backgroundColor = '#D32F2F';
                strengthText.textContent = 'Weak';
            } else if (strength < 75) {
                strengthBar.style.backgroundColor = '#FFA000';
                strengthText.textContent = 'Moderate';
            } else {
                strengthBar.style.backgroundColor = '#4CAF50';
                strengthText.textContent = 'Strong';
            }
        });
        
        // Form validation
        document.getElementById('registrationForm').addEventListener('submit', function(e) {
            let isValid = true;
            
            // Clear previous errors
            document.querySelectorAll('.error-message').forEach(el => {
                el.textContent = '';
            });
            
            // Name validation
            const name = document.getElementById('fullName').value.trim();
            if (name.length < 3) {
                document.getElementById('nameError').textContent = 'Please enter a valid name';
                isValid = false;
            }
            
            // Contact validation
            const contact = document.getElementById('contactNumber').value.trim();
            if (!/^\d{10}$/.test(contact)) {
                document.getElementById('contactError').textContent = 'Please enter a valid 10-digit number';
                isValid = false;
            }
            
            // Email validation
            const email = document.getElementById('email').value.trim();
            if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                document.getElementById('emailError').textContent = 'Please enter a valid email address';
                isValid = false;
            }
            
            // Password validation
            const password = document.getElementById('password').value;
            if (password.length < 8) {
                document.getElementById('passwordError').textContent = 'Password must be at least 8 characters';
                isValid = false;
            }
            
            // Confirm password
            const confirmPassword = document.getElementById('confirmPassword').value;
            if (password !== confirmPassword) {
                document.getElementById('confirmPasswordError').textContent = 'Passwords do not match';
                isValid = false;
            }
            
            // Address validation
            const address = document.getElementById('address').value.trim();
            if (address.length < 10) {
                document.getElementById('addressError').textContent = 'Please enter a complete address';
                isValid = false;
            }
            
            // City validation
            const city = document.getElementById('city').value.trim();
            if (city.length < 3) {
                document.getElementById('cityError').textContent = 'Please enter a valid city';
                isValid = false;
            }
            
            // Pincode validation
            const pincode = document.getElementById('pincode').value.trim();
            if (!/^\d{6}$/.test(pincode)) {
                document.getElementById('pincodeError').textContent = 'Please enter a valid 6-digit pincode';
                isValid = false;
            }
            
            // Terms validation
            if (!document.getElementById('terms').checked) {
                document.getElementById('termsError').textContent = 'You must accept the terms and conditions';
                isValid = false;
            }
            
            if (!isValid) {
                e.preventDefault();
                // Scroll to first error
                const firstError = document.querySelector('.error-message:not(:empty)');
                if (firstError) {
                    firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }
            }
        });
        
        // Display error message if exists
        <% if (request.getParameter("error") != null) { %>
            alert('<%= request.getParameter("error") %>');
        <% } %>
    </script>
</body>
</html>