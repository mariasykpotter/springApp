package com.example.demo.repository;

import com.example.demo.model.Activity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ActivityRepository extends JpaRepository<Activity, Integer> {
    Optional<Activity> findById(Integer id);

    @Query("select u.id,u.activityName,p.categoryName from Activity u inner join Category p ON u.category=p.id")
    List<String[]> findActivityAndCategory();

    @Modifying
    @Query(value = "delete from Activity a WHERE a.id IN :activities", nativeQuery = true)
    void deleteActivities(Integer... activities);
}
