<%@page import="java.util.List"%>
<%@page import="com.heramb.model.FuelStation"%>
<%@ page import="java.util.List"%>
<%@ page import="com.heramb.model.Booking"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fuel Indeed | User Dashboard</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
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
}

.user-dashboard {
	display: flex;
	min-height: 100vh;
}

.user-sidebar {
	width: 250px;
	background-color: #2c3e50;
	color: white;
	display: flex;
	flex-direction: column;
}

.sidebar-header {
	padding: 20px;
	text-align: center;
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.user-icon {
	width: 40px;
	height: 40px;
	margin-bottom: 10px;
}

.sidebar-nav {
	flex: 1;
	padding: 20px 0;
}

.sidebar-nav ul {
	list-style: none;
}

.sidebar-nav li a {
	display: flex;
	align-items: center;
	padding: 12px 20px;
	color: #ecf0f1;
	text-decoration: none;
	transition: all 0.3s;
}

.sidebar-nav li a i {
	margin-right: 10px;
	width: 20px;
	text-align: center;
}

.sidebar-nav li a:hover {
	background-color: #34495e;
}

.sidebar-nav li.active a {
	background-color: #3498db;
}

.sidebar-footer {
	padding: 20px;
	border-top: 1px solid rgba(255, 255, 255, 0.1);
}

.user-main {
	flex: 1;
	padding: 20px;
	overflow-y: auto;
}

.user-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
	padding-bottom: 20px;
	border-bottom: 1px solid #e0e0e0;
}

.header-left h2 {
	color: #2c3e50;
	margin-bottom: 5px;
}

.header-left p {
	color: #7f8c8d;
}

.user-name {
	color: #3498db;
	font-weight: bold;
}

.notification {
	position: relative;
	cursor: pointer;
}

.badge {
	position: absolute;
	top: -5px;
	right: -5px;
	background-color: #e74c3c;
	color: white;
	border-radius: 50%;
	width: 18px;
	height: 18px;
	font-size: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.card {
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
	padding: 20px;
	margin-bottom: 30px;
}

.overview-cards {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 20px;
	margin-bottom: 30px;
}

.stat-card {
	display: flex;
	align-items: center;
	padding: 20px;
	border-radius: 8px;
	color: white;
}

.stat-icon {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-right: 15px;
	font-size: 24px;
}

.stat-icon.bookings {
	background-color: #3498db;
}

.stat-icon.pending {
	background-color: #f39c12;
}

.stat-icon.delivered {
	background-color: #2ecc71;
}

.stat-info h3 {
	font-size: 16px;
	margin-bottom: 5px;
}

.stat-value {
	font-size: 24px;
	font-weight: bold;
}

.section-header {
	margin-bottom: 20px;
}

.section-header h3 {
	color: #2c3e50;
	display: flex;
	align-items: center;
}

.section-header h3 i {
	margin-right: 10px;
	color: #3498db;
}

.section-header p {
	color: #7f8c8d;
	font-size: 14px;
}

.search-form {
	margin-bottom: 20px;
}

.form-row {
	display: flex;
	gap: 15px;
	margin-bottom: 15px;
}

.form-group {
	flex: 1;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	font-weight: 500;
	color: #2c3e50;
}

.form-group input, .form-group select, .form-group textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 14px;
}

.form-group textarea {
	min-height: 80px;
	resize: vertical;
}

.table-responsive {
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 12px 15px;
	text-align: left;
	border-bottom: 1px solid #eee;
}

th {
	background-color: #f8f9fa;
	font-weight: 600;
	color: #2c3e50;
}

tr:hover {
	background-color: #f8f9fa;
}

.btn {
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
	font-weight: 500;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	transition: all 0.3s;
}

.btn i {
	margin-right: 5px;
}

.btn-primary {
	background-color: #3498db;
	color: white;
}

.btn-primary:hover {
	background-color: #2980b9;
}

.btn-secondary {
	background-color: #95a5a6;
	color: white;
}

