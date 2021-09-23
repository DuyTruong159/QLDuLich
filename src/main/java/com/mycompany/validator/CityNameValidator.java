/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.validator;

import com.mycompany.pojo.City;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author duytruong
 */
@Component
public class CityNameValidator implements Validator{

    @Override
    public boolean supports(Class<?> type) {
        return City.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        City c = (City) o;
        if(c.getName().isBlank()){
            errors.rejectValue("name", "city.name.blankErr");
        }
    }
    
}
