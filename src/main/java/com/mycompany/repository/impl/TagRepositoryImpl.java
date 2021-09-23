/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.repository.impl;

import com.mycompany.pojo.Tag;
import com.mycompany.repository.TagRepository;
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
public class TagRepositoryImpl implements TagRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Tag> getTag() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Tag> query = b.createQuery(Tag.class);
        Root root = query.from(Tag.class);
        query = query.select(root);
        
        Query q = s.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public Boolean addTag(Tag tag) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.save(tag);
            return true;
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
        }
        
        return false;
    }

    @Override
    public Boolean deleteTag(int id) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            Tag t = getTagbyId(id).get(0);
            s.delete(t);
            return true;
        } catch(Exception ex) {
            System.err.print(ex);
        }
        return false;
    }

    @Override
    public List<Tag> getTagbyId(int id) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Tag> query = b.createQuery(Tag.class);
        Root root = query.from(Tag.class);
        query = query.select(root);
        
        Predicate p = b.equal(root.get("id"), id);
        query = query.where(p);
        
        Query q = s.createQuery(query);
        return q.getResultList();
    }

    @Override
    public Boolean updateTag(Tag tag) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.update(tag);
            return true;
        } catch (Exception ex) {
             System.out.print(ex.getMessage());
        }
        return false;
    }

    @Override
    public List<Tag> getTagSearch(String kw, int page) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Tag> query = b.createQuery(Tag.class);
        Root root = query.from(Tag.class);
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
    public long countTag() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) FROM Tag");
        
        return Long.parseLong(q.getSingleResult().toString());
    }
        
    
}
