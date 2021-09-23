/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controllers;

import com.google.common.collect.ImmutableList;
import com.mycompany.pojo.City;
import com.mycompany.pojo.Seat;
import com.mycompany.pojo.Tag;
import com.mycompany.pojo.Tour;
import com.mycompany.service.CityService;
import com.mycompany.service.CommentService;
import com.mycompany.service.SeatService;
import com.mycompany.service.TagService;
import com.mycompany.service.TourService;
import com.mycompany.service.UserService;
import com.mycompany.validator.CityNameValidator;
import com.mycompany.validator.TagNameValidator;
import com.mycompany.validator.TourNameValidator;
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
public class AdminController {
    @Autowired
    private TourService tourService;
    @Autowired
    private SeatService seatService;
    @Autowired
    private CityService cityService;
    @Autowired
    private TagService tagService;
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        CustomDateEditor editor = new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true, 10);
        binder.registerCustomEditor(Date.class, editor);
        if (binder.getTarget() == null) return;
        
        final ImmutableList<Validator> validatorsList = ImmutableList.of(
            new TourNameValidator(),
            new CityNameValidator(),
            new TagNameValidator()
        );

        for (Validator validator : validatorsList) {
            if (validator.supports(binder.getTarget().getClass())) {
                binder.addValidators(validator);
            }
        }
    }
    
    @ModelAttribute
    public void baseAdmin(Model model) {
        model.addAttribute("messenger", this.commentService.getAllComment());
    }
    
    @RequestMapping("/admin")
    public String admin(Model model,
            @RequestParam(value="page", required=false, defaultValue="1") int page,
            @RequestParam(value="kw", required=false, defaultValue="") String kw) {
        model.addAttribute("tours", this.tourService.getToursSearch(kw, page));
        model.addAttribute("seats", this.seatService.getSeat());
        model.addAttribute("counter", this.tourService.countTour());
        model.addAttribute("user", this.userService.getUsers(""));
        return "/admin/adminsite";
    }
    
    @GetMapping("/admin/add_tour")
    public String addTour(Model model) {
        model.addAttribute("tour", new Tour());
        model.addAttribute("city", this.cityService.getCity());
        return "/admin/addTour";
    }
    
    @PostMapping("/admin/add_tour")
    public String addTourSuccess(Model model,@ModelAttribute(value="tour") @Valid Tour tour,
            BindingResult result) {
        String errMsg = "";
        if(!result.hasErrors()) {
            if(this.tourService.addTour(tour) == true) {
                return "redirect:/admin/tour";
            } else {
                errMsg = "Cần bổ sung hình";
            }
        }
        model.addAttribute("city", this.cityService.getCity());
        model.addAttribute("errMsg", errMsg);
        
        return "/admin/addTour";
    }
    
    @RequestMapping("/admin/tour")
    public String adminTour(Model model, 
            @RequestParam(value="page", required=false, defaultValue="1") int page,
            @RequestParam(value="kw", required=false, defaultValue="") String kw) {
        model.addAttribute("tours", this.tourService.getToursSearch(kw, page));
        model.addAttribute("seats", this.seatService.getSeat());
        model.addAttribute("counter", this.tourService.countTour());
        return "/admin/adminTour";
    }
    
    @RequestMapping(value="/admin/tour/delete/{id}", method=RequestMethod.GET)
    public String adminDeleteTour(@PathVariable(value="id") int id){
        this.tourService.deleteTour(id);
        return "redirect:/admin/tour";
    }
    
    @RequestMapping("/admin/city")
    public String adminCity(Model model,
            @RequestParam(value="page", required=false, defaultValue="1") int page,
            @RequestParam(value="kw", required=false, defaultValue="") String kw){
        model.addAttribute("city", this.cityService.getCitySearch(kw, page));
        model.addAttribute("tours", this.tourService.getTours2());
        model.addAttribute("counter", this.cityService.countCity());
        
        return"/admin/adminCity";
    }
    
    @RequestMapping(value="/admin/city/delete/{id}", method=RequestMethod.GET)
    public String adminDeleteCity(@PathVariable(value="id") int id){
        this.cityService.deleteCity(id);
        return "redirect:/admin/city";

    }
    
    @GetMapping("/admin/add_city")
    public String addCity(Model model){
        model.addAttribute("city", new City());
        return "/admin/addCity";
    }
    
    @PostMapping("/admin/add_city")
    public String addCitySuccess(@ModelAttribute(value="city") @Valid City city,
            BindingResult result) {
        if(!result.hasErrors()) {
            if(this.cityService.addCity(city) == true) {
                return "redirect:/admin/city";
            }
        }
        return "/admin/addCity";
    }
    
    @GetMapping("/admin/city/update/{id}")
    public String updateCity(Model model, 
            @PathVariable(value="id") int id) {
        City c = this.cityService.getCitybyId(id).get(0);
        model.addAttribute("city", c);
        return "/admin/updateCity";
    }
    
    @PostMapping("/admin/city/update/{id}")
    public String updateCitySuccess(@ModelAttribute("city") City city) {

            if(this.cityService.updateCity(city) == true) {
                return "redirect:/admin/city";
            }
        
        return "redirect:/admin/city/update/{id}";
    } 
    
    @RequestMapping("/admin/tag")
    public String adminTag(Model model,
            @RequestParam(value="page", required=false, defaultValue="1") int page,
            @RequestParam(value="kw", required=false, defaultValue="") String kw) {
        model.addAttribute("tags", this.tagService.getTagSearch(kw, page));
        model.addAttribute("counter", this.tagService.countTag());
        return "/admin/adminTag";
    }
    
    @GetMapping("/admin/add_tag")
    public String addTag(Model model){
        model.addAttribute("tag", new Tag());
        model.addAttribute("tours", this.tourService.getTours2());
        return "/admin/addTag";
    }
    
    @PostMapping("/admin/add_tag")
    public String addTagSuccess(Model model, @ModelAttribute("tag") @Valid Tag tag,
            BindingResult result) {
        if(!result.hasErrors()) {
            if(this.tagService.addTag(tag) == true) {
                return "redirect:/admin/tag";
            }
        }
        model.addAttribute("tours", this.tourService.getTours2());
        
        return "/admin/addTag";
    }
    
    @RequestMapping(value="/admin/tag/delete/{id}", method=RequestMethod.GET)
    public String adminDeleteTag(@PathVariable(value="id") int id){
        if(this.tagService.deleteTag(id)==true){
            return "redirect:/admin/tag";
        }
        return "redirect:/admin/tag";
    }
    
    @GetMapping("/admin/tag/update/{id}")
    public String updateTag(Model model,
            @PathVariable(value="id") int id){
        Tag tag = this.tagService.getTagbyId(id).get(0);
        model.addAttribute("tag", tag);
        model.addAttribute("tours", this.tourService.getTours2());

        return "/admin/updateTag";
    }
    
    @PostMapping("/admin/tag/update/{id}")
    public String updateTagSuccess(@ModelAttribute("tag") Tag tag) {

            if(this.tagService.updateTag(tag) == true) {
                return "redirect:/admin/tag";
            }
        
        return "redirect:/admin/tag/update/{id}";
    } 
    
    @RequestMapping("/admin/seat")
    public String adminSeat(Model model,
            @RequestParam(value="page", required=false, defaultValue="1") int page,
            @RequestParam(value="kw", required=false, defaultValue="") String kw) {
        model.addAttribute("seats", this.seatService.getSeatSearch(kw, page));
        model.addAttribute("tours", this.tourService.getTours2());
        model.addAttribute("counter", this.seatService.countSeat());
        return "/admin/adminSeat";
    }
    
    @RequestMapping(value="/admin/seat/delete/{id}", method=RequestMethod.GET)
    public String adminDeleteSeat(@PathVariable(value="id") int id){
        this.seatService.deleteSeat(id);
        return "redirect:/admin/seat";
    }
    
    @GetMapping("/admin/add_seat")
    public String addSeat(Model model){
        model.addAttribute("seat", new Seat());
        model.addAttribute("tours", this.tourService.getTours2());
        return "/admin/addSeat";
    }
    
    @PostMapping("/admin/add_seat")
    public String addSeatSuccess(Model model, @ModelAttribute("seat") @Valid Seat seat,
            BindingResult result) {
        if(!result.hasErrors()) {
            if(this.seatService.addSeat(seat) == true) {
                return "redirect:/admin/seat";
            }
        }
            
        model.addAttribute("tours", this.tourService.getTours2());
        
        return "/admin/addSeat";
    }
    
    @GetMapping("/admin/seat/update/{id}")
    public String updateSeat(Model model, 
            @PathVariable(value="id") int id){
        Seat s = this.seatService.getSeatbyId(id).get(0);
        model.addAttribute("seat", s);
        model.addAttribute("tours", this.tourService.getToursRand());
        return "/admin/updateSeat";
    }
    
    @PostMapping("/admin/seat/update/{id}")
    public String updateSeatSuccess(@ModelAttribute("seat") Seat seat) {

            if(this.seatService.updateSeat(seat) == true) {
                return "redirect:/admin/seat";
            }
        
        return "redirect:/admin/seat/update/{id}";
    } 
    
    @GetMapping("/admin/tour/update/{id}")
    public String updateTour(Model model, 
            @PathVariable(value="id") int id){
        Tour t = this.tourService.getToursId(id).get(0);
        model.addAttribute("tour", t);
        model.addAttribute("city", this.cityService.getCity());
        return "/admin/updateTour";
    }
    
    @PostMapping("/admin/tour/update/{id}")
    public String updateTourSuccess(@ModelAttribute("tour") Tour tour) {

            if(this.tourService.updateTour(tour) == true) {
                return "redirect:/admin/tour";
            }
        
        return "redirect:/admin/tour/update/{id}";
    } 
}
