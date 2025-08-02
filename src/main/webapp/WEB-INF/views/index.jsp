<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fuel Indeed - Online Fuel Booking Platform</title>
<link rel="stylesheet" href="./resources/css/shared.css">
<link rel="stylesheet" href="./resources/css/index.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	<nav class="navbar">
		<div class="container">
			<div class="logo">
				<img src="./resources/assets/fuelindeed.png" alt="Fuel Indeed Logo">
				<span>Fuel Indeed</span>
			</div>
			<ul class="nav-links">
				<li><a href="#features">Features</a></li>
				<li><a href="#how-it-works">How It Works</a></li>
				<li><a href="#testimonials">Testimonials</a></li>
				<li><a href="#contact">Contact</a></li>
			</ul>
			<div class="auth-buttons">
				<div class="dropdown">
					<button class="btn btn-login dropdown-toggle">
						Login <i class="fas fa-chevron-down"></i>
					</button>
					<div class="dropdown-menu">
						<a href="adminLogin" class="dropdown-item">Admin Login</a> 
						<a href="userLogin" class="dropdown-item">User Login</a> 
						<a href="stationLogin" class="dropdown-item">Station Login</a> 
						<a href="deliveryLogin" class="dropdown-item">Delivery Login</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="btn btn-primary dropdown-toggle">
						Register <i class="fas fa-chevron-down"></i>
					</button>
					<div class="dropdown-menu">
						<a href="registerUser" class="dropdown-item">Register
							User</a> <a href="registerStation" class="dropdown-item">Register
							Station</a>
					</div>
				</div>
			</div>
			<div class="mobile-menu-btn">
				<i class="fas fa-bars"></i>
			</div>
		</div>
	</nav>

	<!-- Hero Section -->
	<section class="hero">
		<div class="container">
			<div class="hero-content">
				<h1 class="hero-title">Fuel Delivered to Your Doorstep</h1>
				<p class="hero-subtitle">Skip the queues and get fuel delivered
					whenever you need it</p>
				<div class="hero-cta">
					<a href="register.jsp" class="btn btn-primary btn-large">Book
						Fuel Now</a> <a href="#how-it-works" class="btn btn-outline">How
						It Works <i class="fas fa-arrow-down"></i>
					</a>
				</div>
			</div>
			<div class="hero-image">
				<img src="./resources/assets/fuel-delivery.webp" alt="Fuel Delivery"
					class="floating">
				<div class="petrol-animation"></div>
				<div class="diesel-animation"></div>
			</div>
		</div>
	</section>

	<!-- Features Section -->
	<section class="features" id="features">
		<div class="container">
			<h2 class="section-title">Why Choose Fuel Indeed</h2>
			<div class="features-grid">
				<div class="feature-card card">
					<div class="feature-icon petrol-bg">
						<i class="fas fa-bolt"></i>
					</div>
					<h3>Quick Delivery</h3>
					<p>Get fuel delivered within 60 minutes of booking in most
						areas</p>
				</div>
				<div class="feature-card card">
					<div class="feature-icon diesel-bg">
						<i class="fas fa-percentage"></i>
					</div>
					<h3>Competitive Prices</h3>
					<p>Same prices as fuel stations with no hidden charges</p>
				</div>
				<div class="feature-card card">
					<div class="feature-icon gas-bg">
						<i class="fas fa-shield-alt"></i>
					</div>
					<h3>Safe & Certified</h3>
					<p>All our delivery personnel are trained and certified</p>
				</div>
			</div>
		</div>
	</section>

	<!-- How It Works Section -->
	<section class="how-it-works" id="how-it-works">
		<div class="container">
			<h2 class="section-title">How It Works</h2>
			<div class="steps">
				<div class="step">
					<div class="step-number">1</div>
					<div class="step-content">
						<h3>Find Nearby Stations</h3>
						<p>Search for fuel stations in your area by pincode or
							location</p>
					</div>
				</div>
				<div class="step">
					<div class="step-number">2</div>
					<div class="step-content">
						<h3>Book Your Fuel</h3>
						<p>Select fuel type, quantity and delivery time slot</p>
					</div>
				</div>
				<div class="step">
					<div class="step-number">3</div>
					<div class="step-content">
						<h3>Get It Delivered</h3>
						<p>Our delivery executive will arrive at your location with
							fuel</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Testimonials Section -->
	<section class="testimonials" id="testimonials">
		<div class="container">
			<h2 class="section-title">What Our Customers Say</h2>
			<div class="testimonial-slider">
				<div class="testimonial-card card">
					<div class="testimonial-rating">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i>
					</div>
					<p class="testimonial-text">"Fuel Indeed saved me when I was
						running late for an important meeting and didn't have time to stop
						for fuel."</p>
					<div class="testimonial-author">
						<img src="./resources/assets/rahul.png" alt="User">
						<div>
							<h4>Rahul Sharma</h4>
							<p>Mumbai</p>
						</div>
					</div>
				</div>
				<!-- More testimonials would go here -->
			</div>
		</div>
	</section>

	<!-- CTA Section -->
	<section class="cta-section">
		<div class="container">
			<div class="cta-card card">
				<h2>Ready to Experience Convenient Fuel Delivery?</h2>
				<p>Join thousands of satisfied customers who never worry about
					fuel again</p>
				<div class="cta-buttons">
					<a href="register.jsp" class="btn btn-primary btn-large">Sign
						Up Now</a> <a href="login.jsp" class="btn btn-outline">Login</a>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer class="footer" id="contact">
		<div class="container">
			<div class="footer-grid">
				<div class="footer-col">
					<div class="logo">
						<img src="./resources/assets/fuelindeed.png"
							alt="Fuel Indeed Logo"> <span>Fuel Indeed</span>
					</div>
					<p>Your reliable fuel delivery partner</p>
					<div class="social-links">
						<a href="#"><i class="fab fa-facebook-f"></i></a> <a href="#"><i
							class="fab fa-twitter"></i></a> <a href="#"><i
							class="fab fa-instagram"></i></a> <a href="#"><i
							class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
				<div class="footer-col">
					<h4>Quick Links</h4>
					<ul>
						<li><a href="#features">Features</a></li>
						<li><a href="#how-it-works">How It Works</a></li>
						<li><a href="#testimonials">Testimonials</a></li>
						<li><a href="login.jsp">Login</a></li>
					</ul>
				</div>
				<div class="footer-col">
					<h4>Services</h4>
					<ul>
						<li><a href="#">Petrol Delivery</a></li>
						<li><a href="#">Diesel Delivery</a></li>
						<li><a href="#">CNG Delivery</a></li>
						<li><a href="#">Bulk Orders</a></li>
					</ul>
				</div>
				<div class="footer-col">
					<h4>Contact Us</h4>
					<ul>
						<li><i class="fas fa-phone"></i> +91 9876543210</li>
						<li><i class="fas fa-envelope"></i> support@fuelindeed.com</li>
						<li><i class="fas fa-map-marker-alt"></i> Mumbai, India</li>
					</ul>
				</div>
			</div>
			<div class="footer-bottom">
				<p>&copy; Fuel Indeed. All rights reserved.</p>
				<div class="footer-links">
					<a href="#">Privacy Policy</a> <a href="#">Terms of Service</a>
				</div>
			</div>
		</div>
	</footer>

	<script src="./resources/js/index.js"></script>
</body>
</html>