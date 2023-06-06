package com.instruments.demo.repository;

import com.instruments.demo.dao.Activos;
import com.instruments.demo.dao.Instrument;
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

    public List<Activos> getInstrumentsById(int id) {
        String sql = "SELECT * FROM ACTIVOS WHERE ID = ?";

        return jdbcTemplate.query(
                sql, new BeanPropertyRowMapper<>(Activos.class),id
        );

    }

    public int updateInstruments(Activos activos, int id) {
        return jdbcTemplate.update(
                activos.getCode(),
                activos.getNombre(),
                activos.getMercado(),
                activos.getDescripccion(),
                activos.getTickerbloomberg(),
                activos.getActivo(),
                activos.getLastUpdate(),
                id

        );

    }
}
