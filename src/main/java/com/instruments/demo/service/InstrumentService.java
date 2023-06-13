package com.instruments.demo.service;

import com.instruments.demo.dao.Activos;
import com.instruments.demo.repository.InstrumentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InstrumentService {


    @Autowired
    private InstrumentRepository instrumentRepository;
    public List<Activos> getAllInstruments() {
        return instrumentRepository.getAllInstruments();
    }
    public List<Activos> getInstrumentsById(int id) {return instrumentRepository.getInstrumentsById(id); }

    public void updateInstruments(Activos activo, int id) {
        instrumentRepository.updateInstruments(activo, id);
    }

    public void saveInstruments(Activos activo) { instrumentRepository.saveInstruments(activo); }
}
