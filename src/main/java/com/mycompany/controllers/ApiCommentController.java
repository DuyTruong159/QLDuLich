/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controllers;

import com.mycompany.pojo.Comment;
import com.mycompany.pojo.Ticket;
import com.mycompany.service.CommentService;
import com.mycompany.service.TicketService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author duytruong
 */
@RestController
public class ApiCommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private TicketService ticketService;
    
    @PostMapping(path = "/api/addComment", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Comment> addComment(@RequestBody Map<String, String> param) {
        try {
            String content = param.get("content");
            int tourId = Integer.parseInt(param.get("tourId"));
            int rate = Integer.parseInt(param.get("rate"));
            
            Comment c = this.commentService.addComment(content, tourId, rate);
            
            return new ResponseEntity<>(c, HttpStatus.CREATED);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
         return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    @PostMapping(path = "/api/addTicket")
    public ResponseEntity<Ticket> addTicket(@RequestBody Map<String, String> param) {
        try {
            int tour = Integer.parseInt(param.get("tour"));
            int seat = Integer.parseInt(param.get("seat"));
            int quantity = Integer.parseInt(param.get("quantity"));
            
            Ticket t = this.ticketService.addTicket(seat, tour, quantity);
            
            return new ResponseEntity<>(t, HttpStatus.CREATED);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
}
