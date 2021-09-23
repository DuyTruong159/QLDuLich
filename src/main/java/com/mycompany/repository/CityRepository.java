/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.repository;

import com.mycompany.pojo.City;
import java.util.List;

/**
 *
 * @author duytruong
 */
public interface CityRepository {
    List<City> getCity();
    void deleteCity(int id);
    Boolean addCity(City city);
    List<City> getCitybyId(int id);
    Boolean updateCity(City city);
    List<City> getCitySearch(String kw, int page);
    long countCity();
}
