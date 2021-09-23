/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service.impl;

import com.mycompany.pojo.Seat;
import com.mycompany.repository.SeatRepository;
import com.mycompany.service.SeatService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author duytruong
 */
@Service
public class SeatServiceImpl implements SeatService {
    @Autowired
    private SeatRepository seatRepository;

    @Override
    public List<Seat> getSeat() {
        return this.seatRepository.getSeat();
    }

    @Override
    public void deleteSeat(int id) {
        this.seatRepository.deleteSeat(id);
    }

    @Override
    public Boolean addSeat(Seat seat) {
        return this.seatRepository.addSeat(seat);
    }

    @Override
    public List<Seat> getSeatbyId(int id) {
        return this.seatRepository.getSeatbyId(id);
    }

    @Override
    public Boolean updateSeat(Seat seat) {
        return this.seatRepository.updateSeat(seat);
    }

    @Override
    public List<Seat> getSeatSearch(String kw, int page) {
        return this.seatRepository.getSeatSearch(kw, page);
    }

    @Override
    public long countSeat() {
        return this.seatRepository.countSeat();
    }
}
