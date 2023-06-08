package com.instruments.demo.controller;

import com.instruments.demo.dao.Activos;
import com.instruments.demo.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @ResponseBody
    public Map<String, Object> checkRolUser(@RequestParam("checkUser") String checkUser) {
        Map<String, Object> response = new HashMap<>();
        List<Activos> userAuth = userService.checkUserAuth(checkUser);
        boolean auth = !userAuth.isEmpty();
        response.put("auth", auth);
        return response;
    }


}
