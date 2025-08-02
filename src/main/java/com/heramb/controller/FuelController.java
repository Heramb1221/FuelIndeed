package com.heramb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.heramb.dao.BookingDao;
import com.heramb.dao.DeliveryPersonDao;
import com.heramb.dao.FuelStationDao;
import com.heramb.dao.UserDao;
import com.heramb.enums.StationStatus;
import com.heramb.model.Booking;
import com.heramb.model.DeliveryPerson;
import com.heramb.model.FuelStation;
import com.heramb.model.Users;

@Controller
public class FuelController {

	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	FuelStationDao stationDao = context.getBean("fuelStationDao", FuelStationDao.class);
	FuelStation station = context.getBean("fuelStation", FuelStation.class);
	Users user = context.getBean("users", Users.class);
	UserDao userDao = context.getBean("userDao", UserDao.class);
	BookingDao bookingDao = context.getBean("bookingDao", BookingDao.class);
	DeliveryPersonDao deliveryPersonDao = context.getBean("deliveryPersonDao", DeliveryPersonDao.class);

	@RequestMapping("/")
	public String init() {
		return "index";
	}

	@RequestMapping("/index")
	public String home() {
		return "index";
	}

	@RequestMapping("/adminLogin")
	public String showAdminLogin() {
		return "adminLogin";
	}

