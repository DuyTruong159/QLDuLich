/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service.impl;

import com.mycompany.pojo.City;
import com.mycompany.repository.CityRepository;
import com.mycompany.service.CityService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author duytruong
 */
@Service
public class CityServiceImpl implements CityService{
    @Autowired
    private CityRepository cityRepository;

    @Override
    public List<City> getCity() {
        return this.cityRepository.getCity();
    }

    @Override
    public void deleteCity(int id) {
        this.cityRepository.deleteCity(id);
    }

    @Override
    public Boolean addCity(City city) {
        return this.cityRepository.addCity(city);
    }

    @Override
    public List<City> getCitybyId(int id) {
        return this.cityRepository.getCitybyId(id);
    }

    @Override
    public Boolean updateCity(City city) {
        return this.cityRepository.updateCity(city);
    }

    @Override
    public List<City> getCitySearch(String kw, int page) {
        return this.cityRepository.getCitySearch(kw, page);
    }

    @Override
    public long countCity() {
        return this.cityRepository.countCity();
    }
    
}
