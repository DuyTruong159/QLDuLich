/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.pojo.Comment;
import java.util.List;

/**
 *
 * @author duytruong
 */
public interface CommentService {
    Comment addComment(String content, int tourId, int rate);
    List<Object[]> getCommentTour(int id);
    List<Comment> getAllComment();
}
