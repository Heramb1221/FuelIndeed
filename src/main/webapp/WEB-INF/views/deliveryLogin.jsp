<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delivery Person Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #4895ef;
            --light: #f8f9fa;
            --dark: #212529;
            --success: #4cc9f0;
            --warning: #f72585;
            --danger: #ef233c;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            background-image: url('https://images.unsplash.com/photo-1600891964092-4316c288032e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            background-blend-mode: overlay;
            background-color: rgba(0,0,0,0.3);
        }
        
        .login-container {
            width: 100%;
            max-width: 450px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
            overflow: hidden;
            transform: translateY(0);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .login-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.25);
        }
        
        .login-header {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            padding: 30px;
            text-align: center;
            position: relative;
        }
        
        .login-header::after {
            content: '';
            position: absolute;
            bottom: -20px;
            left: 50%;
            transform: translateX(-50%);
            width: 40px;
            height: 40px;
            background: white;
            rotate: 45deg;
            z-index: 1;
        }
        
        .login-header h1 {
            font-size: 1.8rem;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .login-header h1 i {
            margin-right: 12px;
        }
        
        .login-header p {
            opacity: 0.9;
            font-size: 0.95rem;
        }
        
        .login-body {
            padding: 40px 30px;
        }
        
        .form-group {
            margin-bottom: 25px;
            position: relative;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark);
            font-size: 0.95rem;
        }
        
        .input-container {
            position: relative;
        }
        
        .input-container i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary);
            font-size: 1.1rem;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            border-color: var(--accent);
            box-shadow: 0 0 0 3px rgba(72, 149, 239, 0.2);
            outline: none;
        }
        
        .btn {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            margin-top: 10px;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
        }
        
        .btn-primary i {
            margin-right: 8px;
        }
        
        .login-footer {
            text-align: center;
            padding: 20px;
            border-top: 1px solid #eee;
            font-size: 0.9rem;
            color: #666;
        }
        
        .login-footer a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
        }
        
        .login-footer a:hover {
            text-decoration: underline;
        }
        
        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .animated {
            animation: fadeIn 0.6s ease-out forwards;
        }
        
        .delay-1 { animation-delay: 0.2s; }
        .delay-2 { animation-delay: 0.4s; }
        
        /* Responsive */
        @media (max-width: 480px) {
            .login-header {
                padding: 25px 20px;
            }
            
            .login-body {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container animated">
        <div class="login-header">
            <h1><i class="fas fa-motorcycle"></i> Delivery Portal</h1>
            <p>Sign in to manage your deliveries</p>
        </div>
        
        <div class="login-body">
            <form action="DeliveryLogin" method="post">
                <div class="form-group animated delay-1">
                    <label for="contactNumber">Contact Number</label>
                    <div class="input-container">
                        <i class="fas fa-phone"></i>
                        <input type="tel" id="contactNumber" name="contactNumber" 
                               class="form-control" 
                               placeholder="Enter registered phone number"
                               required
                               pattern="[0-9]{10}">
                    </div>
                </div>
                
                <div class="form-group animated delay-1">
                    <label for="password">Password</label>
                    <div class="input-container">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="password" name="password" 
                               class="form-control" 
                               placeholder="Enter your password"
                               required>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-primary animated delay-2">
                    <i class="fas fa-sign-in-alt"></i> Login
                </button>
            </form>
        </div>
        
        <div class="login-footer animated delay-2">
            <a href="forgot-password">Forgot Password?</a>
        </div>
    </div>

    <script>
        // Add input animation on focus
        document.querySelectorAll('.form-control').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.querySelector('i').style.color = var(--accent);
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.querySelector('i').style.color = var(--primary);
            });
        });
    </script>
</body>
</html>