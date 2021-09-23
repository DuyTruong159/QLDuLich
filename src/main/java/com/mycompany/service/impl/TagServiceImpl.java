/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service.impl;

import com.mycompany.pojo.Tag;
import com.mycompany.repository.TagRepository;
import com.mycompany.service.TagService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author duytruong
 */
@Service
public class TagServiceImpl implements TagService{
    @Autowired
    private TagRepository tagRepository;

    @Override
    public List<Tag> getTag() {
        return this.tagRepository.getTag();
    }

    @Override
    public Boolean addTag(Tag tag) {
        return this.tagRepository.addTag(tag);
    }

    @Override
    public Boolean deleteTag(int id) {
        return this.tagRepository.deleteTag(id);
    }

    @Override
    public List<Tag> getTagbyId(int id) {
        return this.tagRepository.getTagbyId(id);
    }

    @Override
    public Boolean updateTag(Tag tag) {
        return this.tagRepository.updateTag(tag);
    }

    @Override
    public List<Tag> getTagSearch(String kw, int page) {
        return this.tagRepository.getTagSearch(kw, page);
    }

    @Override
    public long countTag() {
        return this.tagRepository.countTag();
    }
    
}
