package com.example.demo.service;

import com.example.demo.model.Person;
import com.example.demo.repository.UserRepository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Person getById(int id){
        return userRepository.getById(id);
    }

    public void saveUser(Person user) {
        userRepository.save(user);
    }

    public Person findByUserNameAndPassword(String userName, String password) {
        return userRepository.findByUserNameAndPassword(userName, password);
    }

    public void save(Person user) {
        userRepository.save(user);
    }

    public List<Person> findAllUsers() {
        return userRepository.findAll();
    }
}
