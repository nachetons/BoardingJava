package com.instruments.demo.dao;

import java.util.Date;

public class Activos {
    private String nameInstrument;
    private String marketplace;
    private String description;
    private String ticker;
    private int activado;
    private Date lastUpdate;

    public Activos() {
    }

    public String getNameInstrument() {
        return nameInstrument;
    }

    public void setNameInstrument(String nameInstrument) {
        this.nameInstrument = nameInstrument;
    }

    public String getMarketplace() {
        return marketplace;
    }

    public void setMarketplace(String marketplace) {
        this.marketplace = marketplace;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTicker() {
        return ticker;
    }

    public void setTicker(String ticker) {
        this.ticker = ticker;
    }

    public int getActivado() {
        return activado;
    }

    public void setActivado(int activado) {
        this.activado = activado;
    }

    public Date getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(Date lastUpdate) {
        this.lastUpdate = lastUpdate;
    }



}
