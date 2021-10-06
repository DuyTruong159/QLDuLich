/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service.impl;

import com.mycompany.pojo.Seat;
import com.mycompany.pojo.Ticket;
import com.mycompany.pojo.Tour;
import com.mycompany.pojo.User;
import com.mycompany.repository.SeatRepository;
import com.mycompany.repository.TicketRepository;
import com.mycompany.repository.TourRepository;
import com.mycompany.repository.UserRepository;
import com.mycompany.service.TicketService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author duytruong
 */
@Service
public class TicketServiceImpl implements TicketService{
    @Autowired
    private TicketRepository ticketRepository;
    @Autowired
    private TourRepository tourRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private SeatRepository seatRepository;

    @Override
    public List<Ticket> getAllTicket() {
        return this.ticketRepository.getAllTicket();
    }

    @Override
    public Ticket addTicket(int seatId, int tourId, int quantity) {
        User u = this.userRepository.getUsers("admin").get(0);
        Tour t = this.tourRepository.getToursId(tourId).get(0);
        Seat s = this.seatRepository.getSeatbyId(seatId).get(0);
        
        Ticket ticket = new Ticket();
        ticket.setSeat(s);
        ticket.setTour(t);
        ticket.setUser(u);
        ticket.setQuantity(quantity);
        
        return this.ticketRepository.addTicket(ticket);
    }
    
}
