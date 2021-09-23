/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.repository;

import com.mycompany.pojo.Tag;
import java.util.List;

/**
 *
 * @author duytruong
 */
public interface TagRepository {
    List<Tag> getTag();
    Boolean addTag(Tag tag);
    Boolean deleteTag(int id);
    List<Tag> getTagbyId(int id);
    Boolean updateTag(Tag tag);
    List<Tag> getTagSearch(String kw, int page);
    long countTag();
}
