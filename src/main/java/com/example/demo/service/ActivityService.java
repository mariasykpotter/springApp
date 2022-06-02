package com.example.demo.service;

import com.example.demo.model.Activity;
import com.example.demo.repository.ActivityRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ActivityService {

    private final ActivityRepository activityRepository;

    public ActivityService(ActivityRepository activityRepository) {
        this.activityRepository = activityRepository;
    }

    public List<String[]> findActivityAndCategory() {
        return activityRepository.findActivityAndCategory();
    }

    public void saveActivity(Activity activity) {
        activityRepository.save(activity);
    }

    public void delete(Integer... ids) {
        activityRepository.deleteActivities(ids);
    }

    public Optional<Activity> findById(Integer id) {
        return activityRepository.findById(id);
    }
}
