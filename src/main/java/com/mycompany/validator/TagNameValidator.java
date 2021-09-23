/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.validator;

import com.mycompany.pojo.Tag;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author duytruong
 */
public class TagNameValidator implements Validator{

    @Override
    public boolean supports(Class<?> type) {
        return Tag.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Tag t = (Tag) o;
        if(t.getName().isBlank()){
            errors.rejectValue("name", "tag.name.blankErr");
        }
    }
    
}
