package com.heramb.model;

import javax.persistence.*;
import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "users")
public class Users {

    @Id
    @Column(name = "contact", nullable = false, unique = true)
    private String contact;

    private String name;

    private String city;

    private String address;

    private String pincode;

    private String email;

    private String password;

    private Double latitude;
    private Double longitude;

    public Users() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Users(String contact, String name, String city, String address, String pincode,
                String email, String password, Double latitude, Double longitude) {
        this.contact = contact;
        this.name = name;
        this.city = city;
        this.address = address;
        this.pincode = pincode;
        this.email = email;
        this.password = password;
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }
}
