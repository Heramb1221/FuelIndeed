package com.heramb.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "delivery_person")
public class DeliveryPerson {

	@Id
    @Column(name = "contact", nullable = false, unique = true, length = 15)
    private String contact;

    @Column(name = "station_id", nullable = false)
    private String stationId;
    private String name;
    private String city;
    private String address;
    private String pincode;
    
    @Column(unique = true, nullable = false)
    private String email;
    private String password;
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getStationId() {
		return stationId;
	}
	public void setStationId(String string) {
		this.stationId = string;
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
	public DeliveryPerson(String contact, String stationId, String name, String city, String address, String pincode,
			String email, String password) {
		super();
		this.contact = contact;
		this.stationId = stationId;
		this.name = name;
		this.city = city;
		this.address = address;
		this.pincode = pincode;
		this.email = email;
		this.password = password;
	}
	public DeliveryPerson() {
		super();
		// TODO Auto-generated constructor stub
	}
}