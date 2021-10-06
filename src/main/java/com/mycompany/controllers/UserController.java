/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controllers;

import com.google.common.collect.ImmutableList;
import com.mycompany.pojo.User;
import com.mycompany.service.TicketService;
import com.mycompany.service.UserService;
import com.mycompany.validator.UserNameValidator;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author duytruong
 */
@Controller
public class UserController {
    @Autowired
    private UserService userDetailsService;
    @Autowired
    private TicketService ticketService;
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        CustomDateEditor editor = new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true, 10);
        binder.registerCustomEditor(Date.class, editor);
        if (binder.getTarget() == null) return;
        
        final ImmutableList<UserNameValidator> validatorsList = ImmutableList.of(
            new UserNameValidator()
        );

        for (Validator validator : validatorsList) {
            if (validator.supports(binder.getTarget().getClass())) {
                binder.addValidators(validator);
            }
        }
    }
    
    @GetMapping("/register")
    public String register(Model model){
        model.addAttribute("user", new User());
        return "register";
    }
    
    @PostMapping("/register")
    public String registerSuccess(Model model,@ModelAttribute(value="user") @Valid User user,
            BindingResult result) {
        String errMsg = "";
        if(!result.hasErrors()) {
            if(user.getPassword().equals(user.getConfirmPassword())) {
                if(this.userDetailsService.addUser(user) == true) {
                    return "redirect:/login";
                } else {
                    errMsg = "Có người đã đăng ký. Bạn hãy dùng tài khoản khác";
                }
            }
        }
       
        model.addAttribute("errMsg", errMsg);
        
        return "register";
    }
    
    @GetMapping("/login")
    public String login() {
        return "login";
    }
    
    @PostMapping("/profile/{user}")
    public String changePass(Model model,
            @PathVariable(value="user") String user,
            @RequestParam(value="passOld", required=false, defaultValue="") String passOld,
            @RequestParam(value="passNew", required=false, defaultValue="") String passNew,
            @RequestParam(value="passConfirm", required=false, defaultValue="") String passConfirm) {
        
        String errMsg = "";
        User u = this.userDetailsService.getUsers(user).get(0);
        if(u.getPass().equals(passOld)) {
            if(passNew.equals(passConfirm)) {
                if(this.userDetailsService.changePass(user, passNew, passConfirm) == true) {
                    return "redirect:/profile/{user}";
                } else {
                    errMsg = "Có lỗi xảy ra";
                }
            } else {
                errMsg = "Mật khẩu xác nhận không đúng";
            }
        } else {
            errMsg = "Mật khẩu nhập không đúng";
        }
        model.addAttribute("u", u);
        model.addAttribute("errMsg", errMsg);
        model.addAttribute("ticket", this.ticketService.getAllTicket());
        return "profile";
    } 
    
    @GetMapping("/profile/{user}")
    public String profile(Model model,
            @PathVariable(value="user") String user,
            @RequestParam(value="passOld", required=false, defaultValue="") String passOld,
            @RequestParam(value="passNew", required=false, defaultValue="") String passNew,
            @RequestParam(value="passConfirm", required=false, defaultValue="") String passConfirm) {
        
        User u = this.userDetailsService.getUsers(user).get(0);
        
        model.addAttribute("u", u);
//        model.addAttribute("ticket", this.ticketService.getAllTicket());
        return "profile";
    }
    
    @RequestMapping("/staff")
    public String adminStaff(Model model,
            @RequestParam(value="kw", required=false, defaultValue="") String kw,
            @RequestParam(value="page", required=false, defaultValue="1") int page) {
        model.addAttribute("staff", this.userDetailsService.getUsersStaff(kw,page));
        model.addAttribute("counter", this.userDetailsService.countStaff());
        return "/admin/adminStaff";
    }
    
    @GetMapping("/staff/add_staff")
    public String addStaff(Model model) {
        model.addAttribute("user", new User());
        return "/admin/addStaff";
    }
    
    @PostMapping("/staff/add_staff")
    public String addStaffSuccess(Model model,@ModelAttribute(value="user") @Valid User user,
            BindingResult result ) {
        
        String errMsg = "";
        if(!result.hasErrors()) {
            if(user.getPassword().equals(user.getConfirmPassword())) {
                if(this.userDetailsService.addStaff(user) == true) {
                    return "redirect:/staff";
                } else {
                    errMsg = "Có người đã đăng ký. Bạn hãy dùng tài khoản khác";
                }
            }
        }
       
        model.addAttribute("errMsg", errMsg);
        
        return "/admin/addStaff";
    }
    
    @GetMapping("/staff/update/{id}")
    public String updateCity(Model model, 
            @PathVariable(value="id") int id) {
        User u = this.userDetailsService.getUserById(id).get(0);
        model.addAttribute("user", u);
        return "/admin/updateStaff";
    }
    
    @PostMapping("/staff/update/{id}")
    public String updateStaffSuccess(@ModelAttribute(value="user") User user) {     
            if(this.userDetailsService.updateStaff(user) == true) {
                return "redirect:/staff";
            }
        
        return "/admin/updateStaff";
    }
    
    @RequestMapping(value="/staff/delete/{id}", method=RequestMethod.GET)
    public String adminDeleteStaff(@PathVariable(value="id") int id){
        if(this.userDetailsService.deleteUser(id) == true) {
            return "redirect:/staff";
        }
        return "redirect:/staff";
    }
    
    @RequestMapping("/admin/customer")
    public String Customer(Model model,
            @RequestParam(value="kw", required=false, defaultValue="") String kw,
            @RequestParam(value="page", required=false, defaultValue="1") int page) {
        model.addAttribute("customer", this.userDetailsService.getUsersCustomer(kw,page));
        model.addAttribute("counter", this.userDetailsService.countCustomer());
        return "/admin/adminCustomer";
    }
    
    @GetMapping("/admin/customer/update/{id}")
    public String updateCustomer(Model model, 
            @PathVariable(value="id") int id) {
        User u = this.userDetailsService.getUserById(id).get(0);
        model.addAttribute("user", u);
        return "/admin/updateCustomer";
    }
    
    @PostMapping("/admin/customer/update/{id}")
    public String updateCustomerSuccess(@ModelAttribute(value="user") User user) {     
            if(this.userDetailsService.updateCustomer(user) == true) {
                return "redirect:/admin/customer";
            }
        
        return "/admin/updateCustomer";
    }
    
    @RequestMapping(value="/admin/customer/delete/{id}", method=RequestMethod.GET)
    public String adminDeleteCustomer(@PathVariable(value="id") int id){
        if(this.userDetailsService.deleteUser(id) == true) {
            return "redirect:/admin/customer";
        }
        return "redirect:/admin/customer";
    }
    
}
