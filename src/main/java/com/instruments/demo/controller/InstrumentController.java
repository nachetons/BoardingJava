package com.instruments.demo.controller;

import com.instruments.demo.dao.Activos;
import com.instruments.demo.service.InstrumentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class InstrumentController {

    Logger logger = LoggerFactory.getLogger(InstrumentController.class);

    @Autowired
    private InstrumentService instrumentService;


    @RequestMapping("/")
    public ModelAndView getInstrumentID() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        List<Activos> instrument = instrumentService.getAllInstruments();
        modelAndView.addObject("list", instrument);
        logger.info("GET ALL");
        return modelAndView;
    }

    @RequestMapping("/create")
    public ModelAndView addInstruments() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("create");
        System.out.println("Pepe");
        logger.info("CREATE");
        return modelAndView;
    }

    @GetMapping("/edit/{id}")
    public ModelAndView getInstrumentID(@PathVariable int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("edit");
        List<Activos> instrument = instrumentService.getInstrumentsById(id);
        modelAndView.addObject("list", instrument);
        System.out.println("EDIT");
        return modelAndView;
    }


    @PutMapping("/update/{id}")
    public ResponseEntity<String> editInstruments(@RequestBody Activos activo, @PathVariable int id) {

        try{
                instrumentService.updateInstruments(activo, id);
                return new ResponseEntity<>("Balance has been changed successfully", HttpStatus.ACCEPTED);

        }catch (Exception e){
            logger.error(e.getCause().getMessage());
            return new ResponseEntity<>("can't change the balance",HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping("/save")
    public ResponseEntity<String> saveInstruments(@RequestBody Activos activo) {
        try{
            instrumentService.saveInstruments(activo);
            return new ResponseEntity<>("Instrument has been saved successfully", HttpStatus.ACCEPTED);

        }catch (Exception e){
            logger.error(e.getCause().getMessage());
            return new ResponseEntity<>("can't save the instrument",HttpStatus.BAD_REQUEST);
        }
    }


    @RequestMapping("/disabled/{id}")
    public ModelAndView disabledInstruments(@RequestParam int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        modelAndView.addObject("id", id);
        System.out.println("DISABLED");
        return modelAndView;
    }

    @RequestMapping("/remove/{id}")
    public ModelAndView deleteInstruments(@RequestParam int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        modelAndView.addObject("id", id);
        System.out.println("REMOVE");
        return modelAndView;
    }




}
