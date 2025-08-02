<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Fuel Indeed | Admin Login</title>
    <link rel="stylesheet" href="./resources/css/shared.css">
    <link rel="stylesheet" href="./resources/css/adminLogin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="admin-login-container">
        <!-- Security Shield Background -->
        <div class="security-shield">
            <svg viewBox="0 0 24 24">
                <path d="M12 1L3 5v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V5l-9-4zm0 10.99h7c-.53 4.12-3.28 7.79-7 8.94V12H5V6.3l7-3.11V11.99z"/>
            </svg>
        </div>
        
        <div class="admin-login-card card">
            <div class="admin-login-header">
                <div class="admin-logo">
                    <svg width="50" height="50" viewBox="0 0 24 24">
                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z" fill="#003366"/>
                        <path d="M18 8h-1V5h-2v3h-3v2h3v3h2v-3h3V8z" fill="#FFD700"/>
                    </svg>
                    <h1>Fuel Indeed <span>Admin</span></h1>
                </div>
                <p>Secure access to administration panel</p>
            </div>
            
            <form action="AdminLogin" method="POST" class="admin-login-form">
                <div class="form-group">
                    <label for="adminId">
                        <i class="fas fa-user-shield"></i> Admin ID
                    </label>
                    <input type="text" id="adminId" name="email" required 
                           placeholder="Enter your admin ID" autocomplete="off">
                </div>
                
                <div class="form-group">
                    <label for="adminPassword">
                        <i class="fas fa-lock"></i> Password
                    </label>
                    <div class="password-input">
                        <input type="password" id="adminPassword" name="password" required 
                               placeholder="Enter your password">
                        <i class="fas fa-eye toggle-password"></i>
                    </div>
                </div>
                
                <input type="hidden" name="csrfToken" value="${sessionScope.csrfToken}">
                
                <button type="submit" class="btn btn-admin-login">
                    <i class="fas fa-sign-in-alt"></i> Secure Login
                </button>
                
            </form>
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
        
        document.getElementById('adminId').focus();
    </script>
</body>
</html>