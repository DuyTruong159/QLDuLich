/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.repository.impl;

import com.mycompany.pojo.City;
import com.mycompany.repository.CityRepository;
import java.util.List;
import java.util.Set;
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
public class CityRepositoryImpl implements CityRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<City> getCity() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<City> query = b.createQuery(City.class);
        Root root = query.from(City.class);
        query = query.select(root);

        Query q = s.createQuery(query);
        return q.getResultList();
    }

    @Override
    public void deleteCity(int id) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        City c = getCitybyId(id).get(0);
        s.delete(c);
    }

    @Override
    public Boolean addCity(City city) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.save(city);
            return true;
        } catch (Exception ex) {
             System.out.print(ex.getMessage());
        }
        return false;
    }

    @Override
    public List<City> getCitybyId(int id) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<City> query = b.createQuery(City.class);
        Root root = query.from(City.class);
        query = query.select(root);
        
        Predicate p = b.equal(root.get("id"), id);
        query = query.where(p);
        
        Query q = s.createQuery(query);
        return q.getResultList();
    }

    @Override
    public Boolean updateCity(City city) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.update(city);
            return true;
        } catch (Exception ex) {
             System.out.print(ex.getMessage());
        }
        return false;
    }

    @Override
    public List<City> getCitySearch(String kw, int page) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<City> query = b.createQuery(City.class);
        Root root = query.from(City.class);
        query = query.select(root);
        
        if(!kw.isEmpty() && kw != null) {                  
            Predicate p = b.like(root.get("name").as(String.class), String.format("%%%s%%", kw));
            query = query.where(p);
        }
        
        Query q = s.createQuery(query);
        
        int max = 6;
        q.setMaxResults(max);
        q.setFirstResult((page-1) * max);
        
        return q.getResultList();
    }

    @Override
    public long countCity() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) FROM City");
        
        return Long.parseLong(q.getSingleResult().toString());
    }
    
}
