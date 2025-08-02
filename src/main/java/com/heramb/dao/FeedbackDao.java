package com.heramb.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.heramb.model.Feedback;

@Component
public class FeedbackDao {

    @Autowired
    private HibernateTemplate ht;

    public HibernateTemplate getHt() {
        return ht;
    }

    public void setHt(HibernateTemplate ht) {
        this.ht = ht;
    }

    @Transactional
    public int addFeedback(Feedback feedback) {
        return (Integer) this.ht.save(feedback);
    }

    public Feedback getFeedbackById(int id) {
        return this.ht.get(Feedback.class, id);
    }

    public List<Feedback> getAllFeedback() {
        return this.ht.loadAll(Feedback.class);
    }

    public List<Feedback> getFeedbackByUser(String userContact) {
        return (List<Feedback>) this.ht.find(
            "from Feedback where userContact = ?", userContact);
    }

    public List<Feedback> getFeedbackByStation(String stationContact) {
        return (List<Feedback>) this.ht.find(
            "from Feedback where stationContact = ?", stationContact);
    }

    @Transactional
    public void deleteFeedback(int id) {
        Feedback fb = this.ht.get(Feedback.class, id);
        if (fb != null) {
            this.ht.delete(fb);
        }
    }
}
