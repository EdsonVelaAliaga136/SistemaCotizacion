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
public class Personal implements Serializable{
   private int idPer ;
   private String descPer;
   private String uniMedPer;
   private Double prcProdPer;

    public Personal() {
    }

    public int getIdPer() {
        return idPer;
    }

    public void setIdPer(int idPer) {
        this.idPer = idPer;
    }

    public String getDescPer() {
        return descPer;
    }

    public void setDescPer(String descPer) {
        this.descPer = descPer;
    }

    public String getUniMedPer() {
        return uniMedPer;
    }

    public void setUniMedPer(String uniMedPer) {
        this.uniMedPer = uniMedPer;
    }

    public Double getPrcProdPer() {
        return prcProdPer;
    }

    public void setPrcProdPer(Double prcProdPer) {
        this.prcProdPer = prcProdPer;
    }
   
   
}
