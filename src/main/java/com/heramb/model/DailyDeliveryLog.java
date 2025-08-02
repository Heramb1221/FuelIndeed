package com.heramb.model;

import javax.persistence.*;
import java.time.LocalDate;

import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "daily_delivery_logs", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"deliveryPersonContact", "logDate"})
})
public class DailyDeliveryLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String deliveryPersonContact;

    private String stationContact;

    private LocalDate logDate;

    private int totalDeliveries;

    private double totalQuantity;

    private double totalEarnings;
    
    public DailyDeliveryLog() {}

    public DailyDeliveryLog(String deliveryPersonContact, String stationContact,
                            LocalDate logDate, int totalDeliveries, double totalQuantity, double totalEarnings) {
        this.deliveryPersonContact = deliveryPersonContact;
        this.stationContact = stationContact;
        this.logDate = logDate;
        this.totalDeliveries = totalDeliveries;
        this.totalQuantity = totalQuantity;
        this.totalEarnings = totalEarnings;
    }
    
    public int getId() {
        return id;
    }

    public String getDeliveryPersonContact() {
        return deliveryPersonContact;
    }

    public void setDeliveryPersonContact(String deliveryPersonContact) {
        this.deliveryPersonContact = deliveryPersonContact;
    }

    public String getStationContact() {
        return stationContact;
    }

    public void setStationContact(String stationContact) {
        this.stationContact = stationContact;
    }

    public LocalDate getLogDate() {
        return logDate;
    }

    public void setLogDate(LocalDate logDate) {
        this.logDate = logDate;
    }

    public int getTotalDeliveries() {
        return totalDeliveries;
    }

    public void setTotalDeliveries(int totalDeliveries) {
        this.totalDeliveries = totalDeliveries;
    }

    public double getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(double totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public double getTotalEarnings() {
        return totalEarnings;
    }

    public void setTotalEarnings(double totalEarnings) {
        this.totalEarnings = totalEarnings;
    }
}
