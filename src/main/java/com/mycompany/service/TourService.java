/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.pojo.Tour;
import java.util.List;

/**
 *
 * @author duytruong
 */
public interface TourService {
    List<Tour> getTours(int page);
    List<Tour> getTours2();
    List<Tour> getToursRand();
    List<Tour> getToursSearch(String kw, int page);
    List<Tour> getToursId(int id);
    List<Tour> getTourKw(String kw);
    Boolean addTour(Tour tour);
    void deleteTour(int id);
    Boolean updateTour(Tour tour);
    long countTour();
    List<Object[]> tourStats();
}
