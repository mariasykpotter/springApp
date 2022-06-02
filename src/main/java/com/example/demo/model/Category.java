package com.example.demo.model;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Data
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(unique = true)
    private String categoryName;
    @OneToMany(mappedBy = "category", cascade = {CascadeType.ALL})
    private List<Activity> activities;
}

