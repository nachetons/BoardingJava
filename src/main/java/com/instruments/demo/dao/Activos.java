package com.instruments.demo.dao;

import java.util.Date;

public class Activos {
    private String nombre;
    private String mercado;
    private String descripccion;
    private String tickerbloomberg;
    private int activo;
    private Date lastUpdate;

    public Activos() {
    }

    public Activos(String nombre, String mercado, String descripccion, String tickerbloomberg, int activo, Date lastUpdate) {
        this.nombre = nombre;
        this.mercado = mercado;
        this.descripccion = descripccion;
        this.tickerbloomberg = tickerbloomberg;
        this.activo = activo;
        this.lastUpdate = lastUpdate;
    }



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

    public String getDescripccion() {
        return descripccion;
    }

    public void setDescripccion(String descripccion) {
        this.descripccion = descripccion;
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
                "nombre='" + nombre + '\'' +
                ", mercado='" + mercado + '\'' +
                ", descripccion='" + descripccion + '\'' +
                ", tickerbloomberg='" + tickerbloomberg + '\'' +
                ", activo=" + activo +
                ", lastUpdate=" + lastUpdate +
                '}';
    }
}
