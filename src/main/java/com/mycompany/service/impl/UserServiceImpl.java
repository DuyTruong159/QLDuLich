/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.mycompany.pojo.User;
import com.mycompany.repository.UserRepository;
import com.mycompany.service.UserService;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author duytruong
 */
@Service("userDetailsService")
public class UserServiceImpl implements UserService{
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public boolean addUser(User user) { 
        user.setPass(user.getPassword());
        String pass = user.getPassword();
        user.setPassword(this.passwordEncoder.encode(pass));
        user.setUserRole(User.USER);
        user.setActive(true);
        
        try {
            if(user.getAvatar()==null) {
                user.setAvatar("/images/avatar.png");
                
                return this.userRepository.addUser(user);
            } else {
                Map r = this.cloudinary.uploader().upload(user.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto")); 
                user.setAvatar((String) r.get("secure_url"));

                return this.userRepository.addUser(user);
            } 
        } catch(Exception ex) {
            System.out.print(ex.getMessage());
        }
        
        return false;
    }

    @Override
    public List<User> getUsers(String username) {
        return this.userRepository.getUsers(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> users = this.getUsers(username);
        if(users.isEmpty()) {
            throw new UsernameNotFoundException("User does not exist!!!");
        }
        User user = users.get(0);
        
        Set<GrantedAuthority> auth = new HashSet<>();
        auth.add(new SimpleGrantedAuthority(user.getUserRole()));
        
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), auth);
    }

    @Override
    public List<User> getUsersStaff(String kw, int page) {
        return this.userRepository.getUsersStaff(kw,page);
    }

    @Override
    public long countStaff() {
        return this.userRepository.countStaff();
    }

    @Override
    public boolean addStaff(User user) {
        user.setPass(user.getPassword());
        String pass = user.getPassword();
        user.setPassword(this.passwordEncoder.encode(pass));
        user.setUserRole(User.STAFF);
        
        try {
            if(user.getAvatar()==null) {
                user.setAvatar("/images/avatar.png");
                
                return this.userRepository.addUser(user);
            } else {
                Map r = this.cloudinary.uploader().upload(user.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto")); 
                user.setAvatar((String) r.get("secure_url"));

                return this.userRepository.addUser(user);
            } 
        } catch(Exception ex) {
            System.out.print(ex.getMessage());
        }
        
        return false;
    }

    @Override
    public List<User> getUserById(int id) {
        return this.userRepository.getUserById(id);
    }

    @Override
    public boolean updateStaff(User user) {
        user.setUserRole(User.STAFF);
        
        String passNew = user.getPassword(); 
        if(!this.passwordEncoder.matches(user.getPass(), passNew)) {
            user.setPass(user.getPassword());
            String pass = user.getPassword();
            user.setPassword(this.passwordEncoder.encode(pass));
        }
        
        try {
            if(user.getAvatar()==null) {
                user.setAvatar("/images/avatar.png");
                
                return this.userRepository.updateStaff(user);
            } else {
                Map r = this.cloudinary.uploader().upload(user.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto")); 
                user.setAvatar((String) r.get("secure_url"));

                return this.userRepository.updateStaff(user);
            } 
        } catch (IOException ex) {
            Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean deleteUser(int id) {
        return this.userRepository.deleteUser(id);
    }

    @Override
    public List<User> getUsersCustomer(String kw, int page) {
        return this.userRepository.getUsersCustomer(kw, page);
    }

    @Override
    public long countCustomer() {
        return this.userRepository.countCustomer();
    }

    @Override
    public boolean updateCustomer(User user) {
        user.setUserRole(User.USER);
        
        String passNew = user.getPassword(); 
        if(!this.passwordEncoder.matches(user.getPass(), passNew)) {
            user.setPass(user.getPassword());
            String pass = user.getPassword();
            user.setPassword(this.passwordEncoder.encode(pass));
        }
        
        
        try {
            if(user.getAvatar()==null) {
                user.setAvatar("/images/avatar.png");
                
                return this.userRepository.updateStaff(user);
            } else {
                Map r = this.cloudinary.uploader().upload(user.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto")); 
                user.setAvatar((String) r.get("secure_url"));

                return this.userRepository.updateCustomer(user);
            } 
        } catch (IOException ex) {
            Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }    

    @Override
    public boolean changePass(String username, String password, String pass) {
        String passEncode = this.passwordEncoder.encode(password);
        return this.userRepository.changePass(username, passEncode, password);
    }
    
}
