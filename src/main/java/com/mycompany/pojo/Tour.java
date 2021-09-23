/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;



/**
 *
 * @author duytruong
 */
@Entity
@Table(name="tour")
public class Tour implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String image;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date date;
    private String duaration;
    private String description;
    private int stock;
    private boolean available;
    @ManyToOne
    @JoinColumn(name="city_id")
    private City city;
    @OneToMany(mappedBy="tour")
    private Set<Seat> seat;
    @ManyToMany(mappedBy="tour", fetch = FetchType.EAGER)
    private Set<Tag> tag;
    @OneToMany(mappedBy="tour", fetch = FetchType.EAGER)
    private Set<Comment> comment;
    
    @Transient
    private MultipartFile file;
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
     * @return the image
     */
    public String getImage() {
        return image;
    }

    /**
     * @param image the image to set
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     * @return the duaration
     */
    public String getDuaration() {
        return duaration;
    }

    /**
     * @param duaration the duaration to set
     */
    public void setDuaration(String duaration) {
        this.duaration = duaration;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the stock
     */
    public int getStock() {
        return stock;
    }

    /**
     * @param stock the stock to set
     */
    public void setStock(int stock) {
        this.stock = stock;
    }

    /**
     * @return the available
     */
    public boolean isAvailable() {
        return available;
    }

    /**
     * @param available the available to set
     */
    public void setAvailable(boolean available) {
        this.available = available;
    }

    /**
     * @return the city
     */
    public City getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(City city) {
        this.city = city;
    }

    /**
     * @return the seat
     */
    public Set<Seat> getSeat() {
        return seat;
    }

    /**
     * @param seat the seat to set
     */
    public void setSeat(Set<Seat> seat) {
        this.seat = seat;
    }

    /**
     * @return the tag
     */
    public Set<Tag> getTag() {
        return tag;
    }

    /**
     * @param tag the tag to set
     */
    public void setTag(Set<Tag> tag) {
        this.tag = tag;
    }

    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }

    /**
     * @return the date
     */
    public Date getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Date date) {
        this.date = date;
    }  

    /**
     * @return the comment
     */
    public Set<Comment> getComment() {
        return comment;
    }

    /**
     * @param comment the comment to set
     */
    public void setComment(Set<Comment> comment) {
        this.comment = comment;
    }
    
}
