/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.validator;

import com.mycompany.pojo.User;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author duytruong
 */
public class UserNameValidator implements Validator{

    @Override
    public boolean supports(Class<?> type) {
        return User.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User u = (User) o;
        
        
        if(u.getName().isBlank()) {
            errors.rejectValue("name", "user.name.blankErr");
        } else if(u.getEmail().isBlank()) {
            errors.rejectValue("email", "user.email.blankErr");
        } else if(u.getUsername().isBlank()) {
            errors.rejectValue("username", "user.username.blankErr");
        } else if(u.getPassword().isBlank()) {
            errors.rejectValue("password", "user.password.blankErr");
        } else if(!u.getPassword().equals(u.getConfirmPassword())) {
            errors.rejectValue("confirmPassword", "user.confirmPassword.blankErr");
        } 
    }
    
}
