package com.instruments.demo.dao;

import java.util.Date;

public class Precios {

    private int id;
    private double precio;
    private String nombre;
    private Date lastUpdate;

    public Precios() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(Date lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    @Override
    public String toString() {
        return "Precios{" +
                "id=" + id +
                ", precio=" + precio +
                ", nombre='" + nombre + '\'' +
                ", lastUpdate=" + lastUpdate +
                '}';
    }
}
