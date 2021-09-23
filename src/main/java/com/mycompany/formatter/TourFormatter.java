/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.formatter;

import com.mycompany.pojo.Tour;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author duytruong
 */
public class TourFormatter implements Formatter<Tour>{

    @Override
    public String print(Tour t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public Tour parse(String string, Locale locale) throws ParseException {
        Tour t = new Tour();
        t.setId(Integer.parseInt(string));
        
        return t;
    }
    
}