	@RequestMapping(path = "/AdminLogin", method = RequestMethod.POST)
	public String adminLogin(HttpServletRequest request) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		if (email.equals("admin@gmail.com") && password.equals("admin")) {
			request.getSession().setAttribute("adminLoggedIn", true);
			request.getSession().setAttribute("adminName", "Admin");

			return "redirect:/adminDashboard";
		} else {
			return "redirect:/adminLogin";
		}
	}

	@RequestMapping("/adminDashboard")
	public String dashboard(HttpServletRequest request, Model model) {

		List<FuelStation> pending = stationDao.getStationsByStatus(StationStatus.PENDING);
		List<FuelStation> approved = stationDao.getStationsByStatus(StationStatus.APPROVED);
		List<FuelStation> rejected = stationDao.getStationsByStatus(StationStatus.REJECTED);
		List<Users> users = userDao.getAllUsers();

		model.addAttribute("approvedStations", approved);
		model.addAttribute("pendingStations", pending);
		model.addAttribute("rejectedStations", rejected);
		model.addAttribute("pendingStationCount", pending.size());
		model.addAttribute("approvedStationCount", approved.size());
		model.addAttribute("rejectedStationCount", rejected.size());
		model.addAttribute("userCount", users.size());
		model.addAttribute("allUsers", userDao.getAllUsers());

		model.addAttribute("adminName", request.getSession().getAttribute("adminName"));

		return "adminDashboard";
	}

	@RequestMapping("/registerStation")
	public String showRegisterRegister() {
		return "registerStation";
	}

	@RequestMapping(path = "/registerNewStation", method = RequestMethod.POST)
	public String registerStation(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		try {
			ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
			FuelStationDao stationDao = context.getBean("fuelStationDao", FuelStationDao.class);

			FuelStation station = new FuelStation();

			// Extracting parameters from request
			station.setName(request.getParameter("stationName"));
			String contact = request.getParameter("countryCode") + request.getParameter("contactNumber");
			station.setContact(contact);
			station.setEmail(request.getParameter("email"));
			station.setPassword(request.getParameter("password"));
			station.setAddress(request.getParameter("address"));
			station.setArea(request.getParameter("area"));
			station.setCity(request.getParameter("city"));
			station.setPincode(request.getParameter("pincode"));
			station.setOpenTime(request.getParameter("openTime"));
			station.setCloseTime(request.getParameter("closeTime"));
			station.setImagePath(request.getParameter("ownerId"));
			station.setLatitude(Float.parseFloat(request.getParameter("latitude")));
			station.setLongitude(Float.parseFloat(request.getParameter("longitude")));

			// Fuel inventory - parsing safely
			String petrolQtyStr = request.getParameter("petrolQty");
			String petrolRateStr = request.getParameter("petrolRate");
			String dieselQtyStr = request.getParameter("dieselQty");
			String dieselRateStr = request.getParameter("dieselRate");

			if (petrolQtyStr != null && !petrolQtyStr.isEmpty()) {
				station.setPetrolQty(Integer.parseInt(petrolQtyStr));
			} else {
				station.setPetrolQty(0);
			}

			if (petrolRateStr != null && !petrolRateStr.isEmpty()) {
				station.setPetrolRate(Double.parseDouble(petrolRateStr));
			}

			if (dieselQtyStr != null && !dieselQtyStr.isEmpty()) {
				station.setDieselQty(Integer.parseInt(dieselQtyStr));
			} else {
				station.setDieselQty(0);
			}

			if (dieselRateStr != null && !dieselRateStr.isEmpty()) {
				station.setDieselRate(Double.parseDouble(dieselRateStr));
			}

			// Save station
			String id = stationDao.addFuelStation(station);
			if (id != null) {
				return "stationLogin";
			} else {
				redirectAttributes.addFlashAttribute("error", "Error creating station.");
				return "redirect:/registerStation";
			}
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("error", "An unexpected error occurred.");
			return "redirect:/registerStation";
		}
	}

	@RequestMapping("/stationLogin")
	public String showStationLogin() {
		return "stationLogin";
	}

	@RequestMapping(path = "/StationLogin", method = RequestMethod.POST)
	public String stationLogin(HttpServletRequest request) {
	    String countryCode = request.getParameter("countryCode");
	    String contactNumber = request.getParameter("contactNumber");
	    String password = request.getParameter("password");

	    String fullContact = countryCode + contactNumber;

	    FuelStation station = stationDao.getFuelStationByContact(fullContact);

	    if (station != null) { 
	        if (station.getStatus() == StationStatus.APPROVED) {
	            HttpSession session = request.getSession();
	            session.setAttribute("loggedInStation", station);
	            return "redirect:/stationDashboard";
	        } else {
	            return "waitingForApproval";
	        }
	    } else {
	        return "stationLogin";
	    }
	}


	@PostMapping("/approveStation")
	public String approveStation(@RequestParam("contact") String contact) {
		FuelStation station = stationDao.getFuelStationByContact(contact);
		if (station != null) {
			station.setStatus(StationStatus.APPROVED);
			stationDao.updateFuelStation(station);
		}
		return "redirect:/adminDashboard";
	}

	@PostMapping("/rejectStation")
	public String rejectStation(@RequestParam("contact") String contact) {
		FuelStation station = stationDao.getFuelStationByContact(contact);
		if (station != null) {
			station.setStatus(StationStatus.REJECTED);
			stationDao.updateFuelStation(station);
		}
		return "redirect:/adminDashboard";
	}

	@PostMapping("/suspendStation")
	public String suspendStation(@RequestParam("contact") String contact) {
		FuelStation station = stationDao.getFuelStationByContact(contact);
		if (station != null) {
			station.setStatus(StationStatus.REJECTED);
			stationDao.updateFuelStation(station);
		}
		return "redirect:/adminDashboard";
	}

	@RequestMapping("/stationDashboard")
	public String showStationDashboard(HttpServletRequest request, Model model) {
	    FuelStation station = (FuelStation) request.getSession().getAttribute("loggedInStation");
	    
	    if (station == null) {
	        // Station not logged in; redirect or show error
	        return "redirect:/stationLogin";
	    }
	    FuelStation loggedInStation = (FuelStation) request.getSession().getAttribute("loggedInStation");

	    if (loggedInStation == null) {
	        return "redirect:/stationLogin";
	    }

	    List<Booking> pendingBookings = bookingDao.getPendingBookingsByStation(loggedInStation.getContact());
	    List<Booking> rejectedBookings = bookingDao.getRejectedBookingsByStation(loggedInStation.getContact());
	    List<Booking> approvedBookings = bookingDao.getApprovedBookingsByStation(loggedInStation.getContact());
	    List<Booking> deliveredBookings = bookingDao.getDeliveredBookingsByStation(loggedInStation.getContact());
	    model.addAttribute("pendingBookings", pendingBookings);
	    model.addAttribute("rejectedBookings", rejectedBookings);
	    model.addAttribute("approvedBookings", approvedBookings);
	    model.addAttribute("deliveredBookings", deliveredBookings);

	    List<DeliveryPerson> deliveryPersons = deliveryPersonDao.getByStationId(station.getStationId());

	    // If your DAO expects station ID, change to station.getStationId()
	    // For example: deliveryPersonDao.getByStationId(station.getStationId());

	    request.setAttribute("station", station);
	    request.setAttribute("deliveryPersons", deliveryPersons);

	    return "stationDashboard";
	}



	
	@PostMapping("/updateFuelInfo")
	public String updateFuelInfo(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			System.out.println("⚠️ Session is null");
			return "redirect:/stationLogin";
		}
		FuelStation station = (FuelStation) request.getSession().getAttribute("loggedInStation");

		if (station == null) {
			return "redirect:/stationLogin";
		}

		try {
			double petrolQty = Double.parseDouble(request.getParameter("petrolQuantity"));
			double petrolRate = Double.parseDouble(request.getParameter("petrolRate"));
			double dieselQty = Double.parseDouble(request.getParameter("dieselQuantity"));
			double dieselRate = Double.parseDouble(request.getParameter("dieselRate"));

			station.setPetrolQty(petrolQty);
			station.setPetrolRate(petrolRate);
			station.setDieselQty(dieselQty);
			station.setDieselRate(dieselRate);

			stationDao.updateFuelStation(station);

			request.getSession().setAttribute("loggedInStation", station);

		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/stationDashboard";
		}

		return "redirect:/stationDashboard";
	}

}
