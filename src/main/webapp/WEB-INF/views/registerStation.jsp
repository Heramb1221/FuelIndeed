<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Fuel Indeed | Station Registration</title>
    <link rel="stylesheet" href="./resources/css/shared.css">
    <link rel="stylesheet" href="./resources/css/registerStation.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="station-register-container">
        <div class="station-register-left">
            <div class="station-register-header">
                <svg width="60" height="60" viewBox="0 0 24 24" class="station-icon">
                    <path d="M3 13h8V3H3v10zm0 8h8v-6H3v6zm10 0h8V11h-8v10zm0-18v6h8V3h-8z" fill="#003366"/>
                    <path d="M12 8c-1.66 0-3-1.34-3-3s1.34-3 3-3 3 1.34 3 3-1.34 3-3 3z" fill="#FFD700"/>
                </svg>
                <h1>Register Your Fuel Station</h1>
                <p>Join our network of trusted fuel providers</p>
            </div>
            
            <div class="benefits-list">
                <div class="benefit-item">
                    <svg width="24" height="24" viewBox="0 0 24 24">
                        <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" fill="#4CAF50"/>
                    </svg>
                    <span>Increase your customer base with online bookings</span>
                </div>
                <div class="benefit-item">
                    <svg width="24" height="24" viewBox="0 0 24 24">
                        <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" fill="#4CAF50"/>
                    </svg>
                    <span>Manage your fuel inventory and prices easily</span>
                </div>
                <div class="benefit-item">
                    <svg width="24" height="24" viewBox="0 0 24 24">
                        <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" fill="#4CAF50"/>
                    </svg>
                    <span>Get delivery personnel management tools</span>
                </div>
            </div>
            
            <div class="station-animation">
                <div class="petrol-pump"></div>
                <div class="nozzle"></div>
            </div>
        </div>
        
        <div class="station-register-right">
            <div class="station-register-card card">
                <form id="stationRegistrationForm" action="registerNewStation" method="POST" novalidate>
                    <h2 class="form-title">Station Information</h2>
                    
                    <div class="form-group">
                        <label for="stationName">Station Name*</label>
                        <input type="text" id="stationName" name="stationName" required 
                               placeholder="Enter your station name">
                        <div class="error-message" id="stationNameError"></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="contactNumber">Contact Number*</label>
                        <div class="input-with-country">
                            <select id="countryCode" name="countryCode">
                                <option value="+91">+91 (IN)</option>
                                <option value="+1">+1 (US)</option>
                                <option value="+44">+44 (UK)</option>
                            </select>
                            <input type="tel" id="contactNumber" name="contactNumber" required 
                                   placeholder="Enter contact number" pattern="[0-9]{10}">
                        </div>
                        <div class="error-message" id="contactError"></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email Address*</label>
                        <input type="email" id="email" name="email" required 
                               placeholder="Enter email address">
                        <div class="error-message" id="emailError"></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Create Password*</label>
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
                        <label for="confirmPassword">Confirm Password*</label>
                        <div class="password-input">
                            <input type="password" id="confirmPassword" name="confirmPassword" required 
                                   placeholder="Confirm your password">
                            <i class="fas fa-eye toggle-password"></i>
                        </div>
                        <div class="error-message" id="confirmPasswordError"></div>
                    </div>
                    
                    <h2 class="form-title">Station Details</h2>
                    
                    <div class="form-group">
                        <label for="address">Station Address*</label>
                        <textarea id="address" name="address" rows="3" required 
                                  placeholder="Enter full station address"></textarea>
                        <div class="error-message" id="addressError"></div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="area">Area*</label>
                            <input type="text" id="area" name="area" required 
                                   placeholder="Enter area/locality">
                            <div class="error-message" id="areaError"></div>
                        </div>
                        
                        <div class="form-group">
                            <label for="city">City*</label>
                            <input type="text" id="city" name="city" required 
                                   placeholder="Enter city">
                            <div class="error-message" id="cityError"></div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        
                        <div class="form-group">
                            <label for="pincode">Pincode*</label>
                            <input type="text" id="pincode" name="pincode" required 
                                   placeholder="Enter pincode" pattern="[0-9]{6}">
                            <div class="error-message" id="pincodeError"></div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="openTime">Opening Time*</label>
                            <input type="time" id="openTime" name="openTime" required>
                            <div class="error-message" id="openTimeError"></div>
                        </div>
                        
                        <div class="form-group">
                            <label for="closeTime">Closing Time*</label>
                            <input type="time" id="closeTime" name="closeTime" required>
                            <div class="error-message" id="closeTimeError"></div>
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
                    
                    <h2 class="form-title">Initial Fuel Inventory</h2>
                    
                    <div class="fuel-types">
                        <div class="fuel-type petrol">
                            <div class="fuel-header">
                                <svg width="24" height="24" viewBox="0 0 24 24">
                                    <path d="M18 10h-1V4H7v6H6c-1.66 0-3 1.34-3 3v7h4v-2h10v2h4v-7c0-1.66-1.34-3-3-3z" fill="#005F6B"/>
                                </svg>
                                <h3>Petrol</h3>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="petrolQty">Initial Quantity (liters)</label>
                                    <input type="number" id="petrolQty" name="petrolQty" min="0" step="1" 
                                           placeholder="Available quantity">
                                </div>
                                <div class="form-group">
                                    <label for="petrolRate">Rate per liter (₹)</label>
                                    <input type="number" id="petrolRate" name="petrolRate" min="0" step="0.01" 
                                           placeholder="Current rate">
                                </div>
                            </div>
                        </div>
                        
                        <div class="fuel-type diesel">
                            <div class="fuel-header">
                                <svg width="24" height="24" viewBox="0 0 24 24">
                                    <path d="M18 10h-1V4H7v6H6c-1.66 0-3 1.34-3 3v7h4v-2h10v2h4v-7c0-1.66-1.34-3-3-3z" fill="#D32F2F"/>
                                </svg>
                                <h3>Diesel</h3>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="dieselQty">Initial Quantity (liters)</label>
                                    <input type="number" id="dieselQty" name="dieselQty" min="0" step="1" 
                                           placeholder="Available quantity">
                                </div>
                                <div class="form-group">
                                    <label for="dieselRate">Rate per liter (₹)</label>
                                    <input type="number" id="dieselRate" name="dieselRate" min="0" step="0.01" 
                                           placeholder="Current rate">
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group documents-group">
                        <label>Upload Documents (PDF/JPEG/PNG)</label>
                        <div class="document-uploads">
                            <div class="document-upload">
                                <label for="ownerId">Owner ID Proof*</label>
                                <input type="file" id="ownerId" name="ownerId" accept=".pdf,.jpg,.jpeg,.png" required>
                                <div class="error-message" id="ownerIdError"></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group terms-group">
                        <input type="checkbox" id="terms" name="terms" required>
                        <label for="terms">I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a></label>
                        <div class="error-message" id="termsError"></div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary btn-register">
                        Register Station
                    </button>
                    
                    <div class="login-link">
                        Already registered? <a href="stationLogin">Station Login</a>
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
        
        document.getElementById('stationRegistrationForm').addEventListener('submit', function(e) {
            let isValid = true;
            
            document.querySelectorAll('.error-message').forEach(el => {
                el.textContent = '';
            });
            
            const stationName = document.getElementById('stationName').value.trim();
            if (stationName.length < 3) {
                document.getElementById('stationNameError').textContent = 'Please enter a valid station name';
                isValid = false;
            }
            
            const ownerName = document.getElementById('ownerName').value.trim();
            if (ownerName.length < 3) {
                document.getElementById('ownerNameError').textContent = 'Please enter owner name';
                isValid = false;
            }
            
            const contact = document.getElementById('contactNumber').value.trim();
            if (!/^\d{10}$/.test(contact)) {
                document.getElementById('contactError').textContent = 'Please enter a valid 10-digit number';
                isValid = false;
            }
            
            const email = document.getElementById('email').value.trim();
            if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                document.getElementById('emailError').textContent = 'Please enter a valid email address';
                isValid = false;
            }
            
            const password = document.getElementById('password').value;
            if (password.length < 8) {
                document.getElementById('passwordError').textContent = 'Password must be at least 8 characters';
                isValid = false;
            }
            
            const confirmPassword = document.getElementById('confirmPassword').value;
            if (password !== confirmPassword) {
                document.getElementById('confirmPasswordError').textContent = 'Passwords do not match';
                isValid = false;
            }
            
            const address = document.getElementById('address').value.trim();
            if (address.length < 10) {
                document.getElementById('addressError').textContent = 'Please enter a complete address';
                isValid = false;
            }
            
            const area = document.getElementById('area').value.trim();
            if (area.length < 3) {
                document.getElementById('areaError').textContent = 'Please enter area/locality';
                isValid = false;
            }
            
            const city = document.getElementById('city').value.trim();
            if (city.length < 3) {
                document.getElementById('cityError').textContent = 'Please enter a valid city';
                isValid = false;
            }
            
            const state = document.getElementById('state').value.trim();
            if (state.length < 3) {
                document.getElementById('stateError').textContent = 'Please enter state';
                isValid = false;
            }
            
            const pincode = document.getElementById('pincode').value.trim();
            if (!/^\d{6}$/.test(pincode)) {
                document.getElementById('pincodeError').textContent = 'Please enter a valid 6-digit pincode';
                isValid = false;
            }
            
            const openTime = document.getElementById('openTime').value;
            const closeTime = document.getElementById('closeTime').value;
            if (!openTime) {
                document.getElementById('openTimeError').textContent = 'Please select opening time';
                isValid = false;
            }
            if (!closeTime) {
                document.getElementById('closeTimeError').textContent = 'Please select closing time';
                isValid = false;
            }
            
            const licenseFile = document.getElementById('licenseFile').files.length;
            const ownerId = document.getElementById('ownerId').files.length;
            if (!licenseFile) {
                document.getElementById('licenseError').textContent = 'Business license required';
                isValid = false;
            }
            if (!ownerId) {
                document.getElementById('ownerIdError').textContent = 'Owner ID proof required';
                isValid = false;
            }

            if (!document.getElementById('terms').checked) {
                document.getElementById('termsError').textContent = 'You must accept the terms and conditions';
                isValid = false;
            }
            
            if (!isValid) {
                e.preventDefault();
                const firstError = document.querySelector('.error-message:not(:empty)');
                if (firstError) {
                    firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }
            }
        });
        
        <% if (request.getParameter("error") != null) { %>
            alert('<%= request.getParameter("error") %>');
        <% } %>
    </script>
</body>
</html>