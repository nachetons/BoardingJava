package com.instruments.demo.controller;

import com.instruments.demo.dao.Activos;
import com.instruments.demo.dao.Precios;
import com.instruments.demo.service.PriceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class PriceController {

@Autowired
private PriceService priceService;


    Logger logger = LoggerFactory.getLogger(InstrumentController.class);

    @GetMapping("/getPrices/{id}")
    public ResponseEntity<List<Precios>> getAllPricesById(@PathVariable int id) {
        List<Precios> precios = priceService.getAllPricesById(id);
        return ResponseEntity.ok().body(precios);

    }
}
