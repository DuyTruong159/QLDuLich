/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.repository.impl;

import com.mycompany.pojo.User;
import com.mycompany.repository.UserRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


/**
 *
 * @author duytruong
 */
@Repository
@Transactional
public class UserRepositoryImpl implements UserRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean addUser(User user) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.save(user);
            return true;
        } catch (HibernateException ex) {
            System.err.print(ex.getMessage());
        }
        
        return false;
    }

    @Override
    public List<User> getUsers(String username) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<User> q = b.createQuery(User.class);
        Root r = q.from(User.class);
        q = q.select(r);
        
        if (!username.isEmpty()) {
            Predicate p = b.equal(r.get("username").as(String.class), username.trim());
            q = q.where(p);
        }
        
        Query query = s.createQuery(q);
        
        return query.getResultList();
    
    }

    @Override
    public List<User> getUsersStaff(String kw, int page) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<User> q = b.createQuery(User.class);
        Root r = q.from(User.class);
        q = q.select(r);
         
        if(!kw.isEmpty() && kw != null) {      
            Predicate p1 = b.like(r.get("userRole").as(String.class), "%ROLE_STAFF%");
            Predicate p2 = b.like(r.get("name").as(String.class), String.format("%%%s%%", kw));
            Predicate p = b.and(p1,p2);
            q = q.where(p);
        } else {
            Predicate p1 = b.like(r.get("userRole").as(String.class), "%ROLE_STAFF%");
            q = q.where(p1);
        }
        
        Query query = s.createQuery(q);
        
        int max = 6;
        query.setMaxResults(max);
        query.setFirstResult((page-1) * max);
        
        return query.getResultList();
    }

    @Override
    public long countStaff() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) FROM User WHERE userRole = 'ROLE_STAFF'");
        
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public boolean addStaff(User user) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.save(user);
            return true;
        } catch (HibernateException ex) {
            System.err.print(ex.getMessage());
        }
        
        return false;
    }

    @Override
    public List<User> getUserById(int id) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<User> query = b.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);
        
        Predicate p = b.equal(root.get("id"), id);
        query = query.where(p);
        
        Query q = s.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public boolean updateStaff(User user) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.update(user);
            return true;
        } catch (Exception ex) {
             System.out.print(ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean deleteUser(int id) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            User u = this.getUserById(id).get(0);
            s.delete(u);
            return true;
        } catch(Exception ex) {
            System.err.print(ex);
        }
        return false;
    }

    @Override
    public List<User> getUsersCustomer(String kw, int page) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<User> q = b.createQuery(User.class);
        Root r = q.from(User.class);
        q = q.select(r);
         
        if(!kw.isEmpty() && kw != null) {      
            Predicate p1 = b.like(r.get("userRole").as(String.class), "%ROLE_USER%");
            Predicate p2 = b.like(r.get("name").as(String.class), String.format("%%%s%%", kw));
            Predicate p = b.and(p1,p2);
            q = q.where(p);
        } else {
            Predicate p1 = b.like(r.get("userRole").as(String.class), "%ROLE_USER%");
            q = q.where(p1);
        }
        
        Query query = s.createQuery(q);
        
        int max = 6;
        query.setMaxResults(max);
        query.setFirstResult((page-1) * max);
        
        return query.getResultList();
    }

    @Override
    public long countCustomer() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) FROM User WHERE userRole = 'ROLE_USER'");
        
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public boolean updateCustomer(User user) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.update(user);
            return true;
        } catch (Exception ex) {
             System.out.print(ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean changePass(String username, String newPass, String pass) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        User u = this.getUsers(username).get(0);
        u.setPass(pass);
        u.setPassword(newPass);
        
        try {
            s.update(u);
            return true;
        } catch (Exception ex) {
            System.err.print(ex);
        }
        
        return false;
    }
}
