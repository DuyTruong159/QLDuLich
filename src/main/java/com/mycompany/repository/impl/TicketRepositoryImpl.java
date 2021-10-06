/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.repository.impl;

import com.mycompany.pojo.Ticket;
import com.mycompany.repository.TicketRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
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
public class TicketRepositoryImpl implements TicketRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Ticket> getAllTicket() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Ticket> query = b.createQuery(Ticket.class);
        Root root = query.from(Ticket.class);
        query = query.select(root);
        
        Query q = s.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public Ticket addTicket(Ticket t) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.save(t);
            return t;
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
        }
        
        return null;
    }
    
}
