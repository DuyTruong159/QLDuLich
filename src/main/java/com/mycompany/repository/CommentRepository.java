/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.repository;

import com.mycompany.pojo.Comment;
import java.util.List;

/**
 *
 * @author duytruong
 */
public interface CommentRepository {
    Comment addComment(Comment c);
    List<Object[]> getCommentTour(int id);
    List<Comment> getAllComment();
}
