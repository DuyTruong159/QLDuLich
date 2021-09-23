/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.pojo.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author duytruong
 */
public interface UserService extends UserDetailsService {
    boolean addUser(User user);
    List<User> getUsers(String username);
    List<User> getUsersStaff(String kw, int page);
    long countStaff();
    boolean addStaff(User user);
    List<User> getUserById(int id);
    boolean updateStaff(User user);
    boolean deleteUser(int id);
    List<User> getUsersCustomer(String kw, int page);
    long countCustomer();
    boolean updateCustomer(User user);
    boolean changePass(String username, String newPass, String pass);
}

