package com.heramb.model;

import javax.persistence.*;
import java.time.LocalDateTime;

import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "feedbacks")
public class Feedback {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String userContact;

    private String stationContact;

    private String deliveryPersonContact;

    private int rating;

    private String comment;

    private LocalDateTime submittedAt;

    public Feedback() {
        this.submittedAt = LocalDateTime.now();
    }

    public Feedback(String userContact, String stationContact, String deliveryPersonContact, int rating, String comment) {
        this.userContact = userContact;
        this.stationContact = stationContact;
        this.deliveryPersonContact = deliveryPersonContact;
        this.rating = rating;
        this.comment = comment;
        this.submittedAt = LocalDateTime.now();
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

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        if (rating >= 1 && rating <= 5) {
            this.rating = rating;
        } else {
            throw new IllegalArgumentException("Rating must be between 1 and 5.");
        }
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public LocalDateTime getSubmittedAt() {
        return submittedAt;
    }

    public void setSubmittedAt(LocalDateTime submittedAt) {
        this.submittedAt = submittedAt;
    }
}
