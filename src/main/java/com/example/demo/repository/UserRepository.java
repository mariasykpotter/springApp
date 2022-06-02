package com.example.demo.repository;

import com.example.demo.model.Person;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<Person,Integer> {
    public List<Person> findAll();
    public Person getById(int id);
    public Person findByUserNameAndPassword(String userName,String password);
}
