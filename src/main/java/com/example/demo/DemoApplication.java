package com.example.demo;

import com.example.demo.service.ActivityService;
import com.example.demo.service.TimeLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

@SpringBootApplication
@Transactional
public class DemoApplication implements CommandLineRunner {

    @Autowired
    EntityManager entityManager;
    @Autowired
    ActivityService activityService;
    @Autowired
    TimeLogService timeLogService;

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
//        System.out.println(Time.valueOf("16:29:05"));
//        List<TimeLog> timelogs = timeLogService.findAllTimeLogs();
//        System.out.println(timelogs.get(0).getId());
//        for (String[] e : timeLogService.findActivityAndCategory()) {
//            for (String l : e) {
//                System.out.println(l);
//            }
//        }
        //1
//        Category categ = new Category();
//        categ.setCategoryName("спорт");
//        entityManager.persist(categ);
//        Category category = entityManager.getReference(Category.class, 1);
//        Activity activity1 = new Activity();
//        activity1.setActivityName("біг");
//        activity1.setCategory(category);
//        entityManager.persist(activity1);
//        Activity activity3 = new Activity();
//        activity3.setActivityName("плавання");
//        activity3.setCategory(category);
//        entityManager.persist(activity3);
//        Person person = new Person("m","p","mp", Role.USER,"123");
//        entityManager.persist(person);
        //2
//        List<String[]> lst = activityService.findActivityAndCategory();
//        for (String[] el : lst) {
//            System.out.println(el[0]);
//            System.out.println(el[1]);
//            System.out.println(el[2]);
        //3
//        TimeLog timeLog1 = new TimeLog(entityManager.getReference(Person.class, 1),
//            entityManager.getReference(Activity.class, 22), Time.valueOf("20:03"), Time.valueOf("20:53"),
//            1.0F, Status.UNAPPROVED);
//        TimeLog timeLog3 = new TimeLog(entityManager.getReference(Person.class, 1),
//            entityManager.getReference(Activity.class, 23), Time.valueOf("20:03"), Time.valueOf("21:03"),
//            1.0F, Status.UNAPPROVED);
//        entityManager.persist(timeLog1);
//        entityManager.persist(timeLog3);
//        for (String[] el : timeLogService.findSum(entityManager.getReference(Person.class, 1), entityManager.getReference(Activity.class, 1))) {
//            for (String e : el) {
//                System.out.println(e);
//            }
//        }
    }
}
