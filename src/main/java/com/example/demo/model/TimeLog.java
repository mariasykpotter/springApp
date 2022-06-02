package com.example.demo.model;

import lombok.*;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;

@Builder
@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class TimeLog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne(cascade = {CascadeType.MERGE})
    @JoinColumn(name = "user_id")
    @ToString.Exclude
    private Person userId;
    @ManyToOne(cascade = {CascadeType.REMOVE})
    @JoinColumn(name = "activity_id")
    @ToString.Exclude
    private Activity activityId;
    private Date date;
    private Time startAt;
    private Time endAt;
    private float duration;
    private String taskName;
}
