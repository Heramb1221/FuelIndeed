package com.heramb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import com.heramb.enums.StationStatus;

import org.springframework.stereotype.Component;

@Entity
@Component
public class FuelStation {
	
	@Override
	public String toString() {
		return "FuelStation [stationId=" + stationId + ", contact=" + contact + ", name=" + name + ", openTime="
				+ openTime + ", closeTime=" + closeTime + ", address=" + address + ", area=" + area + ", city=" + city
				+ ", pincode=" + pincode + ", petrolQty=" + petrolQty + ", petrolRate=" + petrolRate + ", dieselQty="
				+ dieselQty + ", dieselRate=" + dieselRate + ", email=" + email + ", password=" + password + ", status="
				+ status + ", imagePath=" + imagePath + ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String stationId;

	@Id
	@Column(unique = true, nullable = false)
	private String contact;

	public String getStationId() {
		return stationId;
	}

	public void setStationId(String stationId) {
		this.stationId = stationId;
	}

	private String name;
	private String openTime;
	private String closeTime;
	private String address;
	private String area;
	private String city;
	private String pincode;

	private double petrolQty;
	private double petrolRate;
	private double dieselQty;
	private double dieselRate;

	@Column(unique = true, nullable = false)
	private String email;
	@Column(unique = true, nullable = false)
	private String password;

	@Enumerated(EnumType.STRING)
	private StationStatus status = StationStatus.PENDING;

	private String imagePath;

	private double latitude;
	private double longitude;

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

	public String getOpenTime() {
		return openTime;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}

	public String getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public double getPetrolQty() {
		return petrolQty;
	}

	public void setPetrolQty(double petrolQty) {
		this.petrolQty = petrolQty;
	}

	public double getPetrolRate() {
		return petrolRate;
	}

	public void setPetrolRate(double petrolRate) {
		this.petrolRate = petrolRate;
	}

	public double getDieselQty() {
		return dieselQty;
	}

	public void setDieselQty(double dieselQty) {
		this.dieselQty = dieselQty;
	}

	public double getDieselRate() {
		return dieselRate;
	}

	public void setDieselRate(double dieselRate) {
		this.dieselRate = dieselRate;
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

	public StationStatus getStatus() {
		return status;
	}

	public void setStatus(StationStatus status) {
		this.status = status;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public FuelStation(String contact, String name, String openTime, String closeTime, String address, String area,
			String city, String pincode, double petrolQty, double petrolRate, double dieselQty, double dieselRate,
			String email, String password, StationStatus status, String imagePath, double latitude, double longitude) {
		super();
		this.contact = contact;
		this.name = name;
		this.openTime = openTime;
		this.closeTime = closeTime;
		this.address = address;
		this.area = area;
		this.city = city;
		this.pincode = pincode;
		this.petrolQty = petrolQty;
		this.petrolRate = petrolRate;
		this.dieselQty = dieselQty;
		this.dieselRate = dieselRate;
		this.email = email;
		this.password = password;
		this.status = status;
		this.imagePath = imagePath;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public FuelStation() {
		super();
		// TODO Auto-generated constructor stub
	}

}