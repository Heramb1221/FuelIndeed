<%@ page import="com.heramb.model.FuelStation"%>
<%@ page import="com.heramb.model.DeliveryPerson"%>
<%@ page import="java.util.List"%>
<%@ page import="com.heramb.model.Booking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Fuel Indeed | Station Dashboard</title>
<link rel="stylesheet" href="./resources/css/shared.css">
<link rel="stylesheet" href="./resources/css/stationDashboard.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
</head>
<body>
	<div class="station-dashboard">
		<!-- Sidebar Navigation -->
		<aside class="station-sidebar">
			<div class="sidebar-header">
				<svg width="40" height="40" viewBox="0 0 24 24" class="station-icon">
                    <path
						d="M1 13h6v8H1v-8zm6-12h6v6H7V1zm6 12h6v8h-6v-8zM7 7h6v6H7V7zm12-6h4v20h-4V1z"
						fill="#FFFFFF" />
                    <path
						d="M3 13h2v6H3v-6zm6-12h2v4H9V1zm6 12h2v6h-2v-6z" fill="#FFD700" />
                </svg>
				<h3>Station Panel</h3>
			</div>
			<nav class="sidebar-nav">
				<ul>
					<li class="active"><a href="#dashboard"> <i
							class="fas fa-tachometer-alt"></i> Dashboard
					</a></li>
					<li><a href="#fuel-management"> <i class="fas fa-gas-pump"></i>
							Fuel Management
					</a></li>
					<li><a href="#delivery-persons"> <i
							class="fas fa-motorcycle"></i> Delivery Persons
					</a></li>
					<li><a href="#pending-bookings"> <i class="fas fa-clock"></i>
							Pending Bookings <span class="badge">0</span>
					</a></li>
					<li><a href="#assigned-bookings"> <i class="fas fa-truck"></i>
							Today's Assignments
					</a></li>
					<li><a href="#delivered-bookings"> <i
							class="fas fa-check-circle"></i> Delivered
					</a></li>
					<li><a href="#rejected-bookings"> <i
							class="fas fa-times-circle"></i> Rejected
					</a></li>
				</ul>
			</nav>
			<div class="sidebar-footer">
				<a href="index" class="btn btn-logout"> <i
					class="fas fa-sign-out-alt"></i> Logout
				</a>
			</div>
		</aside>

		<!-- Main Content Area -->
		<main class="station-main"> <header class="station-header">
			<div class="header-left">
				<h2>Station Dashboard</h2>
				<p>
					Welcome back, <span class="station-name">Sample Fuel Station</span>
				</p>
			</div>
			<div class="header-right">
				<div class="notification">
					<i class="fas fa-bell"></i> <span class="badge">0</span>
				</div>
			</div>
		</header> 
		
		<!-- Dashboard Overview Section -->
		<section class="dashboard-overview" id="dashboard">
			<%
				FuelStation station = (FuelStation) session.getAttribute("loggedInStation");
				if (station != null) {
			%>
			<div class="overview-cards">
				<div class="card stat-card">
					<div class="stat-icon petrol">
						<i class="fas fa-gas-pump"></i>
					</div>
					<div class="stat-info">
						<h3>Petrol Available</h3>
						<p class="stat-value"><%=station.getPetrolQty()%>
							Liters
						</p>
						<p class="stat-rate">
							₹<%=station.getPetrolRate()%>
							/Ltr
						</p>
					</div>
				</div>

				<div class="card stat-card">
					<div class="stat-icon diesel">
						<i class="fas fa-gas-pump"></i>
					</div>
					<div class="stat-info">
						<h3>Diesel Available</h3>
						<p class="stat-value"><%=station.getDieselQty()%>
							Liters
						</p>
						<p class="stat-rate">
							₹<%=station.getDieselRate()%>
							/Ltr
						</p>
					</div>
				</div>
				<%
					} else {
				%>
				<p style="color: red;">
					Station not logged in. <a href="/stationLogin">Login here</a>
				</p>
				<%
					}
				%>
			</div>
		</section>

		<!-- Fuel Management Section -->
		<section class="content-section" id="fuel-management">
			<form action="updateFuelInfo" method="post">
				<div class="card">
					<div class="fuel-management-form">
						<div class="form-row">
							<div class="form-group">
								<label for="petrolQuantity">Petrol Quantity (liters)</label> 
								<input
									type="number" id="petrolQuantity" name="petrolQuantity"
									value="<%=station != null ? station.getPetrolQty() : 0%>">
							</div>
							<div class="form-group">
								<label for="petrolRate">Petrol Rate (₹ per liter)</label> 
								<input
									type="number" id="petrolRate" name="petrolRate" step="0.01"
									value="<%=station != null ? station.getPetrolRate() : 0.0%>">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group">
								<label for="dieselQuantity">Diesel Quantity (liters)</label> 
								<input
									type="number" id="dieselQuantity" name="dieselQuantity"
									value="<%=station != null ? station.getDieselQty() : 0%>">
							</div>
							<div class="form-group">
								<label for="dieselRate">Diesel Rate (₹ per liter)</label> 
								<input
									type="number" id="dieselRate" name="dieselRate" step="0.01"
									value="<%=station != null ? station.getDieselRate() : 0.0%>">
							</div>
						</div>

						<button type="submit" class="btn btn-primary btn-update">
							<i class="fas fa-sync-alt"></i> Update Fuel Info
						</button>
					</div>
				</div>
			</form>


		</section>

		<!-- Delivery Persons Section -->
		<section class="content-section" id="delivery-persons">
			<div class="section-header">
				<h3>
					<i class="fas fa-motorcycle"></i> Delivery Persons
				</h3>
				<p>Manage your delivery personnel</p>
			</div>
			<div class="card">
				<div class="table-actions">
					<button type="button" class="btn btn-primary btn-add"
						id="openAddModal">
						<i class="fas fa-plus"></i> Add Delivery Person
					</button>
				</div>
				<div class="table-responsive">
					<table id="deliveryPersonsTable" class="display">
						<thead>
							<tr>
								<th>Name</th>
								<th>Contact</th>
								<th>ID Number</th>
								<!-- You can update this if needed -->
								<th>Status</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<DeliveryPerson> deliveryPersons = (List<DeliveryPerson>) request.getAttribute("deliveryPersons");
								if (deliveryPersons != null && !deliveryPersons.isEmpty()) {
									for (DeliveryPerson dp : deliveryPersons) {
							%>
							<tr>
								<td><%=dp.getName()%></td>
								<td><%=dp.getContact()%></td>
								<td><%=dp.getContact()%></td>
								<td><span class="status-badge active">Active</span></td>
								<td>
									<div class="action-buttons">
										<button class="btn btn-edit"
											data-contact="<%=dp.getContact()%>">
											<i class="fas fa-edit"></i> Edit
										</button>

										<!-- Delete Form -->
										<form action="deleteDeliveryPerson" method="post"
											style="display: inline;">
											<input type="hidden" name="contact"
												value="<%=dp.getContact()%>" />
											<button type="submit" class="btn btn-delete"
												onclick="return confirm('Delete delivery person?');">
												<i class="fas fa-trash"></i> Delete
											</button>
										</form>
									</div>
								</td>
							</tr>
							<%
								}
								} else {
							%>
							<tr>
								<td colspan="5" class="text-center">No delivery persons
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
				<p>Assign or reject incoming fuel orders</p>
			</div>
			<div class="card">
				<div class="table-responsive">
					<table id="pendingBookingsTable" class="display">
						<thead>
							<tr>
								<th>Order ID</th>
								<th>Customer</th>
								<th>Fuel Type</th>
								<th>Quantity</th>
								<th>Total</th>
								<th>Requested Time</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<Booking> pendingBookings = (List<Booking>) request.getAttribute("pendingBookings");
								if (pendingBookings != null && !pendingBookings.isEmpty()) {
									for (Booking b : pendingBookings) {
							%>
							<tr>
								<td><%="ORD-" + b.getId()%></td>
								<td><%=b.getUserContact()%></td>
								<td><%=b.getFuelType()%></td>
								<td><%=b.getQuantity()%> liters</td>
								<td><%=String.format("%.2f", b.getTotalBill())%></td>
								<td><%=b.getBookingDateTime().toLocalTime()%></td>
								<td>
									<div class="action-buttons">
										<!-- ASSIGN -->
										<form id="assignForm-<%=b.getId()%>" method="POST"
											action="assignBooking" style="display: inline;">
											<input type="hidden" name="bookingId" value="<%=b.getId()%>" />
											<input type="hidden" name="deliveryPartnerContact"
												id="dpContact-<%=b.getId()%>" />
											<button type="button" class="btn btn-assign"
												onclick="assignBooking(<%=b.getId()%>)">
												<i class="fas fa-user-check"></i> Assign
											</button>
										</form>

										<!-- REJECT -->
										<form method="POST" action="rejectBooking"
											style="display: inline;">
											<input type="hidden" name="bookingId" value="<%=b.getId()%>" />
											<button type="submit" class="btn btn-reject">
												<i class="fas fa-times"></i> Reject
											</button>
										</form>
									</div>

								</td>
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
					<i class="fas fa-truck"></i>Assigned Bookings
				</h3>
				<p>Track your current deliveries</p>
			</div>
			<div class="card">
				<div class="table-responsive">
					<table id="assignedBookingsTable" class="display">
						<thead>
							<tr>
								<th>Order ID</th>
								<th>Customer</th>
								<th>Fuel Type</th>
								<th>Quantity</th>
								<th>Assigned To</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<Booking> approvedBookings = (List<Booking>) request.getAttribute("approvedBookings");
								if (approvedBookings != null && !approvedBookings.isEmpty()) {
									for (Booking b : approvedBookings) {
							%>
							<tr>
								<td><%="ORD-" + b.getId()%></td>
								<td><%=b.getUserContact()%></td>
								<td><%=b.getFuelType()%></td>
								<td><%=b.getQuantity()%> liters</td>
								<td><%=String.format("%.2f", b.getTotalBill())%></td>
								<td><%=b.getBookingDateTime().toLocalTime()%></td>
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
				<p>Completed fuel deliveries</p>
			</div>
			<div class="card">
				<div class="table-responsive">
					<table id="deliveredBookingsTable" class="display">
						<thead>
							<tr>
								<th>Order ID</th>
								<th>Customer</th>
								<th>Fuel Type</th>
								<th>Quantity</th>
								<th>Delivered By</th>
								<th>Delivered On</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<Booking> deliveredBookings = (List<Booking>) request.getAttribute("deliveredBookings");
								if (deliveredBookings != null && !deliveredBookings.isEmpty()) {
									for (Booking b : deliveredBookings) {
							%>
							<tr>
								<td><%="ORD-" + b.getId()%></td>
								<td><%=b.getUserContact()%></td>
								<td><%=b.getFuelType()%></td>
								<td><%=b.getQuantity()%> liters</td>
								<td><%=String.format("%.2f", b.getTotalBill())%></td>
								<td><%=b.getBookingDateTime().toLocalTime()%></td>
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
				<p>Declined fuel orders</p>
			</div>
			<div class="card">
				<div class="table-responsive">
					<table id="rejectedBookingsTable" class="display">
						<thead>
							<tr>
								<th>Order ID</th>
								<th>Customer</th>
								<th>Fuel Type</th>
								<th>Quantity</th>
								<th>Reason</th>
								<th>Rejected On</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<Booking> rejectedBookings = (List<Booking>) request.getAttribute("rejectedBookings");
								if (rejectedBookings != null && !rejectedBookings.isEmpty()) {
									for (Booking b : rejectedBookings) {
							%>
							<tr>
								<td><%="ORD-" + b.getId()%></td>
								<td><%=b.getUserContact()%></td>
								<td><%=b.getFuelType()%></td>
								<td><%=b.getQuantity()%> liters</td>
								<td><%=String.format("%.2f", b.getTotalBill())%></td>
								<td><%=b.getBookingDateTime().toLocalTime()%></td>
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
		</main>
	</div>

	<!-- Assign Delivery Person Modal -->
	<div class="modal" id="assignModal">
		<div class="modal-content">
			<div class="modal-header">
				<h4>Assign Delivery Person</h4>
				<button class="modal-close">&times;</button>
			</div>
			<div class="modal-body">
				<div class="assign-form">
					<div class="form-group">
						<label>Order ID:</label>
						<p class="order-id">ORD-1001</p>
					</div>
					<div class="form-group">
						<label>Customer:</label>
						<p class="customer-name">John Doe</p>
					</div>
					<div class="form-group">
						<label>Fuel Details:</label>
						<p class="fuel-details">10 liters of Petrol (₹967.20)</p>
					</div>
					<div class="form-group">
						<label for="deliveryPerson">Select Delivery Person:</label> <select
							id="deliveryPerson" class="form-control">
							<option value="">-- Select --</option>
							<option value="DP-001">Rahul Sharma (DP-001)</option>
							<option value="DP-002">Priya Patel (DP-002)</option>
						</select>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary modal-close">Cancel</button>
				<button class="btn btn-primary">Confirm Assignment</button>
			</div>
		</div>
	</div>

	<!-- Add/Edit Delivery Person Modal -->
	<div class="modal" id="deliveryPersonModal">
		<div class="modal-content">
			<div class="modal-header">
				<h4>Add Delivery Person</h4>
				<button class="modal-close">&times;</button>
			</div>
			<div class="modal-body">
				<form class="delivery-person-form" action="addDeliveryPerson"
					method="post">
					<div class="form-group">
						<label for="dpName">Full Name</label> <input type="text"
							id="dpName" name="dpName" required>
					</div>
					<div class="form-group">
						<label for="dpContact">Contact Number</label> <input type="tel"
							id="dpContact" name="dpContact" required>
					</div>
					<div class="form-group">
						<label for="dpEmail">Email</label> <input type="email"
							id="dpEmail" name="dpEmail" required>
					</div>
					<div class="form-group">
						<label for="dpPassword">Password</label> <input type="text"
							id="dpPass" name="dpPass" required>
					</div>
					<div class="form-group">
						<label for="dpAddress">Address</label>
						<textarea id="dpAddress" name="dpAddress" rows="3" required></textarea>
					</div>
					<div class="form-group">
						<label for="stationId">StationId</label>
						<textarea id="stationId" name="stationId" required></textarea>
					</div>
					<div class="form-group">
						<label for="dpCity">City</label>
						<textarea id="dpCity" name="dpCity" required></textarea>
					</div>
					<div class="form-group">
						<label for="dpPincode">Pincode</label>
						<textarea id="dpPincode" name="dpPincode" required></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary modal-close">Cancel</button>
						<button type="submit" class="btn btn-primary">Save
							Details</button>
					</div>
				</form>
			</div>
		</div>
	</div>



	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

	<script>
		$(document).ready(function() {
			// Debug: Confirm DOM ready
			console.log("DOM ready, binding event handlers");

			$('#openAddModal').on('click', function() {
				console.log("Add Delivery Person button clicked");
				$('#deliveryPersonModal').fadeIn();
			});

			$('.modal-close, .btn-secondary').on('click', function() {
				console.log("Modal close button clicked");
				$(this).closest('.modal').fadeOut();
			});

			$(window).on('click', function(e) {
				if ($(e.target).hasClass('modal')) {
					console.log("Clicked outside modal content");
					$(e.target).fadeOut();
				}
			});
		});
	</script>
	<script>
	function assignBooking(bookingId) {
		var contact = prompt("Enter Delivery Partner Contact Number:");

		if (contact && contact.trim() !== "") {
			document.getElementById("dpContact-" + bookingId).value = contact;
			document.getElementById("assignForm-" + bookingId).submit();
		} else {
			alert("Delivery partner contact is required!");
		}
	}
</script>
</body>
</html>