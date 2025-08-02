package com.heramb.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.heramb.model.Users;

@Component
public class UserDao {

    @Autowired
    private HibernateTemplate ht;

    public HibernateTemplate getHt() {
        return ht;
    }

    public void setHt(HibernateTemplate ht) {
        this.ht = ht;
    }

    @Transactional
    public String addUser(Users user) {
        return (String) this.ht.save(user);
    }

    public Users getUser(String contact) {
        return this.ht.get(Users.class, contact);
    }

    public List<Users> getAllUsers() {
        return this.ht.loadAll(Users.class);
    }

    @Transactional
    public void deleteUser(String contact) {
        Users user = this.ht.get(Users.class, contact);
        if (user != null) {
            this.ht.delete(user);
        }
    }

    @Transactional
    public void updateUser(Users user) {
        this.ht.update(user);
    }
    
    @Transactional
    public void changePassword(String contact, String currentPassword, String newPassword) {
        Users user = ht.get(Users.class, contact);
            user.setPassword(newPassword);
            ht.update(user);}
    }
