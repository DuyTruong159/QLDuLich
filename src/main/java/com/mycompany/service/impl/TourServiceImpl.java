/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.mycompany.pojo.Tour;
import com.mycompany.repository.TourRepository;
import com.mycompany.service.TourService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author duytruong
 */
@Service
public class TourServiceImpl implements TourService{
    @Autowired
    private TourRepository tourRepository;
    @Autowired
    private Cloudinary cloudinary; 
        
    @Override
    public List<Tour> getTours(int page) {
        return this.tourRepository.getTours(page);
    }

    @Override
    public List<Tour> getToursRand() {
        return this.tourRepository.getToursRand();
    }

    @Override
    public List<Tour> getToursSearch(String kw, int page) {
        return this.tourRepository.getToursSearch(kw,page);
    }

    @Override
    public List<Tour> getToursId(int id) {
        return this.tourRepository.getToursId(id);
    }

    @Override
    public Boolean addTour(Tour tour) {
        try {
            Map r = this.cloudinary.uploader().upload(tour.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto")); 
            tour.setImage((String) r.get("secure_url"));
            
            return this.tourRepository.addTour(tour);
            
        } catch (Exception ex) {
            System.err.print(ex.getMessage());
        }
        return false;
    }

    @Override
    public void deleteTour(int id) {
        this.tourRepository.deleteTour(id);
    }

    @Override
    public Boolean updateTour(Tour tour) {
        try {
            Map r = this.cloudinary.uploader().upload(tour.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto")); 
            tour.setImage((String) r.get("secure_url"));
            
            return this.tourRepository.updateTour(tour);
            
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
        }
        return false;
        
    }

    @Override
    public long countTour() {
        return this.tourRepository.countTour();
    }

    @Override
    public List<Tour> getTours2() {
        return this.tourRepository.getTours2();
    }       

    @Override
    public List<Tour> getTourKw(String kw) {
        return this.tourRepository.getTourKw(kw);
    }

    @Override
    public List<Object[]> tourStats() {
        return this.tourRepository.tourStats();
    }

    @Override
    public List<Object[]> ticketStats() {
        return this.tourRepository.ticketStats();
    }
}
