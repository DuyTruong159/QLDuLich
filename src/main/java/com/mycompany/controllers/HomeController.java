/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controllers;


import com.mycompany.pojo.Tag;
import com.mycompany.service.CommentService;
import com.mycompany.service.SeatService;
import com.mycompany.service.TagService;
import com.mycompany.service.TourService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author duytruong
 */
@Controller
public class HomeController {
    @Autowired
    private TourService tourService;
    @Autowired
    private SeatService seatService;
    @Autowired
    private TagService tagService;
    @Autowired
    private CommentService commentService;
            
    @RequestMapping("/")
    public String index(Model model,@RequestParam(value="page", required=false, defaultValue="1") int page) {
        model.addAttribute("tourrand", this.tourService.getToursRand());
        model.addAttribute("tours", this.tourService.getTours(page));
        model.addAttribute("counter", this.tourService.countTour());
        model.addAttribute("customer", this.commentService.getAllComment());
        return "index";
    }
    
    @RequestMapping("/about_us")
    public String aboutus() {
        return "aboutus";
    }
    
    @RequestMapping("/tour")
    public String tour(Model model, 
            @RequestParam(value="kw", required=false, defaultValue="") String kw,
            @RequestParam(value="page", required=false, defaultValue="1") int page) {
        model.addAttribute("seats", this.seatService.getSeat());
        model.addAttribute("tours", this.tourService.getToursSearch(kw,page));
        model.addAttribute("counter", this.tourService.countTour());       
         
        return "tour";
    }
    
    @RequestMapping("/customer_protect")
    public String customerprotect() {
        return "customerprotect";
    }
    
    @RequestMapping("/contact")
    public String contact() {
        return "contact";
    } 
    
    @RequestMapping("/tour_info/{id}")
    public String tourinfo(Model model,
            @PathVariable(value="id") int id) {
        model.addAttribute("tours", this.tourService.getToursId(id));
        model.addAttribute("seats", this.seatService.getSeat());
        model.addAttribute("tags", this.tagService.getTag());
        model.addAttribute("commentTour", this.commentService.getCommentTour(id));
        return "tourinfo";
    }
    
    @RequestMapping("/datve/{tId}/{sId}")
    public String datve(Model model,
            @PathVariable(value="tId") int tId,
            @PathVariable(value="sId") int sId) {
        model.addAttribute("tours", this.tourService.getToursId(tId));
        model.addAttribute("seats", this.seatService.getSeatbyId(sId).get(0));
        return "datve";
    }

}

