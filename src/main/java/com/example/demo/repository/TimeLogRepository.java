package com.example.demo.repository;

import com.example.demo.model.Activity;
import com.example.demo.model.Person;
import com.example.demo.model.TimeLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

@Repository
public interface TimeLogRepository extends JpaRepository<TimeLog, Integer> {
    List<TimeLog> findTimeLogsByUserId(Person user);

    @Query("select B.activityId.id,B.activityId.activityName,B.activityId.category.categoryName, B.startAt,B.endAt,B.duration, B.date,B.taskName from TimeLog B JOIN B.activityId JOIN B.activityId.category WHERE B.userId=:user_id")
    List<String[]> findStringTimeLogsByUserId(Person user_id);

    @Query("select B.activityId.id,B.activityId.activityName,B.activityId.category.categoryName, B.startAt,B.endAt,B.duration, B.date,B.taskName,B.id from TimeLog B JOIN B.activityId JOIN B.activityId.category WHERE B.id =:id AND B.userId=:user_id")
    String findStringTimeLogsByUserIdAndTimeLog(Integer id, Person user_id);

    @Query("SELECT SUM(t.duration) AS SUM_DURATION FROM TimeLog t WHERE t.userId=:userId AND t.activityId=:activityId GROUP BY t.activityId")
    String findSum(Person userId, Activity activityId);

    @Query("select u.id,u.activityName,p.categoryName from Activity u inner join Category p ON u.category=p.id inner join TimeLog t ON t.activityId=u.id WHERE t.date>=:startDate and t.date<=:endDate GROUP BY u.id,u.activityName,p.categoryName")
    List<String[]> findActivityAndCategoryForDates(Date startDate, Date endDate);

    @Query("SELECT a.id, a.firstName,a.lastName,a.userName, COUNT(b.id) FROM Person a LEFT JOIN TimeLog b ON a.id=b.userId GROUP BY a.id")
    List<String[]> findNumberOfTimeLogsPerUser();

    @Modifying
    @Query("UPDATE TimeLog t SET t.activityId=:id, t.startAt = :start_at, t.endAt = :end_at, t.date = :date, t.taskName=:task WHERE t.id=:timeLogId")
    void updateTimeLog(Activity id, Time start_at, Time end_at, Date date, String task, Integer timeLogId);
}
