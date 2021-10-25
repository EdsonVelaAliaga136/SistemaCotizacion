/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.sistemacotizaciones.clases;

import java.io.Serializable;

/**
 *
 * @author Usuario
 */
public class Herramienta implements Serializable {

    private int idHerr;
    private String descHerr;
    private String uniMedHerr;
    private Double precUniHerr;

    public Herramienta() {
    }

    public int getIdHerr() {
        return idHerr;
    }

    public void setIdHerr(int idHerr) {
        this.idHerr = idHerr;
    }

    public String getDescHerr() {
        return descHerr;
    }

    public void setDescHerr(String descHerr) {
        this.descHerr = descHerr;
    }

    public String getUniMedHerr() {
        return uniMedHerr;
    }

    public void setUniMedHerr(String uniMedHerr) {
        this.uniMedHerr = uniMedHerr;
    }

    public Double getPrecUniHerr() {
        return precUniHerr;
    }

    public void setPrecUniHerr(Double precUniHerr) {
        this.precUniHerr = precUniHerr;
    }
    
}
