package com.heramb.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.heramb.model.Booking;
import com.heramb.enums.BookingStatus;


@Component
public class BookingDao {

    @Autowired
    private HibernateTemplate ht;

    public HibernateTemplate getHt() {
        return ht;
    }

    public void setHt(HibernateTemplate ht) {
        this.ht = ht;
    }

    @Transactional
    public int addBooking(Booking booking) {
        return (Integer) this.ht.save(booking);
    }

    public Booking getBookingById(int id) {
        return this.ht.get(Booking.class, id);
    }

    public List<Booking> getAllBookings() {
        return this.ht.loadAll(Booking.class);
    }

    public List<Booking> getBookingsByUser(String userContact) {
        return (List<Booking>) this.ht.find("from Booking where userContact = ?", userContact);
    }

    public List<Booking> getBookingsByStation(String stationContact) {
        return (List<Booking>) this.ht.find("from Booking where stationContact = ?", stationContact);
    }

    public List<Booking> getBookingsByStatus(String status) {
        return (List<Booking>) this.ht.find("from Booking where status = ?", status);
    }

    public List<Booking> getAssignedBookingsForToday(String stationContact) {
        return (List<Booking>) this.ht.find(
            "from Booking where stationContact = ? and status = 'assigned'", stationContact);
    }

    @Transactional
    public void updateBooking(Booking booking) {
        this.ht.update(booking);
    }

    @Transactional
    public void deleteBooking(int id) {
        Booking booking = this.ht.get(Booking.class, id);
        if (booking != null) {
            this.ht.delete(booking);
        }
    }
    
    @SuppressWarnings("unchecked")
    public List<Booking> getPendingBookingsByUser(String userContact) {
        String hql = "from Booking where userContact = :userContact and status = :status";
        return (List<Booking>) ht.findByNamedParam(
            hql, 
            new String[] { "userContact", "status" }, 
            new Object[] { userContact, BookingStatus.PENDING }
        );
    }
    
    @SuppressWarnings("unchecked")
    public List<Booking> getAssignedBookingsByUser(String userContact) {
        String hql = "from Booking where userContact = :userContact and status = :status";
        return (List<Booking>) ht.findByNamedParam(
            hql,
            new String[] { "userContact", "status" },
            new Object[] { userContact, BookingStatus.ASSIGNED }
        );
    }

    @SuppressWarnings("unchecked")
    public List<Booking> getDeliveredBookingsByUser(String userContact) {
        String hql = "from Booking where userContact = :userContact and status = :status";
        return (List<Booking>) ht.findByNamedParam(
            hql,
            new String[] { "userContact", "status" },
            new Object[] { userContact, BookingStatus.DELIVERED }
        );
    }

    @SuppressWarnings("unchecked")
    public List<Booking> getRejectedBookingsByUser(String userContact) {
        String hql = "from Booking where userContact = :userContact and status = :status";
        return (List<Booking>) ht.findByNamedParam(
            hql,
            new String[] { "userContact", "status" },
            new Object[] { userContact, BookingStatus.REJECTED }
        );
    }
    
    @SuppressWarnings("unchecked")
    public List<Booking> getPendingBookingsByStation(String Contact) {
        String hql = "from Booking where stationContact = :Contact and status = :status";
        return (List<Booking>) ht.findByNamedParam(
            hql, 
            new String[] { "Contact", "status" }, 
            new Object[] { Contact, BookingStatus.PENDING }
        );
    }
    
    @Transactional
    public void assignBooking(int bookingId, String deliveryPartnerContact) {
        Booking booking = ht.get(Booking.class, bookingId);
        if (booking != null && booking.getStatus() == BookingStatus.PENDING) {
            booking.setDeliveryPersonContact(deliveryPartnerContact);
            booking.setStatus(BookingStatus.ASSIGNED);
            ht.update(booking);
        }
    }

    @Transactional
    public void rejectBooking(int bookingId) {
        Booking booking = ht.get(Booking.class, bookingId);
        if (booking != null && booking.getStatus() == BookingStatus.PENDING) {
            booking.setStatus(BookingStatus.REJECTED); // use your enum
            ht.update(booking);
        }
    }

	public List<Booking> getRejectedBookingsByStation(String contact) {
		String hql = "from Booking where stationContact = :Contact and status = :status";
        return (List<Booking>) ht.findByNamedParam(
            hql, 
            new String[] { "Contact", "status" }, 
            new Object[] { contact, BookingStatus.REJECTED }
        );
	}

	public List<Booking> getApprovedBookingsByStation(String contact) {
		String hql = "from Booking where stationContact = :Contact and status = :status";
        return (List<Booking>) ht.findByNamedParam(
            hql, 
            new String[] { "Contact", "status" }, 
            new Object[] { contact, BookingStatus.ASSIGNED }
        );
	}

	public List<Booking> getDeliveredBookingsByStation(String contact) {
		String hql = "from Booking where stationContact = :Contact and status = :status";
        return (List<Booking>) ht.findByNamedParam(
            hql, 
            new String[] { "Contact", "status" }, 
            new Object[] { contact, BookingStatus.DELIVERED }
        );
	}

	@SuppressWarnings("unchecked")
	public List<Booking> getAssignedBookingsByDeliveryPartner(String contactNumber) {
	    String hql = "from Booking where deliveryPersonContact = :contactNumber and status = :status";
	    return (List<Booking>) ht.findByNamedParam(
	        hql,
	        new String[] { "contactNumber", "status" },
	        new Object[] { contactNumber, BookingStatus.ASSIGNED }
	    );
	}

	@SuppressWarnings("unchecked")
	public List<Booking> getDeliveredBookingsByDeliveryPartner(String contactNumber) {
	    String hql = "from Booking where deliveryPersonContact = :contactNumber and status = :status";
	    return (List<Booking>) ht.findByNamedParam(
	        hql,
	        new String[] { "contactNumber", "status" },
	        new Object[] { contactNumber, BookingStatus.DELIVERED }
	    );
	}

}
