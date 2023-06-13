package com.instruments.demo.service;

import com.instruments.demo.dao.Activos;
import com.instruments.demo.dao.Precios;
import com.instruments.demo.repository.PriceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PriceService {
    @Autowired
    private PriceRepository priceRepository;

    public List<Precios> getAllPrices() {
        return priceRepository.getAllPrices();
    }

    public List<Precios> getAllPricesById(int id) {
        return priceRepository.getAllPricesById(id);
    }

    public void updatePrecio(Precios precio, int id) {
        priceRepository.updatePrecio(precio, id);

    }
}
