/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.pojo.Ticket;
import java.util.List;

/**
 *
 * @author duytruong
 */
public interface TicketService {
    List<Ticket> getAllTicket();
    Ticket addTicket(int seatId, int tourId, int quantity);
}
