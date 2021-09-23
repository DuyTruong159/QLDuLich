/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.repository.impl;

import com.mycompany.pojo.Comment;
import com.mycompany.pojo.Tour;
import com.mycompany.repository.CommentRepository;
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
public class CommentRepositoryImpl implements CommentRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public Comment addComment(Comment c) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.save(c);
            
            return c;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Object[]> getCommentTour(int id) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = b.createQuery(Object[].class);
        Root rootT = query.from(Tour.class);
        Root rootC = query.from(Comment.class);
        
        Predicate p1 = b.equal(rootC.get("tour"), rootT.get("id"));
        Predicate p2 = b.equal(rootT.get("id"), id);
        Predicate p = b.and(p1, p2);
        query = query.where(p);
        query.multiselect(b.count(rootC.get("id")), b.avg(rootC.get("rate")));
        
        query = query.groupBy(rootT.get("id"));
        
        Query q = s.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public List<Comment> getAllComment() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM Comment ORDER BY RAND()");
        q.setMaxResults(4);
        
        return q.getResultList();
    }
}