.btn-secondary:hover {
	background-color: #7f8c8d;
}

.btn-logout {
	background-color: transparent;
	color: white;
	width: 100%;
	text-align: left;
	padding: 10px 20px;
}

.btn-logout:hover {
	background-color: #34495e;
}

.btn-book {
	background-color: #2ecc71;
	color: white;
}

.btn-book:hover {
	background-color: #27ae60;
}

.status-badge {
	padding: 5px 10px;
	border-radius: 20px;
	font-size: 12px;
	font-weight: 500;
}

.status-pending {
	background-color: #FFF3CD;
	color: #856404;
}

.status-assigned {
	background-color: #D1ECF1;
	color: #0C5460;
}

.status-delivered {
	background-color: #D4EDDA;
	color: #155724;
}

.status-rejected {
	background-color: #F8D7DA;
	color: #721C24;
}

.no-results {
	text-align: center;
	padding: 20px;
	color: #7f8c8d;
	font-style: italic;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: #fefefe;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	border-radius: 5px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.modal-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 1px solid #eee;
	padding-bottom: 10px;
	margin-bottom: 20px;
}

.modal-close {
	background: none;
	border: none;
	font-size: 1.5rem;
	cursor: pointer;
}

.modal-footer {
	margin-top: 20px;
	display: flex;
	justify-content: flex-end;
	gap: 10px;
}

