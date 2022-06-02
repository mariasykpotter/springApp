package com.example.demo.repository;

import com.example.demo.model.Activity;
import com.example.demo.model.Person;
import com.example.demo.service.TimeLogService;
import javax.persistence.EntityManager;
import org.springframework.beans.factory.annotation.Autowired;

public class RepositoryTest {
    @Autowired
    static TimeLogService timeLogService;
    @Autowired
    static EntityManager entityManager;
    public static void main(String[] args) {
        timeLogService.findSum(entityManager.getReference(Person.class,1),entityManager.getReference(Activity.class,14));
    }

}
