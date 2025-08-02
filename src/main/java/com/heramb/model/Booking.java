package com.heramb.model;

import javax.persistence.*;
import java.time.LocalDateTime;

import com.heramb.enums.BookingStatus;
import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "bookings")
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String userContact;

    private String stationContact;

    private String deliveryPersonContact;

    private String fuelType;

    private double quantity;

    private double totalBill;

    private String deliveryCode;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private BookingStatus status = BookingStatus.PENDING;

    private LocalDateTime bookingDateTime;

    public Booking() {
        this.bookingDateTime = LocalDateTime.now();
    }

    public Booking(String userContact, String stationContact, String deliveryPersonContact,
                   String fuelType, double quantity, double totalBill, String deliveryCode,
                   BookingStatus status) {
        this.userContact = userContact;
        this.stationContact = stationContact;
        this.deliveryPersonContact = deliveryPersonContact;
        this.fuelType = fuelType;
        this.quantity = quantity;
        this.totalBill = totalBill;
        this.deliveryCode = deliveryCode;
        this.status = status;
        this.bookingDateTime = LocalDateTime.now();
    }
    
    public int getId() {
        return id;
    }

    public String getUserContact() {
        return userContact;
    }

    public void setUserContact(String userContact) {
        this.userContact = userContact;
    }

    public String getStationContact() {
        return stationContact;
    }

    public void setStationContact(String stationContact) {
        this.stationContact = stationContact;
    }

    public String getDeliveryPersonContact() {
        return deliveryPersonContact;
    }

    public void setDeliveryPersonContact(String deliveryPersonContact) {
        this.deliveryPersonContact = deliveryPersonContact;
    }

    public String getFuelType() {
        return fuelType;
    }

    public void setFuelType(String fuelType) {
        this.fuelType = fuelType;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public double getTotalBill() {
        return totalBill;
    }

    public void setTotalBill(double totalBill) {
        this.totalBill = totalBill;
    }

    public String getDeliveryCode() {
        return deliveryCode;
    }

    public void setDeliveryCode(String deliveryCode) {
        this.deliveryCode = deliveryCode;
    }

    public BookingStatus getStatus() {
        return status;
    }

    public void setStatus(BookingStatus status) {
        this.status = status;
    }

    public LocalDateTime getBookingDateTime() {
        return bookingDateTime;
    }

    public void setBookingDateTime(LocalDateTime bookingDateTime) {
        this.bookingDateTime = bookingDateTime;
    }
}
