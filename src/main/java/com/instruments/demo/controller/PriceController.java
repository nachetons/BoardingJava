package com.instruments.demo.controller;

import com.instruments.demo.dao.Activos;
import com.instruments.demo.dao.Precios;
import com.instruments.demo.service.PriceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class PriceController {

@Autowired
private PriceService priceService;


    Logger logger = LoggerFactory.getLogger(InstrumentController.class);


}
