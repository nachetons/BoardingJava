package com.instruments.demo.controller;

import com.instruments.demo.dao.Activos;
import com.instruments.demo.dao.Instrument;
import com.instruments.demo.service.InstrumentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class InstrumentController {

    Logger logger = LoggerFactory.getLogger(InstrumentController.class);

    @Autowired
    private InstrumentService instrumentService;


    @RequestMapping("/")
    public ModelAndView getInstruments() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        List<Activos> instrument = instrumentService.getAllInstruments();
        modelAndView.addObject("list", instrument);
        logger.info("GET ALL");
        return modelAndView;
    }

    @RequestMapping("/create")
    public ModelAndView  addInstruments() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("create");
        System.out.println("Pepe");
        logger.info("CREATE");
        return modelAndView;
    }

    @GetMapping("/edit/{id}")
    public ModelAndView getInstruments(@PathVariable int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("edit");
        List<Activos> instrument = instrumentService.getInstrumentsById(id);
        modelAndView.addObject("list", instrument);
        System.out.println("EDIT");
        return modelAndView;
    }


    @PutMapping("/update/{id}")
    public int editInstruments(@RequestBody Activos activo, @PathVariable int id) {
        return instrumentService.updateInstruments(activo, id);
    }

    @RequestMapping("/disabled/{id}")
    public ModelAndView  disabledInstruments(@RequestParam int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        modelAndView.addObject("id", id);
        System.out.println("DISABLED");
        return modelAndView;
    }

    @RequestMapping("/remove/{id}")
    public ModelAndView  deleteInstruments(@RequestParam int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        modelAndView.addObject("id", id);
        System.out.println("REMOVE");
        return modelAndView;
    }




}
