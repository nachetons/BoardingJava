package com.instruments.demo.repository;

import com.instruments.demo.dao.Activos;
import com.instruments.demo.dao.Precios;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PriceRepository {

    private final JdbcTemplate jdbcTemplate;

    public PriceRepository(JdbcTemplate jdbcTemplate) {this.jdbcTemplate = jdbcTemplate;}

    public List<Precios> getAllPrices() {
        String sql = "SELECT * FROM PRECIOS";

        return jdbcTemplate.query(
                sql, new BeanPropertyRowMapper<>(Precios.class)
        );

    }
}
