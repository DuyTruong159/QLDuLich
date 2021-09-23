/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.pojo.Seat;
import java.util.List;

/**
 *
 * @author duytruong
 */
public interface SeatService {
    List<Seat> getSeat();
    void deleteSeat(int id);
    Boolean addSeat(Seat seat);
    List<Seat> getSeatbyId(int id);
    Boolean updateSeat(Seat seat);
    List<Seat> getSeatSearch(String kw, int page);
    long countSeat();
}
