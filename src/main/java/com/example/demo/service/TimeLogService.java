package com.example.demo.service;

import com.example.demo.model.Activity;
import com.example.demo.model.Person;
import com.example.demo.model.TimeLog;
import com.example.demo.repository.TimeLogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Service
public class TimeLogService {
    @Autowired
    ActivityService activityService;
    @Autowired
    TimeLogRepository timeLogRepository;
    @PersistenceContext
    EntityManager entityManager;

    public List<TimeLog> findTimeLogsByUserId(Person user) {
        return timeLogRepository.findTimeLogsByUserId(user);
    }

    public List<String[]> findStringTimeLogsByUserId(Person user) {
        return timeLogRepository.findStringTimeLogsByUserId(user);
    }

    public String findStringTimeLogsByUserIdAndTimeLog(Integer id, Person user_id) {
        return timeLogRepository.findStringTimeLogsByUserIdAndTimeLog(id, user_id);
    }

    public void saveTimeLog(TimeLog timeLog) {
        timeLogRepository.save(timeLog);
    }

    public void updateTimeLog(Activity activityId, Time start_at, Time end_at, Date date, String taskName, Integer timeLog) {
        timeLogRepository.updateTimeLog(activityId, start_at, end_at, date, taskName,timeLog);
    }

    public String findSum(Person user, Activity activity) {
        return timeLogRepository.findSum(user, activity);
    }

    public List<String[]> findActivityAndCategoryForDates(Date startDate, Date endDate) {
        return timeLogRepository.findActivityAndCategoryForDates(startDate, endDate);
    }

    public List<String[]> findNumberOfTimeLogsPerUser(){
        return timeLogRepository.findNumberOfTimeLogsPerUser();
    }

    public List<String> getSumForUi(Person person) {
        List<String> timelogs = new ArrayList<>();
        for (String[] lst : activityService.findActivityAndCategory()) {
            String sum = findSum(person, entityManager.getReference(Activity.class, Integer.valueOf(lst[0])));
            if (sum != null) {
                timelogs.add(String.format("%.2f", Float.valueOf(sum)));
            } else {
                timelogs.add(String.valueOf(0.0F));
            }
        }
        return timelogs;
    }

    public List<String> getSumForDatesUi(Person person, Date startDate, Date endDate) {
        List<String> timelogs = new ArrayList<>();
        for (String[] lst : findActivityAndCategoryForDates(startDate, endDate)) {
            String sum = findSum(person, entityManager.getReference(Activity.class, Integer.valueOf(lst[0])));
            if (sum != null) {
                timelogs.add(String.format("%.2f", Float.valueOf(sum)));
            } else {
                timelogs.add(String.valueOf(0.0F));
            }
            for (String el : lst) {
                System.out.println(el);
            }
        }
        return timelogs;
    }

    public static float countDifference(String time1, String time2) {
        SimpleDateFormat format = new SimpleDateFormat("HH:mm");
        java.util.Date date1 = null;
        java.util.Date date2 = null;
        try {
            date1 = format.parse(time1);
            date2 = format.parse(time2);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        float diff = (float) ((date2.getTime() - date1.getTime()) / (60 * 1000 * 60.0));
        return (float) (Math.round(diff * 100.0) / 100.0);
    }
}