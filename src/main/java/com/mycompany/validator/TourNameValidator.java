/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.validator;

import com.mycompany.pojo.Tour;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author duytruong
 */
@Component
public class TourNameValidator implements Validator{

    @Override
    public boolean supports(Class<?> type) {
        return Tour.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Tour t = (Tour) o;
        Date date = new Date();
        
        if(t.getName().isBlank()) {
            errors.rejectValue("name", "tour.name.blankErr");
        } else if(t.getDate().before(date)) {
            errors.rejectValue("date", "tour.date.dateErr");
        }
    }
}
