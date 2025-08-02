package com.heramb.dao;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.heramb.model.DailyDeliveryLog;

@Component
public class DailyDeliveryLogDao {

    @Autowired
    private HibernateTemplate ht;

    public HibernateTemplate getHt() {
        return ht;
    }

    public void setHt(HibernateTemplate ht) {
        this.ht = ht;
    }

    @Transactional
    public int addLog(DailyDeliveryLog log) {
        return (Integer) this.ht.save(log);
    }

    public DailyDeliveryLog getLogById(int id) {
        return this.ht.get(DailyDeliveryLog.class, id);
    }

    public List<DailyDeliveryLog> getAllLogs() {
        return this.ht.loadAll(DailyDeliveryLog.class);
    }

    public List<DailyDeliveryLog> getLogsByStation(String stationContact) {
        return (List<DailyDeliveryLog>) this.ht.find(
            "from DailyDeliveryLog where stationContact = ?", stationContact);
    }

    public List<DailyDeliveryLog> getLogsByDeliveryPerson(String deliveryPersonContact) {
        return (List<DailyDeliveryLog>) this.ht.find(
            "from DailyDeliveryLog where deliveryPersonContact = ?", deliveryPersonContact);
    }

    public List<DailyDeliveryLog> getLogsByDate(Date date) {
        return (List<DailyDeliveryLog>) this.ht.find(
            "from DailyDeliveryLog where logDate = ?", date);
    }

    @Transactional
    public void updateLog(DailyDeliveryLog log) {
        this.ht.update(log);
    }

    @Transactional
    public void deleteLog(int id) {
        DailyDeliveryLog log = this.ht.get(DailyDeliveryLog.class, id);
        if (log != null) {
            this.ht.delete(log);
        }
    }
}
