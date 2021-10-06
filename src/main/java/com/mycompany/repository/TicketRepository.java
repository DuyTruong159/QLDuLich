/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.repository;

import com.mycompany.pojo.Ticket;
import java.util.List;

/**
 *
 * @author duytruong
 */
public interface TicketRepository {
    List<Ticket> getAllTicket();
    Ticket addTicket(Ticket t);
}
