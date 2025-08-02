package com.heramb.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.heramb.enums.BookingStatus;
import com.heramb.model.Booking;
import com.heramb.model.FuelStation;
import com.heramb.model.Users;

@Controller
public class UserController {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
    UserDao userDao = context.getBean("userDao", UserDao.class);
    Users user = context.getBean("users", Users.class);
    DeliveryPersonDao deliveryPersonDao = context.getBean("deliveryPersonDao", DeliveryPersonDao.class);
    BookingDao bookingDao = context.getBean("bookingDao", BookingDao.class);
	FuelStationDao stationDao = context.getBean("fuelStationDao", FuelStationDao.class);
	FuelStation station = context.getBean("fuelStation", FuelStation.class);
	Users u = new Users();
	String contactNumber = "";
    
    @RequestMapping("/registerUser")
    public String showUserRegister() {
        return "registerUser";
    }

    @RequestMapping(path = "/registerNewUser", method = RequestMethod.POST)
    public String registerUser(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        Users user = new Users();
        user.setName(request.getParameter("fullName"));
        user.setContact(request.getParameter("contactNumber"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        user.setAddress(request.getParameter("address"));
        user.setCity(request.getParameter("city"));
        user.setPincode(request.getParameter("pincode"));
        user.setLatitude(Double.parseDouble(request.getParameter("latitude")));
        user.setLongitude(Double.parseDouble(request.getParameter("longitude")));

        String result = userDao.addUser(user);
        if (result != null && !result.isEmpty()) {
           return "userLogin";
        } else {
            redirectAttributes.addFlashAttribute("error", "Error creating account.");
            return "redirect:/registerUser";
        }
    }
    
    @RequestMapping("/userLogin")
    public String showUserLogin() {
        return "userLogin";
        
    }
    
    @RequestMapping(path="/UserLogin", method=RequestMethod.POST)
    public String userLogin(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
        String contactNumber = request.getParameter("contactNumber");
        String password = request.getParameter("password");
        Users user = userDao.getUser(contactNumber);
        u = user;

        if (user != null && user.getPassword().equals(password)) {
            request.getSession().setAttribute("loggedInUser", user); // session store

            List<FuelStation> stations = stationDao.getApprovedStations();
            List<Booking> userPendingBookings = bookingDao.getPendingBookingsByUser(user.getContact());
            List<Booking> userApprovedBookings = bookingDao.getAssignedBookingsByUser(user.getContact());
            List<Booking> userDeliveredBookings = bookingDao.getDeliveredBookingsByUser(user.getContact());
            List<Booking> userRejectedBookings = bookingDao.getRejectedBookingsByUser(user.getContact());

            model.addAttribute("stations", stations);
            model.addAttribute("pendingBookings", userPendingBookings);
            model.addAttribute("approvedBookings", userApprovedBookings);
            model.addAttribute("deliveredBookings", userDeliveredBookings);
            model.addAttribute("rejectedBookings", userRejectedBookings);
            return "userDashboard";
        } else {
            redirectAttributes.addFlashAttribute("error", "Invalid credentials.");
            return "redirect:/userLogin";
        }
    }

    
    @RequestMapping("/userDashboard")
    public String showUserDashboard(HttpServletRequest request, Model model) {;
        return "userDashboard";
    }

    
    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
    public String deleteUser(@RequestParam("contact") String contact) {
        userDao.deleteUser(contact);
        return "redirect:/adminDashboard";
    }
    
    @RequestMapping(value = "/searchStations", method = RequestMethod.GET)
    public String searchStationsByAddress(@RequestParam("addressFragment") String addressFragment, HttpServletRequest request) {
        List<FuelStation> stations = stationDao.getStationsByAddress(addressFragment);

        request.setAttribute("stations", stations);
        request.setAttribute("searchQuery", addressFragment);  // Optional: to show in view
        return "findStations";  // JSP page to display results
    }
    
    @RequestMapping("/bookFuel")
    public String showBookingForm(HttpServletRequest request) {
    	String c = request.getParameter("sid").trim();
    	contactNumber = "+" + c;
    	Users user = userDao.getUser(u.getContact());
    	request.setAttribute("user", user);
        return "bookFuel";
    }
    
    @RequestMapping(value = "/fuelBookingForm", method = RequestMethod.POST)
    public String bookFuelDelivery(HttpServletRequest request, Model model) {
        String fuelType = request.getParameter("fuelType");
        double quantity = Double.parseDouble(request.getParameter("quantity"));
        String deliveryAddress = request.getParameter("deliveryAddress");
        String deliveryDate = request.getParameter("deliveryDate");
        String deliveryTime = request.getParameter("deliveryTime");
        String fullName = request.getParameter("fullName");
        String specialInstructions = request.getParameter("specialInstructions");
        FuelStation s = stationDao.getFuelStationByContact(contactNumber);

        String deliveryCode = String.format("%04d", (int)(Math.random() * 10000));
        double ratePerLitre = 0;
        if(fuelType.equals("PETROL")){
        	ratePerLitre = s.getPetrolRate();
        	
        }
        if(fuelType == "DIESEL"){
            ratePerLitre = s.getDieselRate();
        }
        double totalBill = quantity * ratePerLitre;

        Booking booking = new Booking();
        booking.setFuelType(fuelType);
        booking.setQuantity(quantity);
        booking.setUserContact(u.getContact());
        booking.setDeliveryCode(deliveryCode);
        booking.setTotalBill(totalBill);
        booking.setStatus(BookingStatus.PENDING);
        
        booking.setStationContact(contactNumber);

        bookingDao.addBooking(booking);
        model.addAttribute("booking", booking);

        return "redirect:/userDashboard";
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public String changeUserPassword(HttpServletRequest request, Model model) {
        Users loggedInUser = (Users) request.getSession().getAttribute("loggedInUser");

        String contact = loggedInUser.getContact();
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");

        userDao.changePassword(contact, currentPassword, newPassword);

        return "userDashboard";
    }

    
}
