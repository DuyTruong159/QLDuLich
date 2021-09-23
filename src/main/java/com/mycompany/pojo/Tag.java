/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.pojo;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 *
 * @author duytruong
 */
@Entity
@Table(name="tag")
public class Tag implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name="tour_tag",
            joinColumns = {
                @JoinColumn(name="id_tag")
            },
            inverseJoinColumns = {
                @JoinColumn(name="id_tour")
            }
    )
    public Set<Tour> tour;
    @Column(name="html_tag")
    private String htmlTag;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the tour
     */
    public Set<Tour> getTour() {
        return tour;
    }

    /**
     * @param tour the tour to set
     */
    public void setTour(Set<Tour> tour) {
        this.tour = tour;
    }

    /**
     * @return the htmlTag
     */
    public String getHtmlTag() {
        return htmlTag;
    }

    /**
     * @param htmlTag the htmlTag to set
     */
    public void setHtmlTag(String htmlTag) {
        this.htmlTag = htmlTag;
    }
}
