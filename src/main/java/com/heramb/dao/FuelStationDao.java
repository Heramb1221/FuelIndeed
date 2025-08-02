package com.heramb.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.heramb.enums.StationStatus;
import com.heramb.model.FuelStation;

@Component
public class FuelStationDao {

    @Autowired
    private HibernateTemplate ht;

    public HibernateTemplate getHt() {
        return ht;
    }

    public void setHt(HibernateTemplate ht) {
        this.ht = ht;
    }
    
    public List<FuelStation> getApprovedStations() {
        return getStationsByStatus(StationStatus.APPROVED);
    }

    @Transactional
    public String addFuelStation(FuelStation station) {
        return (String) this.ht.save(station); // ✅ contact is primary key
    }
    
    public FuelStation getFuelStationByContact(String contact) {
        return this.ht.get(FuelStation.class, contact);
    }

    public List<FuelStation> getAllStations() {
        return this.ht.loadAll(FuelStation.class);
    }

    public List<FuelStation> getStationsByStatus(StationStatus status) {
        return (List<FuelStation>) ht.findByNamedParam(
            "from FuelStation where status = :status", "status", status
        );
    }

    @Transactional
    public void updateFuelStation(FuelStation station) {
        this.ht.update(station);
    }

    @Transactional
    public void deleteFuelStation(String contact) {
        FuelStation station = this.ht.get(FuelStation.class, contact);
        if (station != null) {
            this.ht.delete(station);
        }
    }
    
    public List<FuelStation> getStationsByAddress(String addressFragment) {
        String hql = "FROM FuelStation WHERE address LIKE :address";
        return (List<FuelStation>) ht.findByNamedParam(hql, "address", "%" + addressFragment + "%");
    }
}
