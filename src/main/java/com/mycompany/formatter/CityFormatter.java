/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.formatter;

import com.mycompany.pojo.City;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author duytruong
 */
public class CityFormatter implements Formatter<City>{

    @Override
    public String print(City t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public City parse(String string, Locale locale) throws ParseException {
        City c = new City();
        c.setId(Integer.parseInt(string));
        
        return c;
    }
    
}
