<%@page import="java.util.List"%>
<%@page import="com.heramb.model.FuelStation"%>
<%@ page import="java.util.List"%>
<%@ page import="com.heramb.model.Booking"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Delivery Person Dashboard</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
	color: var(--dark);
}

/* Header Styles */
.header {
	background: linear-gradient(135deg, var(- -primary), var(- -secondary));
	color: white;
	padding: 20px;
	position: fixed;
	width: 100%;
	top: 0;
	z-index: 100;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header-title {
	display: flex;
	align-items: center;
}

.header-title i {
	margin-right: 10px;
	font-size: 1.5rem;
}

.user-profile {
	display: flex;
	align-items: center;
}

.user-profile img {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	margin-right: 10px;
	border: 2px solid rgba(255, 255, 255, 0.3);
}

/* Navigation */
.nav-menu {
	display: flex;
	background: white;
	position: fixed;
	bottom: 0;
	width: 100%;
	justify-content: space-around;
	padding: 15px 0;
	box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.05);
	z-index: 100;
}

.nav-item {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-decoration: none;
	color: #666;
	font-size: 0.8rem;
}

.nav-item i {
	font-size: 1.2rem;
	margin-bottom: 5px;
}

.nav-item.active {
	color: var(--primary);
}

/* Main Content */
.main-content {
	padding: 80px 20px 70px;
}

.section {
	margin-bottom: 30px;
	scroll-margin-top: 80px;
}

.section-title {
	color: var(--primary);
	margin-bottom: 15px;
	display: flex;
	align-items: center;
}

.section-title i {
	margin-right: 10px;
}

/* Card Styles */
.card {
	background: white;
	border-radius: 10px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
	padding: 20px;
	margin-bottom: 20px;
}

/* Delivery Stats */
.delivery-stats {
	display: flex;
	justify-content: space-between;
	text-align: center;
	gap: 15px;
}

.stat-item {
	flex: 1;
	padding: 15px;
	border-radius: 8px;
	background: linear-gradient(135deg, #f5f7fa, #e4e8eb);
}

.stat-item h4 {
	margin-bottom: 10px;
	color: var(--dark);
	font-size: 0.9rem;
}

.stat-value {
	font-size: 1.5rem;
	font-weight: 600;
	color: var(--primary);
}

/* Table Styles */
.table {
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9rem;
}

.table th, .table td {
	padding: 12px 10px;
	text-align: left;
	border-bottom: 1px solid #eee;
}

.table th {
	background-color: #f8f9fa;
	color: var(--dark);
	font-weight: 600;
}

.status-badge {
	padding: 5px 10px;
	border-radius: 20px;
	font-size: 0.8rem;
	font-weight: 500;
}

.status-delivered {
	background-color: #d4edda;
	color: #155724;
}

.status-pending {
	background-color: #fff3cd;
	color: #856404;
}

/* Form Styles */
.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	font-weight: 500;
	font-size: 0.9rem;
}

.form-control {
	width: 100%;
	padding: 10px 15px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 1rem;
}

.btn {
	padding: 12px 20px;
	border: none;
	border-radius: 5px;
	font-size: 1rem;
	cursor: pointer;
	width: 100%;
	background-color: var(- -primary);
	color: white;
	font-weight: 500;
}

.btn-sm {
	padding: 8px 15px;
	font-size: 0.9rem;
}

/* Delivery Modal */
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 1000;
	justify-content: center;
	align-items: center;
}

.modal-content {
	background: white;
	border-radius: 10px;
	width: 90%;
	max-width: 400px;
	padding: 20px;
}

.modal-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 15px;
}

.modal-header h3 {
	color: var(--primary);
}

.close-modal {
	background: none;
	border: none;
	font-size: 1.5rem;
	cursor: pointer;
}

/* Animations */
@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
.fade-in {
	animation: fadeIn 0.3s ease-out;
}

