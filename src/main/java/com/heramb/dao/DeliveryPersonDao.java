package com.heramb.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.heramb.model.DeliveryPerson;

@Component
public class DeliveryPersonDao {

    @Autowired
    private HibernateTemplate ht;

    public HibernateTemplate getHt() {
        return ht;
    }

    public void setHt(HibernateTemplate ht) {
        this.ht = ht;
    }

    @Transactional
    public String addDeliveryPerson(DeliveryPerson dp) {
        return (String) this.ht.save(dp);
    }

    public DeliveryPerson getDeliveryPerson(String contact) {
        return this.ht.get(DeliveryPerson.class, contact);
    }

    public List<DeliveryPerson> getAllDeliveryPersons() {
        return this.ht.loadAll(DeliveryPerson.class);
    }

    public List<DeliveryPerson> getByStationId(String stationId) {
    	return (List<DeliveryPerson>) this.ht.findByNamedParam(
    		    "from DeliveryPerson where stationId = :stationId",
    		    "stationId",
    		    stationId
    		);

    }

    @Transactional
    public void updateDeliveryPerson(DeliveryPerson dp) {
        this.ht.update(dp);
    }

    @Transactional
    public void deleteDeliveryPerson(String contact) {
        DeliveryPerson dp = this.ht.get(DeliveryPerson.class, contact);
        if (dp != null) {
            this.ht.delete(dp);
        }
    }
}
