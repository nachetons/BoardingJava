package com.instruments.demo.service;


import com.instruments.demo.dao.Activos;
import com.instruments.demo.repository.InstrumentRepository;
import com.instruments.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    public List<Activos> getAllUsers() {
        return userRepository.getAllUsers();
    }

    public List<Activos> checkUserAuth(String checkUser) {return userRepository.checkUserAuth(checkUser); }
}
