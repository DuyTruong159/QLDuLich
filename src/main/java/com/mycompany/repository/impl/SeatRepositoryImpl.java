/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.repository.impl;

import com.mycompany.pojo.Seat;
import com.mycompany.repository.SeatRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
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
public class SeatRepositoryImpl implements SeatRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Seat> getSeat() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Seat> query = b.createQuery(Seat.class);
        Root root = query.from(Seat.class);
        query = query.select(root);
        
        Query q = s.createQuery(query);
        return q.getResultList();
    }

    @Override
    public void deleteSeat(int id) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Seat seat = getSeatbyId(id).get(0);
        s.delete(seat);
    }

    @Override
    public Boolean addSeat(Seat seat) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.save(seat);
            return true;
        } catch (Exception ex) {
             System.out.print(ex.getMessage());
        }
        return false;
    }
    
    @Override
    public List<Seat> getSeatbyId(int id) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Seat> query = b.createQuery(Seat.class);
        Root root = query.from(Seat.class);
        query = query.select(root);
        
        Predicate p = b.equal(root.get("id"), id);
        query = query.where(p);
        
        Query q = s.createQuery(query);
        return q.getResultList();
    }

    @Override
    public Boolean updateSeat(Seat seat) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.update(seat);
            return true;
        } catch (Exception ex) {
             System.out.print(ex.getMessage());
        }
        return false;
    }

    @Override
    public List<Seat> getSeatSearch(String kw, int page) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Seat> query = b.createQuery(Seat.class);
        Root root = query.from(Seat.class);
        query = query.select(root);
        
        if(!kw.isEmpty() && kw != null) {                  
            Predicate p1 = b.like(root.get("price").as(String.class), String.format("%%%s%%", kw));
            Predicate p2 = b.like(root.get("name").as(String.class), String.format("%%%s%%", kw));
            Predicate p = b.or(p1, p2);
            query = query.where(p);
        }
        
        Query q = s.createQuery(query);
        
        int max = 8;
        q.setMaxResults(max);
        q.setFirstResult((page-1) * max);
        
        return q.getResultList();
    }

    @Override
    public long countSeat() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) FROM Seat");
        
        return Long.parseLong(q.getSingleResult().toString());
    }
    
}
