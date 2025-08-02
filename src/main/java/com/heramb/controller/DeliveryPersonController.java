package com.heramb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.heramb.enums.BookingStatus;
import com.heramb.model.Booking;
import com.heramb.model.DeliveryPerson;
import com.heramb.model.FuelStation;

@Controller
public class DeliveryPersonController {

	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	DeliveryPersonDao deliveryPersonDao = context.getBean("deliveryPersonDao", DeliveryPersonDao.class);
	BookingDao bookingDao = context.getBean("bookingDao", BookingDao.class);
	FuelStationDao stationDao = context.getBean("fuelStationDao", FuelStationDao.class);
	FuelStation station = context.getBean("fuelStation", FuelStation.class);

	@PostMapping("/addDeliveryPerson")
	public String addDeliveryPerson(HttpServletRequest request, RedirectAttributes redirectAttributes) {
	    FuelStation station = (FuelStation) request.getSession().getAttribute("loggedInStation");
	    
	    if (station == null) {
	        return "redirect:/stationLogin";
	    }
	    
	    try {
	        String name = request.getParameter("dpName");
	        String contact = request.getParameter("dpContact");
	        String email = request.getParameter("dpEmail");
	        String address = request.getParameter("dpAddress");
	        String password = request.getParameter("dpPass");
	        String stationId = request.getParameter("stationId");
	        String dpCity = request.getParameter("dpCity");
	        String dpPincode = request.getParameter("dpPincode");
	        
	        DeliveryPerson dp = new DeliveryPerson();
	        dp.setName(name);
	        dp.setContact(contact);
	        dp.setEmail(email);
	        dp.setAddress(address);
	        dp.setPassword(password);
	        dp.setStationId(stationId);
	        dp.setCity(dpCity);
	        dp.setPincode(dpPincode);

	        deliveryPersonDao.addDeliveryPerson(dp);
	        return "redirect:/stationDashboard";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "waitingForApproval";
	    }
	}

    
    @PostMapping("/deleteDeliveryPerson")
    public String deleteDeliveryPerson(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        String contact = request.getParameter("contact");

        try {
            deliveryPersonDao.deleteDeliveryPerson(contact);
            redirectAttributes.addFlashAttribute("success", "Delivery person deleted.");
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Could not delete delivery person.");
        }

        return "redirect:/stationDashboard";
    }
    
    @RequestMapping("/deliveryLogin")
	public String showDeliveryLogin() {
		return "deliveryLogin";
	}
    
    @RequestMapping("/deliveryDashboard")
   	public String showDeliveryDashboard() {
   		return "deliveryDashboard";
   	}
    
    @RequestMapping(value = "/DeliveryLogin", method = RequestMethod.POST)
    public String deliveryLogin(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
        String contactNumber = request.getParameter("contactNumber");
        String password = request.getParameter("password");

        DeliveryPerson partner = deliveryPersonDao.getDeliveryPerson(contactNumber);

        if (partner != null && partner.getPassword().equals(password)) {
            // Store delivery partner in session
            request.getSession().setAttribute("loggedInPartner", partner);

            // Fetch all bookings assigned to this delivery partner
            List<Booking> assignedBookings = bookingDao.getAssignedBookingsByDeliveryPartner(contactNumber);
            List<Booking> deliveredBookings = bookingDao.getDeliveredBookingsByDeliveryPartner(contactNumber);

            model.addAttribute("assignedBookings", assignedBookings);
            model.addAttribute("deliveredBookings", deliveredBookings);

            return "deliveryDashboard"; // JSP or HTML for delivery partner home
        } else {
            redirectAttributes.addFlashAttribute("error", "Invalid contact number or password.");
            return "redirect:/deliveryLoginPage"; // login page JSP path
        }
    }
    
    @PostMapping("/markDelivered")
    public String markDelivered(@RequestParam("bookingId") int bookingId,
                                @RequestParam("deliveryCode") String deliveryCode,
                                Model model,
                                RedirectAttributes redirectAttributes) {

        Booking booking = bookingDao.getBookingById(bookingId);

        if (booking == null) {
            redirectAttributes.addFlashAttribute("error", "Invalid Booking ID.");
            return "redirect:/deliveryDashboard";
        }

        // Validate delivery code
        if (!deliveryCode.equals(booking.getDeliveryCode())) {
            redirectAttributes.addFlashAttribute("error", "Delivery code mismatch.");
            return "redirect:/deliveryDashboard";
        }

        // Update status
        booking.setStatus(BookingStatus.DELIVERED);
        bookingDao.updateBooking(booking);

        redirectAttributes.addFlashAttribute("success", "Delivery confirmed successfully.");
        return "redirect:/deliveryDashboard";
    }

    @PostMapping("/changeDeliveryPassword")
    public String changeDeliveryPassword(HttpServletRequest request, RedirectAttributes redirectAttributes) {

        DeliveryPerson dp = (DeliveryPerson) request.getSession().getAttribute("loggedInPartner");

        if (dp == null) {
            return "redirect:/deliveryLoginPage";
        }

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!dp.getPassword().equals(currentPassword)) {
            redirectAttributes.addFlashAttribute("error", "Current password is incorrect.");
            return "redirect:/deliveryDashboard";
        }

        if (!newPassword.equals(confirmPassword)) {
            redirectAttributes.addFlashAttribute("error", "New and confirm password do not match.");
            return "redirect:/deliveryDashboard";
        }

        try {
            dp.setPassword(newPassword);
            deliveryPersonDao.updateDeliveryPerson(dp); // This must use Hibernate `update()`
            redirectAttributes.addFlashAttribute("success", "Password changed successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Failed to update password.");
        }

        return "redirect:/deliveryDashboard";
    }



}