/* Responsive */
@media ( min-width : 768px) {
	.main-content {
		max-width: 800px;
		margin: 0 auto;
	}
	.delivery-stats {
		gap: 20px;
	}
}
</style>
</head>
<body>
	<!-- Fixed Header -->
	<header class="header">
		<div class="header-title">
			<i class="fas fa-motorcycle"></i>
			<h2>Delivery Dashboard</h2>
		</div>
		<div class="user-profile">
			<img src="https://via.placeholder.com/40" alt="User"> <span>DP001</span>
		</div>
	</header>

	<!-- Main Content -->
	<main class="main-content">
	<section id="dashboard" class="section">
		<h3 class="section-title">
			<i class="fas fa-tachometer-alt"></i> Overview
		</h3>

		<div class="delivery-stats">
			<div class="stat-item">
				<h4>Pending</h4>
				<div class="stat-value">5</div>
			</div>
			<div class="stat-item">
				<h4>Completed</h4>
				<div class="stat-value">3</div>
			</div>
		</div>

		<div class="card">
			<h4>Recent Deliveries</h4>
			<table class="table">
				<thead>
					<tr>
						<th>Booking ID</th>
						<th>Customer</th>
						<th>Fuel</th>
						<th>Qty</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<Booking> deliveredBookings = (List<Booking>) request.getAttribute("deliveredBookings");
						if (deliveredBookings != null && !deliveredBookings.isEmpty()) {
							for (Booking b : deliveredBookings) {
					%>
					<tr>
						<td><%="BK" + b.getId()%></td>
						<td><%=b.getUserContact()%></td>
						<!-- Or b.getUserName() if available -->
						<td><%=b.getFuelType()%></td>
						<td><%=b.getQuantity()%> L</td>
						<td><span class="status-badge status-delivered">Delivered</span></td>
					</tr>
					<%
						}
						} else {
					%>
					<tr>
						<td colspan="5" style="text-align: center;">No deliveries
							made yet.</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</section>

	<!-- Assigned Bookings Section -->
	<section id="assigned-bookings" class="section">
		<h3 class="section-title">
			<i class="fas fa-list"></i> Assigned Bookings
		</h3>

		<div class="card">
			<table class="table">
				<thead>
					<tr>
						<th>Booking ID</th>
						<th>Contact</th>
						<th>Fuel</th>
						<th>Qty</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<Booking> assignedBookings = (List<Booking>) request.getAttribute("assignedBookings");
						if (assignedBookings != null && !assignedBookings.isEmpty()) {
							for (Booking b : assignedBookings) {
					%>
					<tr>
						<td><%="BK" + b.getId()%></td>
						<td><%=b.getUserContact()%></td>
						<td><%=b.getFuelType()%></td>
						<td><%=b.getQuantity()%> L</td>
						<td>
							<!-- Button to trigger modal -->
							<button class="btn btn-sm btn-success"
								onclick="openModal('<%=b.getId()%>')">Deliver</button>
						</td>
					</tr>
					<%
						}
						} else {
					%>
					<tr>
						<td colspan="6" style="text-align: center;">No assigned
							bookings found.</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</section>

	<!-- Change Password Section -->
	<section id="change-password" class="section">
		<h3 class="section-title">
			<i class="fas fa-key"></i> Change Password
		</h3>

		<div class="card">
			<form action="changeDeliveryPassword" method="post">
				<div class="form-group">
					<label for="current-password">Current Password</label> <input
						type="password" name="currentPassword" id="current-password"
						class="form-control" required>
				</div>
				<div class="form-group">
					<label for="new-password">New Password</label> <input
						type="password" name="newPassword" id="new-password"
						class="form-control" required>
				</div>
				<div class="form-group">
					<label for="confirm-password">Confirm Password</label> <input
						type="password" name="confirmPassword" id="confirm-password"
						class="form-control" required>
				</div>
				<button type="submit" class="btn btn-primary">Update
					Password</button>
			</form>

		</div>
	</section>
	</main>

	<!-- Bottom Navigation -->
	<nav class="nav-menu">
		<a href="#dashboard" class="nav-item active"> <i
			class="fas fa-tachometer-alt"></i> <span>Dashboard</span>
		</a> <a href="#assigned-bookings" class="nav-item"> <i
			class="fas fa-list"></i> <span>Bookings</span>
		</a> <a href="#change-password" class="nav-item"> <i
			class="fas fa-key"></i> <span>Password</span>
		</a> <a href="index" class="nav-item" id="logout-btn"> <i
			class="fas fa-sign-out-alt"></i> <span>Logout</span>
		</a>
	</nav>

	<!-- Delivery Confirmation Modal -->
	<div id="delivery-modal" class="modal">
		<div class="modal-content fade-in">
			<div class="modal-header">
				<h3>Confirm Delivery</h3>
				<button class="close-modal">&times;</button>
			</div>
			<form id="delivery-form">
				<input type="hidden" id="booking-id">
				<div class="form-group">
					<label for="delivery-code">Delivery Code</label> <input type="text"
						id="delivery-code" class="form-control"
						placeholder="Enter 6-digit code" required>
				</div>
				<button type="submit" class="btn">Confirm Delivery</button>
			</form>
		</div>
	</div>

	<!-- Delivery Confirmation Modal -->
	<div id="deliveryModal"
		style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); justify-content: center; align-items: center;">
		<div
			style="background: white; padding: 20px; border-radius: 8px; width: 300px; position: relative;">
			<h4>Enter Delivery Code</h4>
			<form id="deliveryForm" action="markDelivered" method="POST">
				<input type="hidden" id="modalBookingId" name="bookingId" />
				<div class="form-group">
					<label>Delivery Code</label> <input type="text" name="deliveryCode"
						required class="form-control" />
				</div>
				<br />
				<button type="submit" class="btn btn-primary">Confirm
					Delivery</button>
				<button type="button" onclick="closeModal()"
					class="btn btn-secondary">Cancel</button>
			</form>
		</div>
	</div>

	<script>
    function openModal(bookingId) {
        document.getElementById('modalBookingId').value = bookingId;
        document.getElementById('deliveryModal').style.display = 'flex';
    }

    function closeModal() {
        document.getElementById('deliveryModal').style.display = 'none';
    }
</script>


	<script>
        // Navigation active state
        const navItems = document.querySelectorAll('.nav-item');
        const sections = document.querySelectorAll('.section');
        
        function setActiveNav() {
            let index = sections.length;
            
            // Find which section is in view
            while(--index && window.scrollY + 100 < sections[index].offsetTop) {}
            
            // Update active nav item
            navItems.forEach(item => item.classList.remove('active'));
            navItems[index].classList.add('active');
        }
        
        window.addEventListener('scroll', setActiveNav);
        
        // Smooth scroll for navigation
        navItems.forEach(item => {
            item.addEventListener('click', function(e) {
                if(this.hash) {
                    e.preventDefault();
                    const target = document.querySelector(this.hash);
                    window.scrollTo({
                        top: target.offsetTop - 80,
                        behavior: 'smooth'
                    });
                }
            });
        });
        
        // Delivery modal handling
        document.querySelectorAll('[data-booking]').forEach(btn => {
            btn.addEventListener('click', function() {
                const bookingId = this.getAttribute('data-booking');
                document.getElementById('booking-id').value = bookingId;
                document.getElementById('delivery-modal').style.display = 'flex';
            });
        });
        
        document.querySelector('.close-modal').addEventListener('click', function() {
            document.getElementById('delivery-modal').style.display = 'none';
        });
        
        document.getElementById('delivery-form').addEventListener('submit', function(e) {
            e.preventDefault();
            const bookingId = document.getElementById('booking-id').value;
            const deliveryCode = document.getElementById('delivery-code').value;
            
            // Here you would typically send this data to the server
            alert(`Booking ${bookingId} marked as delivered with code ${deliveryCode}`);
            document.getElementById('delivery-modal').style.display = 'none';
        });
        
        // Logout confirmation
        document.getElementById('logout-btn').addEventListener('click', function(e) {
            e.preventDefault();
            if(confirm('Are you sure you want to logout?')) {
                window.location.href = 'index';
            }
        });
    </script>
</body>
</html>