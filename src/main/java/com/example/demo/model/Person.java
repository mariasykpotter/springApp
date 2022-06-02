package com.example.demo.model;

import lombok.Data;
import javax.persistence.*;
import java.util.List;

@Entity
@Data
public class Person {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String firstName;
    private String lastName;
    @Column(name = "user_name", unique = true)
    private String userName;
    private String password;
    @Enumerated(EnumType.ORDINAL)
    private Role role;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "userId", cascade = {CascadeType.ALL})
    private List<TimeLog> timelogs;
}

