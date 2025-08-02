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
import org.springframework.web.bind.annotation.GetMapping;
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
public class BookingController {
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");

    UserDao userDao = context.getBean("userDao", UserDao.class);
    Users user = context.getBean("users", Users.class);
    DeliveryPersonDao deliveryPersonDao = context.getBean("deliveryPersonDao", DeliveryPersonDao.class);
    FuelStationDao stationDao = context.getBean("fuelStationDao", FuelStationDao.class);
    BookingDao bookingDao = context.getBean("bookingDao", BookingDao.class);
    
    @RequestMapping(value = "/assignBooking", method = RequestMethod.POST)
    public String assignBooking(
            @RequestParam("bookingId") int bookingId,
            @RequestParam("deliveryPartnerContact") String deliveryPartnerContact
    ) {
        bookingDao.assignBooking(bookingId, deliveryPartnerContact);
        return "redirect:/stationDashboard";
    }


    @RequestMapping(value = "/rejectBooking", method = RequestMethod.POST)
    public String rejectBooking(@RequestParam("bookingId") int bookingId, HttpServletRequest request) {
        bookingDao.rejectBooking(bookingId);  // calls DAO method
        return "redirect:/stationDashboard";
    }   
}