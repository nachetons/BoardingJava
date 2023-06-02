package com.instruments.demo.controller;

import com.instruments.demo.dao.Activos;
import com.instruments.demo.service.InstrumentService;
import com.instruments.demo.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserController {
    Logger logger = LoggerFactory.getLogger(InstrumentController.class);

    @Autowired
    private UserService userService;



    @RequestMapping("/users")
    public ModelAndView getUsers() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        List<Activos> instrument = userService.getAllUsers();
        modelAndView.addObject("list", instrument);
        logger.info("GET ALL");
        return modelAndView;
    }
    @RequestMapping("/auth")
    public ModelAndView checkRolUser(@RequestParam("checkUser") String checkUser) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        List<Activos> userAuth = userService.checkUserAuth(checkUser);
        if (userAuth.isEmpty()) {
            modelAndView.addObject("auth", true);
            logger.info("User logged in");
        }else {
            modelAndView.addObject("auth", false);
            logger.info("User not logged in");
        }
        return modelAndView;
    }

}