@media ( max-width : 768px) {
	.user-dashboard {
		flex-direction: column;
	}
	.user-sidebar {
		width: 100%;
	}
	.modal-content {
		width: 90%;
	}
	.form-row {
		flex-direction: column;
		gap: 10px;
	}
}
</style>
</head>
<body>
	<div class="user-dashboard">
		<!-- Sidebar Navigation -->
		<aside class="user-sidebar">
			<div class="sidebar-header">
				<svg width="40" height="40" viewBox="0 0 24 24" class="user-icon">
                    <path
						d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"
						fill="#FFFFFF" />
                </svg>
				<h3>User Panel</h3>
			</div>
			<nav class="sidebar-nav">
				<ul>
					<li class="active"><a href="#dashboard"><i
							class="fas fa-tachometer-alt"></i> Dashboard</a></li>
					<li><a href="#find-stations"><i class="fas fa-gas-pump"></i>
							Find Fuel Stations</a></li>
					<li><a href="#pending-bookings"><i class="fas fa-clock"></i>
							Pending Bookings</a></li>
					<li><a href="#assigned-bookings"><i class="fas fa-truck"></i>
							Assigned Bookings</a></li>
					<li><a href="#delivered-bookings"><i
							class="fas fa-check-circle"></i> Delivered</a></li>
					<li><a href="#rejected-bookings"><i
							class="fas fa-times-circle"></i> Rejected</a></li>
					<li><a href="#change-password"><i class="fas fa-key"></i>
							Change Password</a></li>
				</ul>
			</nav>
			<div class="sidebar-footer">
				<a href="index" class="btn btn-logout"><i
					class="fas fa-sign-out-alt"></i> Logout</a>
			</div>
		</aside>

		<!-- Main Content Area -->
		<main class="user-main">
		 <header
			class="user-header">
			<div class="header-left">
				<h2>User Dashboard</h2>
				<p>
					Welcome back, <span class="user-name">John Doe</span>
				</p>
			</div>
			<div class="header-right">
				<div class="notification">
					<i class="fas fa-bell"></i> <span class="badge">3</span>
				</div>
			</div>
		</header>
		<section class="content-section" id="find-stations">
			<div class="section-header">
				<h3>
					<i class="fas fa-gas-pump"></i> Find Fuel Stations
				</h3>
				<p>Search and book fuel from nearby stations</p>
			</div>
			<div class="card">
				<form class="search-form" action="searchStations" method="get">
					<div class="form-row">
						<div class="form-group">
							<label for="searchArea">Search by Area/City/Pincode</label> <input
								type="text" id="searchArea" name="addressFragment"
								placeholder="Enter area, city or pincode">
						</div>
						<button type="submit" class="btn btn-primary">
							<i class="fas fa-search"></i> Search
						</button>
					</div>
				</form>


				<div class="table-responsive">
					<table id="stationsTable" class="display">
						<thead>
							<tr>
								<th>Station Name</th>
								<th>Address</th>
								<th>Petrol (L)</th>
								<th>Diesel (L)</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<FuelStation> stations = (List<FuelStation>) request.getAttribute("stations");
								if (stations != null && !stations.isEmpty()) {
									for (FuelStation station : stations) {
							%>
							<tr>
								<td><%=station.getName()%></td>
								<td><%=station.getAddress()%></td>
								<td><%=station.getPetrolRate()%></td>
								<td><%=station.getDieselRate()%></td>
								<td>
									<form action="bookFuel?sid=<%=station.getContact()%>"
										method="post" style="display: inline;">
										<input type="hidden" name="stationId"
											value="<%=station.getStationId()%>" />
										<button type="submit" class="btn btn-book">
											<i class="fas fa-cart-plus"></i> Book Fuel
										</button>
									</form>
								</td>
							</tr>
							<%
								}
								} else {
							%>
							<tr>
								<td colspan="5" class="text-center">No fuel stations
									available.</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</section>

		<!-- Pending Bookings Section -->
		<section class="content-section" id="pending-bookings">
			<div class="section-header">
				<h3>
					<i class="fas fa-clock"></i> Pending Bookings
				</h3>
				<p>Your fuel orders waiting for confirmation</p>
			</div>
			<div class="card">
				<div class="table-responsive">
					<table id="pendingBookingsTable" class="display">
						<thead>
							<tr>
								<th>Order ID</th>
								<th>Station</th>
								<th>Fuel Type</th>
								<th>Quantity</th>
								<th>Total</th>
								<th>Date</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<Booking> bookings = (List<Booking>) request.getAttribute("pendingBookings");
								if (bookings != null && !bookings.isEmpty()) {
									for (Booking b : bookings) {
							%>
							<tr>
								<td><%="ORD-" + b.getId()%></td>
								<td><%=b.getStationContact()%></td>
								<td><%=b.getFuelType()%></td>
								<td><%=b.getQuantity()%> L</td>
								<td><%=String.format("%.2f", b.getTotalBill())%></td>
								<td><%=b.getBookingDateTime().toLocalDate()%></td>
								<td><span class="status-badge status-pending"><%=b.getStatus().name()%></span></td>
							</tr>
							<%
								}
								} else {
							%>
							<tr>
								<td colspan="7" style="text-align: center;">No pending
									bookings found.</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</section>

		<!-- Assigned Bookings Section -->
		<section class="content-section" id="assigned-bookings">
			<div class="section-header">
				<h3>
					<i class="fas fa-truck"></i> Assigned Bookings
				</h3>
				<p>Your fuel orders that are on the way</p>
			</div>
			<div class="card">
				<div class="table-responsive">
					<table id="assignedBookingsTable" class="display">
						<thead>
							<tr>
								<th>Order ID</th>
								<th>Station</th>
								<th>Fuel Type</th>
								<th>Quantity</th>
								<th>Delivery Person</th>
								<th>Contact</th>
								<th>Delivery Code</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<Booking> bookings1 = (List<Booking>) request.getAttribute("approvedBookings");
								if (bookings1 != null && !bookings1.isEmpty()) {
									for (Booking b : bookings1) {
							%>
							<tr>
								<td><%="ORD-" + b.getId()%></td>
								<td><%=b.getStationContact()%></td>
								<td><%=b.getFuelType()%></td>
								<td><%=b.getQuantity()%> L</td>
								<td><%=String.format("%.2f", b.getTotalBill())%></td>
								<td><%=b.getBookingDateTime().toLocalDate()%></td>
								<td><%=b.getDeliveryCode()%></td>
								<td><span class="status-badge status-pending"><%=b.getStatus().name()%></span></td>
							</tr>
							<%
								}
								} else {
							%>
							<tr>
								<td colspan="7" style="text-align: center;">No pending
									bookings found.</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</section>

		<!-- Delivered Bookings Section -->
		<section class="content-section" id="delivered-bookings">
			<div class="section-header">
				<h3>
					<i class="fas fa-check-circle"></i> Delivered Bookings
				</h3>
				<p>Your completed fuel orders</p>
			</div>
			<div class="card">
				<div class="table-responsive">
					<table id="deliveredBookingsTable" class="display">
						<thead>
							<tr>
								<th>Order ID</th>
								<th>Station</th>
								<th>Fuel Type</th>
								<th>Quantity</th>
								<th>Total</th>
								<th>Delivered On</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<Booking> bookings2 = (List<Booking>) request.getAttribute("deliveredBookings");
								if (bookings2 != null && !bookings2.isEmpty()) {
									for (Booking b : bookings2) {
							%>
							<tr>
								<td><%="ORD-" + b.getId()%></td>
								<td><%=b.getStationContact()%></td>
								<td><%=b.getFuelType()%></td>
								<td><%=b.getQuantity()%> L</td>
								<td><%=String.format("%.2f", b.getTotalBill())%></td>
								<td><%=b.getBookingDateTime().toLocalDate()%></td>
								<td><span class="status-badge status-pending"><%=b.getStatus().name()%></span></td>
							</tr>
							<%
								}
								} else {
							%>
							<tr>
								<td colspan="7" style="text-align: center;">No pending
									bookings found.</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</section>

		<!-- Rejected Bookings Section -->
		<section class="content-section" id="rejected-bookings">
			<div class="section-header">
				<h3>
					<i class="fas fa-times-circle"></i> Rejected Bookings
				</h3>
				<p>Your declined fuel orders</p>
			</div>
			<div class="card">
				<div class="table-responsive">
					<table id="rejectedBookingsTable" class="display">
						<thead>
							<tr>
								<th>Order ID</th>
								<th>Station</th>
								<th>Fuel Type</th>
								<th>Quantity</th>
								<th>Reason</th>
								<th>Date</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<Booking> bookings4 = (List<Booking>) request.getAttribute("rejectedBookings");
								if (bookings4 != null && !bookings4.isEmpty()) {
									for (Booking b : bookings) {
							%>
							<tr>
								<td><%="ORD-" + b.getId()%></td>
								<td><%=b.getStationContact()%></td>
								<td><%=b.getFuelType()%></td>
								<td><%=b.getQuantity()%> L</td>
								<td><%=String.format("%.2f", b.getTotalBill())%></td>
								<td><%=b.getBookingDateTime().toLocalDate()%></td>
								<td><span class="status-badge status-pending"><%=b.getStatus().name()%></span></td>
							</tr>
							<%
								}
								} else {
							%>
							<tr>
								<td colspan="7" style="text-align: center;">No pending
									bookings found.</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</section>

		<!-- Change Password Section -->
		<section class="content-section" id="change-password">
			<div class="section-header">
				<h3>
					<i class="fas fa-key"></i> Change Password
				</h3>
				<p>Update your account password</p>
			</div>
			<div class="card">
				<form class="password-form" action="changePassword" method="POST">
					<div class="form-group">
						<label for="currentPassword">Current Password</label> 
						<input
							type="password" id="currentPassword" name="currentPassword"
							required>
					</div>
					<div class="form-group">
						<label for="newPassword">New Password</label> 
						<input
							type="password" id="newPassword" name="newPassword" required>
					</div>
					<div class="form-group">
						<label for="confirmPassword">Confirm New Password</label> 
						<input
							type="password" id="confirmPassword" name="confirmPassword"
							required>
					</div>
					<button type="submit" class="btn btn-primary">
						<i class="fas fa-save"></i> Update Password
					</button>
				</form>
			</div>
		</section>
		</main>
	</div>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

</body>
</html>