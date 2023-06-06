package com.instruments.demo.repository;


import com.instruments.demo.dao.Activos;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserRepository {

    private final JdbcTemplate jdbcTemplate;

    public UserRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Activos> getAllUsers() {
        String sql = "SELECT * FROM USUARIOS";

        return jdbcTemplate.query(
                sql, new BeanPropertyRowMapper<>(Activos.class)
        );
    }

    public List<Activos> checkUserAuth(String checkUser) {
        String sql = "SELECT * FROM USUARIOS WHERE CODE = ? AND ROL = 'admin'";

        return jdbcTemplate.query(
                sql, new BeanPropertyRowMapper<>(Activos.class), checkUser
        );
    }
}
