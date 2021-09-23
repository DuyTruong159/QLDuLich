/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.repository.impl;


import com.mycompany.pojo.Tour;
import com.mycompany.repository.TourRepository;
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
public class TourRepositoryImpl implements TourRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Tour> getTours(int page) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Tour> query = b.createQuery(Tour.class);
        Root root = query.from(Tour.class);
        query = query.select(root);
        
        Query q = s.createQuery(query);
        
        int max = 8;
        q.setMaxResults(max);
        q.setFirstResult((page-1) * max);
        
        return q.getResultList();
    }

    @Override
    public List<Tour> getToursRand() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM Tour ORDER BY RAND()");
        q.setMaxResults(3);
        return q.getResultList();
    }

    @Override
    public List<Tour> getToursSearch(String kw, int page) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Tour> query = b.createQuery(Tour.class);
        Root root = query.from(Tour.class);
        query = query.select(root);
        
        if(!kw.isEmpty() && kw != null) {                  
            Predicate p = b.like(root.get("name").as(String.class), String.format("%%%s%%", kw));
            query = query.where(p);
        }
        
        Query q = s.createQuery(query);
        
        int max = 15;
        q.setMaxResults(max);
        q.setFirstResult((page-1) * max);
        
        return q.getResultList();
    }

    @Override
    public List<Tour> getToursId(int id) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Tour> query = b.createQuery(Tour.class);
        Root root = query.from(Tour.class);
        query = query.select(root);
        
        Predicate p = b.equal(root.get("id"), id);
        query = query.where(p);
        
        Query q = s.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public Boolean addTour(Tour tour) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.save(tour);
            return true;
            
        } catch(Exception ex) {
            System.out.print(ex.getMessage());
        }
        
        return false;        
    }

    @Override
    public void deleteTour(int id) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Tour t = getToursId(id).get(0);
        s.delete(t);
    }

    @Override
    public Boolean updateTour(Tour tour) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.update(tour);
            return true;
        } catch (Exception ex) {
             System.out.print(ex.getMessage());
        }
        return false;
    }

    @Override
    public long countTour() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) FROM Tour");
        
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public List<Tour> getTours2() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Tour> query = b.createQuery(Tour.class);
        Root root = query.from(Tour.class);
        query = query.select(root);
        
        Query q = s.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public List<Tour> getTourKw(String kw) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Tour> query = b.createQuery(Tour.class);
        Root root = query.from(Tour.class);
        query = query.select(root);
        
        if(!kw.isEmpty() && kw != null) {                  
            Predicate p = b.like(root.get("name").as(String.class), String.format("%%%s%%", kw));
            query = query.where(p);
        }
        
        Query q = s.createQuery(query);
        
        return q.getResultList();
    }
}
