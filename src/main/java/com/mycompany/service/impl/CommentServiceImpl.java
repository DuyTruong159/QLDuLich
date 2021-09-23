/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service.impl;

import com.mycompany.pojo.Comment;
import com.mycompany.pojo.Tour;
import com.mycompany.pojo.User;
import com.mycompany.repository.CommentRepository;
import com.mycompany.repository.TourRepository;
import com.mycompany.repository.UserRepository;
import com.mycompany.service.CommentService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author duytruong
 */
@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private TourRepository tourRepository;
    @Autowired
    private UserRepository userRepository;

    @Override
    public Comment addComment(String content, int tourId, int rate) {
        Tour t = this.tourRepository.getToursId(tourId).get(0);
        User u = this.userRepository.getUsers("admin").get(0);
        
        Comment c = new Comment();
        c.setContent(content);
        c.setTour(t);
        c.setUser(u);
        c.setRate(rate);
        c.setCreatedDate(new Date());
        
        return this.commentRepository.addComment(c);
    }

    @Override
    public List<Object[]> getCommentTour(int id) {
        return this.commentRepository.getCommentTour(id);
    }

    @Override
    public List<Comment> getAllComment() {
        return this.commentRepository.getAllComment();
    }
    
}
