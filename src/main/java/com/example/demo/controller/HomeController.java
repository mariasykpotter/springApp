package com.example.demo.controller;

import com.example.demo.model.*;
import com.example.demo.repository.UserRepository;
import com.example.demo.service.ActivityService;
import com.example.demo.service.CategoryService;
import com.example.demo.service.TimeLogService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

@Transactional
@Controller
public class HomeController {

    @Autowired
    UserService userService;
    @Autowired
    ActivityService activityService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    UserRepository userRepository;
    @Autowired
    TimeLogService timeLogService;

    @GetMapping("/")
    public String homePage() {
        return "index";
    }

    @GetMapping("/register")
    public String register() {
        return "registration";
    }

    @PostMapping("/signup")
    public String newUser(@ModelAttribute("user") Person user) {
        user.setRole(Role.USER);
        userService.saveUser(user);
        return "index";
    }

    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("user") Person user, Model model, HttpSession session) {
        Person person = userService.findByUserNameAndPassword(user.getUserName(), user.getPassword());
        if (person != null) {
            session.setAttribute("user", person);
            if (person.getRole() == Role.USER) {
                model.addAttribute("activities", activityService.findActivityAndCategory());
                model.addAttribute("timelogs", timeLogService.getSumForUi(person));
                return "activities";
            } else if (person.getRole() == Role.ADMIN) {
                model.addAttribute("users", timeLogService.findNumberOfTimeLogsPerUser());
                return "view_users";
            }
        }
        return "index";
    }

    @GetMapping("/activities")
    public String showActivities(Model model, HttpSession session) {
        Person person = (Person) session.getAttribute("user");
        model.addAttribute("activities", activityService.findActivityAndCategory());
        model.addAttribute("timelogs", timeLogService.getSumForUi(person));
        return "activities";
    }

    @PostMapping("/delete_activities")
    public String deleteActivities(HttpServletRequest request, Model model) {
        Person person = (Person) request.getSession().getAttribute("user");
        String[] activities = request.getParameterValues("activities");
        Integer[] numbers = new Integer[activities.length];
        for (int i = 0; i < activities.length; i++) {
            numbers[i] = Integer.parseInt(activities[i]);
        }
        activityService.delete(numbers);
        model.addAttribute("activities", activityService.findActivityAndCategory());
        model.addAttribute("timelogs", timeLogService.getSumForUi(person));
        return "activities";
    }

    @GetMapping("/create_activity")
    public String createActivity(Model model) {
        model.addAttribute("categories", new ArrayList<Category>(categoryService.findAllCategories()));
        return "add_activity";
    }

    @PostMapping("/add_activity")
    public ModelAndView addActivities(@ModelAttribute Activity activity, HttpSession session) {
        activityService.saveActivity(activity);
        ModelAndView modelAndView = new ModelAndView("activities", "activities", activityService.findActivityAndCategory());
        modelAndView.addObject("timelogs", timeLogService.getSumForUi((Person) session.getAttribute("user")));
        return modelAndView;
    }

    @GetMapping("/create_timelog")
    public ModelAndView createTimeLog(@RequestParam String id, HttpSession session) {
        Activity activity = activityService.findById(Integer.valueOf(id)).get();
        ModelAndView modelAndView = new ModelAndView("add_timelog", "activity", activity);
        session.setAttribute("activity", activity);
        return modelAndView;
    }

    @PostMapping("/add_timelog")
    public ModelAndView createTimeLog(HttpServletRequest request, HttpSession session) {
        if (request.getParameter("startAt").equals("") || request.getParameter("endAt").equals("") || request.getParameter("date").equals("")) {
            return new ModelAndView("add_timelog", "message", "Please enter all fields in the form");
        }
        Time startTime = Time.valueOf(request.getParameter("startAt"));
        Time endTime = Time.valueOf(request.getParameter("endAt"));
        Date date = Date.valueOf(request.getParameter("date"));
        String taskName = request.getParameter("task");
        float duration = TimeLogService.countDifference(String.valueOf(startTime), String.valueOf(endTime));
        if (duration < 0) {
            return new ModelAndView("add_timelog", "message", "Please enter correct start and end times");
        } else {
            TimeLog timeLog = TimeLog.builder().userId((Person) session.getAttribute("user")).activityId((Activity) session.getAttribute("activity")).date(date).startAt(startTime).endAt(endTime).duration(duration).taskName(taskName).build();
            timeLogService.saveTimeLog(timeLog);
            ModelAndView modelAndView = new ModelAndView("activities", "activities", activityService.findActivityAndCategory());
            modelAndView.addObject("timelogs", timeLogService.getSumForUi((Person) session.getAttribute("user")));
            return modelAndView;
        }
    }

    @GetMapping("/get_by_date")
    public ModelAndView viewTimeLog(HttpServletRequest request, HttpSession session) {
        Person user = (Person) session.getAttribute("user");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        ModelAndView modelAndView = new ModelAndView("activities", "activities", timeLogService.findActivityAndCategoryForDates(startDate, endDate));
        modelAndView.addObject("timelogs", timeLogService.getSumForDatesUi(user, startDate, endDate));
        return modelAndView;
    }

    @GetMapping("/view_timelogs")
    public ModelAndView changeTimeLog(HttpServletRequest request, HttpSession session) {
        Person user = (Person) session.getAttribute("user");
        ModelAndView modelAndView = new ModelAndView("view_timelogs", "timelogs", timeLogService.findTimeLogsByUserId(user));
        modelAndView.addObject("activities", activityService.findActivityAndCategory());
        modelAndView.addObject("timeLogs", timeLogService.findTimeLogsByUserId(user));
        if (user.getRole().equals(Role.USER)) {
            modelAndView.addObject("timeLogactivities", timeLogService.findStringTimeLogsByUserId(user));
            modelAndView.addObject("userType", "user");
        } else if (user.getRole().equals(Role.ADMIN)) {
            modelAndView.addObject("timeLogactivities", timeLogService.findStringTimeLogsByUserId(userService.getById(Integer.valueOf(request.getParameter("id")))));
            modelAndView.addObject("userType", "admin");
        }
        return modelAndView;
    }

    @GetMapping("/view_edit")
    public ModelAndView viewEditTimeLog(HttpServletRequest request, HttpSession session) {
        Integer id = Integer.valueOf(request.getParameter("id"));
        Person user = (Person) session.getAttribute("user");
        String[] timelogs = timeLogService.findStringTimeLogsByUserIdAndTimeLog(id, user).split(",");
        ModelAndView modelAndView = new ModelAndView("edit_timelog", "timeLogactivities", timelogs);
        modelAndView.addObject("activities", activityService.findActivityAndCategory());
        return modelAndView;
    }

    @PostMapping("/edit_timelog")
    public ModelAndView editTimeLog(HttpServletRequest request, HttpSession session) {
        timeLogService.updateTimeLog(activityService.findById(Integer.valueOf(request.getParameter("activity"))).get(),
                Time.valueOf(request.getParameter("start_at")), Time.valueOf(request.getParameter("end_at")), Date.valueOf(request.getParameter("date")),
                String.valueOf(request.getParameter("task")), Integer.valueOf(request.getParameter("time_log")));
        Person user = (Person) session.getAttribute("user");
        ModelAndView modelAndView = new ModelAndView("view_timelogs", "timelogs", timeLogService.findTimeLogsByUserId(user));
        modelAndView.addObject("userType", "user");
        modelAndView.addObject("activities", activityService.findActivityAndCategory());
        modelAndView.addObject("timeLogactivities", timeLogService.findStringTimeLogsByUserId(user));
        return modelAndView;
    }

    @GetMapping("/view_users")
    public ModelAndView viewUsers(ModelAndView model) {
        return new ModelAndView("view_users", "users", timeLogService.findNumberOfTimeLogsPerUser());
    }

    @GetMapping("/view_categories")
    public ModelAndView viewCategories(ModelAndView model) {
        return new ModelAndView("view_categories", "categories", categoryService.getActivititiesNumPerCategory());
    }

    @PostMapping("/add_category")
    public ModelAndView viewCategories(@ModelAttribute("category") Category category) {
        categoryService.saveCategory(category);
        return new ModelAndView("view_categories", "categories", categoryService.getActivititiesNumPerCategory());
    }
    @PostMapping("/delete_categories")
    public ModelAndView deleteActivities(HttpServletRequest request) {
        String[] categories = request.getParameterValues("categories");
        Integer[] numbers = new Integer[categories.length];
        for (int i = 0; i < categories.length; i++) {
            numbers[i] = Integer.parseInt(categories[i]);
        }
        categoryService.delete(numbers);
        return new ModelAndView("view_categories", "categories", categoryService.getActivititiesNumPerCategory());
    }
}
