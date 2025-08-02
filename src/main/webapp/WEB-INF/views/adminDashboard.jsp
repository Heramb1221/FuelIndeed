<%@ page import="java.util.List"%>
<%@ page import="com.heramb.model.FuelStation"%>
<%@ page import="java.util.List"%>
<%@ page import="com.heramb.model.Users"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Fuel Indeed | Admin Dashboard</title>
<link rel="stylesheet" href="./resources/css/shared.css">
<link rel="stylesheet" href="./resources/css/adminDashboard.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
</head>
<body>
	<div class="admin-dashboard">
		<!-- Sidebar Navigation -->
		<aside class="admin-sidebar">
			<div class="sidebar-header">
				<svg width="40" height="40" viewBox="0 0 24 24" class="admin-icon">
                    <path
						d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"
						fill="#FFFFFF" />
                    <path d="M18 8h-1V5h-2v3h-3v2h3v3h2v-3h3V8z"
						fill="#FFD700" />
                </svg>
				<h3>Admin Panel</h3>
			</div>
			<nav class="sidebar-nav">
				<ul>
					<li class="active"><a href="#dashboard"> <i
							class="fas fa-tachometer-alt"></i> Dashboard
					</a></li>
					<li><a href="#pending-stations"> <i class="fas fa-clock"></i>
							Pending Stations <span class="badge"><%=request.getAttribute("pendingStationCount")%></span>
					</a></li>
					<li><a href="#approved-stations"> <i
							class="fas fa-check-circle"></i> Approved Stations <span class="badge"><%=request.getAttribute("approvedStationCount")%></span>
					</a></li>
					<li><a href="#rejected-stations"> <i
							class="fas fa-times-circle"></i> Rejected Stations <span class="badge"><%=request.getAttribute("rejectedStationCount")%></span>
					</a></li>
					<li><a href="#users"> <i class="fas fa-users"></i> Users
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
		<main class="admin-main"> <!-- Top Header Bar --> <header
			class="admin-header">
			<div class="header-left">
				<h2>Admin Dashboard</h2>
				<p>Welcome back, Admin</p>
			</div>
			<div class="header-right">
				<div class="notification">
					<i class="fas fa-bell"></i>
				</div>
			</div>
		</header> <!-- Dashboard Overview Cards -->
		<section class="dashboard-overview" id="dashboard">
			<div class="overview-cards">
				<div class="card stat-card">
					<div class="stat-icon pending">
						<i class="fas fa-clock"></i>
					</div>
					<div class="stat-info">
						<h3>Pending Stations</h3>
						<p class="stat-value"><%=request.getAttribute("pendingStationCount")%></p>
						<a href="#pending-stations" class="stat-link">View All</a>
					</div>
				</div>

				<div class="card stat-card">
					<div class="stat-icon approved">
						<i class="fas fa-check"></i>
					</div>
					<div class="stat-info">
						<h3>Approved Stations</h3>
						<p class="stat-value"><%=request.getAttribute("approvedStationCount")%></p>
						<a href="#approved-stations" class="stat-link">View All</a>
					</div>
				</div>

				<div class="card stat-card">
					<div class="stat-icon rejected">
						<i class="fas fa-times"></i>
					</div>
					<div class="stat-info">
						<h3>Rejected Stations</h3>
						<p class="stat-value"><%=request.getAttribute("rejectedStationCount")%></p>
						<a href="#rejected-stations" class="stat-link">View All</a>
					</div>
				</div>

				<div class="card stat-card">
					<div class="stat-icon users">
						<i class="fas fa-users"></i>
					</div>
					<div class="stat-info">
						<h3>Registered Users</h3>
						<p class="stat-value"><%=request.getAttribute("userCount")%></p>
						<a href="#users" class="stat-link">View All</a>
					</div>
				</div>
			</div>
		</section>

		<!-- Pending Stations Section -->
		<section class="content-section" id="pending-stations">
			<div class="section-header">
				<h3>
					<i class="fas fa-clock"></i> Pending Fuel Stations
				</h3>
				<p>Approve or reject new station registrations</p>
			</div>
			<div class="card">
				<div class="table-responsive">
					<table id="pendingStationsTable" class="display">
						<thead>
							<tr>
								<th>Station Name</th>
								<th>Contact</th>
								<th>Location</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<FuelStation> pendingStations = (List<FuelStation>) request.getAttribute("pendingStations");
								if (pendingStations != null) {
									for (FuelStation fs : pendingStations) {
							%>
							<tr>
								<td><%=fs.getName()%></td>
								<td><%=fs.getContact()%></td>
								<td><%=fs.getCity()%>, <%=fs.getArea()%></td>
								<td>
									<div class="action-buttons">
										<form action="approveStation" method="post"
											style="display: inline;">
											<input type="hidden" name="contact"
												value="<%=fs.getContact()%>" />
											<button class="btn btn-approve" type="submit">
												<i class="fas fa-check"></i> Approve
											</button>
										</form>
										<form action="rejectStation" method="post"
											style="display: inline;">
											<input type="hidden" name="contact"
												value="<%=fs.getContact()%>" />
											<button class="btn btn-reject" type="submit">
												<i class="fas fa-times"></i> Reject
											</button>
										</form>
										<button class="btn btn-view" data-id="<%=fs.getContact()%>">
											<i class="fas fa-eye"></i> View
										</button>
									</div>
								</td>
							</tr>
							<%
								}
								} else {
							%>
							<tr>
								<td colspan="6">No pending stations found.</td>
							</tr>
							<%
								}
							%>

						</tbody>
					</table>
				</div>
			</div>
		</section>

		<!-- Approved Stations Section -->
		<section class="content-section" id="approved-stations">
			<div class="section-header">
				<h3>
					<i class="fas fa-check-circle"></i> Approved Fuel Stations
				</h3>
				<p>Manage currently active fuel stations</p>
			</div>
			<div class="card">
				<div class="table-responsive">
					<table id="approvedStationsTable" class="display">
						<thead>
							<tr>
								<th>Station Name</th>
								<th>Contact</th>
								<th>Location</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<FuelStation> approvedStations = (List<FuelStation>) request.getAttribute("approvedStations");
								if (approvedStations != null && !approvedStations.isEmpty()) {
									for (FuelStation fs : approvedStations) {
							%>
							<tr>
								<td><%=fs.getName()%></td>
								<td><%=fs.getContact()%></td>
								<td><%=fs.getCity()%>, <%=fs.getArea()%></td>
								<td>
									<div class="action-buttons">
										<!-- Suspend form -->
										<form action="suspendStation" method="post"
											style="display: inline;">
											<input type="hidden" name="contact"
												value="<%=fs.getContact()%>" />
											<button class="btn btn-suspend" type="submit">
												<i class="fas fa-pause"></i> Suspend
											</button>
										</form>

										<!-- View button -->
										<button class="btn btn-view" data-id="<%=fs.getContact()%>">
											<i class="fas fa-eye"></i> View
										</button>
									</div>
								</td>
							</tr>
							<%
								}
								} else {
							%>
							<tr>
								<td colspan="5">No approved stations found.</td>
							</tr>
							<%
								}
							%>

						</tbody>
					</table>
				</div>
			</div>
		</section>

		<!-- Rejected Stations Section -->
		<section class="content-section" id="rejected-stations">
			<div class="section-header">
				<h3>
					<i class="fas fa-times-circle"></i> Rejected Fuel Stations
				</h3>
				<p>Previously rejected station applications</p>
			</div>
			<div class="card">
				<div class="table-responsive">
					<table id="rejectedStationsTable" class="display">
						<thead>
							<tr>
								<th>Station Name</th>
								<th>Contact</th>
								<th>Location</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<FuelStation> rejectedStations = (List<FuelStation>) request.getAttribute("rejectedStations");
								if (rejectedStations != null && !rejectedStations.isEmpty()) {
									for (FuelStation fs : rejectedStations) {
							%>
							<tr>
								<td><%=fs.getName()%></td>
								<td><%=fs.getContact()%></td>
								<td><%=fs.getCity()%>, <%=fs.getArea()%></td>
								<td>
									<div class="action-buttons">
										<!-- Suspend form -->
										<form action="suspendStation" method="post"
											style="display: inline;">
											<input type="hidden" name="contact"
												value="<%=fs.getContact()%>" />
											<button class="btn btn-suspend" type="submit">
												<i class="fas fa-pause"></i> Suspend
											</button>
										</form>

										<!-- View button -->
										<button class="btn btn-view" data-id="<%=fs.getContact()%>">
											<i class="fas fa-eye"></i> View
										</button>
									</div>
								</td>
							</tr>
							<%
								}
								} else {
							%>
							<tr>
								<td colspan="5">No approved stations found.</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</section>

		<!-- Users Section -->
		<section class="content-section" id="users">
			<div class="section-header">
				<h3>
					<i class="fas fa-users"></i> Registered Users
				</h3>
				<p>Manage all user accounts</p>
			</div>
			<div class="card">
				<div class="table-responsive">
					<table id="usersTable" class="display">
						<thead>
							<tr>
								<th>Name</th>
								<th>Contact</th>
								<th>Email</th>
								<th>Location</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<Users> allUsers = (List<Users>) request.getAttribute("allUsers");
								if (allUsers != null && !allUsers.isEmpty()) {
									for (Users u : allUsers) {
							%>
							<tr>
								<td><%=u.getName()%></td>
								<td><%=u.getContact()%></td>
								<td><%=u.getEmail()%></td>
								<td><%=u.getCity()%></td>
								<td>
									<div class="action-buttons">
										<form action="deleteUser" method="post"
											style="display: inline;">
											<input type="hidden" name="contact"
												value="<%=u.getContact()%>" />
											<button class="btn btn-suspend" type="submit">
												<i class="fas fa-user-slash"></i> Delete
											</button>
										</form>
										<button class="btn btn-view">
											<i class="fas fa-eye"></i> View
										</button>
									</div>
								</td>
							</tr>
							<%
								}
								} else {
							%>
							<tr>
								<td colspan="5">No users found.</td>
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

	<!-- View Station Modal -->
	<div class="modal" id="viewStationModal">
		<div class="modal-content">
			<div class="modal-header">
				<h4>Station Details</h4>
				<button class="modal-close">&times;</button>
			</div>
			<div class="modal-body">
				<div class="station-details">
					<div class="detail-row">
						<span class="detail-label">Station Name:</span> <span
							class="detail-value">Sample Station</span>
					</div>
					<div class="detail-row">
						<span class="detail-label">Owner Name:</span> <span
							class="detail-value">John Doe</span>
					</div>
					<div class="detail-row">
						<span class="detail-label">Contact:</span> <span
							class="detail-value">+911234567890</span>
					</div>
					<div class="detail-row">
						<span class="detail-label">Email:</span> <span
							class="detail-value">owner@samplestation.com</span>
					</div>
					<div class="detail-row">
						<span class="detail-label">Address:</span> <span
							class="detail-value">123 Main Street, Andheri East, Mumbai</span>
					</div>
					<div class="detail-row">
						<span class="detail-label">Operating Hours:</span> <span
							class="detail-value">06:00 AM - 10:00 PM</span>
					</div>
					<div class="detail-row">
						<span class="detail-label">Fuel Availability:</span>
						<div class="fuel-availability">
							<div class="fuel-type">
								<span>Petrol:</span> <span>5000</span> liters at ₹<span>96.72</span>
							</div>
							<div class="fuel-type">
								<span>Diesel:</span> <span>7500</span> liters at ₹<span>89.62</span>
							</div>
						</div>
					</div>
					<div class="detail-row documents">
						<span class="detail-label">Documents:</span>
						<div class="document-links">
							<a href="#" target="_blank">View License</a> <a href="#"
								target="_blank">View ID Proof</a>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary modal-close">Close</button>
			</div>
		</div>
	</div>

	<!-- View User Modal -->
	<div class="modal" id="viewUserModal">
		<div class="modal-content">
			<div class="modal-header">
				<h4>User Details</h4>
				<button class="modal-close">&times;</button>
			</div>
			<div class="modal-body">
				<div class="user-details">
					<div class="detail-row">
						<span class="detail-label">Name:</span> <span class="detail-value">Sample
							User</span>
					</div>
					<div class="detail-row">
						<span class="detail-label">Contact:</span> <span
							class="detail-value">+919988776655</span>
					</div>
					<div class="detail-row">
						<span class="detail-label">Email:</span> <span
							class="detail-value">user@example.com</span>
					</div>
					<div class="detail-row">
						<span class="detail-label">Address:</span> <span
							class="detail-value">456 Oak Avenue, Chennai</span>
					</div>
					<div class="detail-row">
						<span class="detail-label">City:</span> <span class="detail-value">Chennai</span>
					</div>
					<div class="detail-row">
						<span class="detail-label">Pincode:</span> <span
							class="detail-value">600001</span>
					</div>
					<div class="detail-row">
						<span class="detail-label">Registered On:</span> <span
							class="detail-value">2023-06-01</span>
					</div>
					<div class="detail-row">
						<span class="detail-label">Status:</span> <span
							class="detail-value">Active</span>
					</div>
					<div class="detail-row">
						<span class="detail-label">Last Login:</span> <span
							class="detail-value">2023-06-15 14:30</span>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary modal-close">Close</button>
			</div>
		</div>
	</div>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

	<script>
		// Initialize DataTables
		$(document).ready(function() {
			$('#pendingStationsTable').DataTable();
			$('#approvedStationsTable').DataTable();
			$('#rejectedStationsTable').DataTable();
			$('#usersTable').DataTable();

			// Modal functionality
			const
			modal = $('.modal');

			$('.btn-view').on('click', function() {
				const
				type = $(this).closest('table').attr('id');

				if (type.includes('Stations')) {
					$('#viewStationModal').show();
				} else {
					$('#viewUserModal').show();
				}
			});

			$('.modal-close, .btn-secondary').on('click', function() {
				$(this).closest('.modal').hide();
			});

			// Close modal when clicking outside
			$(window).on('click', function(e) {
				if ($(e.target).hasClass('modal')) {
					$(e.target).hide();
				}
			});

			// Smooth scrolling for sidebar links
			$('.sidebar-nav a').on('click', function(e) {
				e.preventDefault();
				const
				target = $(this).attr('href');
				$('html, body').animate({
					scrollTop : $(target).offset().top - 20
				}, 500);

				// Update active state
				$('.sidebar-nav li').removeClass('active');
				$(this).parent().addClass('active');
			});
		});
	</script>
</body>
</html>