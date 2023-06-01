package com.instruments.demo.repository;

import com.instruments.demo.dao.Activos;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class InstrumentRepository {

    private final JdbcTemplate jdbcTemplate;

    public InstrumentRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Activos> getAllInstruments() {
        String sql = "SELECT * FROM ACTIVOS";

        return jdbcTemplate.query(
                sql, new BeanPropertyRowMapper<>(Activos.class)
        );
    }

}
