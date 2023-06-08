package com.instruments.demo.dao;

import java.util.Date;

public class Activos {
    private int id;
    private String code;
    private String nombre;
    private String mercado;
    private String descripcion;
    private String tickerbloomberg;
    private int activo;
    private Date lastUpdate;

    public Activos() {
    }

    public Activos(int id, String code, String nombre, String mercado, String descripcion, String tickerbloomberg, int activo, Date lastUpdate) {
        this.id = id;
        this.code = code;
        this.nombre = nombre;
        this.mercado = mercado;
        this.descripcion = descripcion;
        this.tickerbloomberg = tickerbloomberg;
        this.activo = activo;
        this.lastUpdate = lastUpdate;
    }

    public int getId() {return id;}

    public void setId(int id) {this.id = id;}

    public String getCode() {return code;}

    public void setCode(String code) {this.code = code;}

    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMercado() {
        return mercado;
    }

    public void setMercado(String mercado) {
        this.mercado = mercado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripccion) {
        this.descripcion = descripccion;
    }

    public String getTickerbloomberg() {
        return tickerbloomberg;
    }

    public void setTickerbloomberg(String tickerbloomberg) {
        this.tickerbloomberg = tickerbloomberg;
    }

    public int getActivo() {
        return activo;
    }

    public void setActivo(int activo) {
        this.activo = activo;
    }

    public Date getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(Date lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    @Override
    public String toString() {
        return "Activos{" +
                "id=" + id +
                ", nombre='" + nombre + '\'' +
                ", mercado='" + mercado + '\'' +
                ", descripcion='" + descripcion + '\'' +
                ", tickerbloomberg='" + tickerbloomberg + '\'' +
                ", activo=" + activo +
                ", lastUpdate=" + lastUpdate +
                '}';
    }
}
