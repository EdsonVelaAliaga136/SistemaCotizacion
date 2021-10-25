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
public class Material implements Serializable{
    private int id_mat;
    private String desc_mat;
    private String uni_med_mat;
    private double prec_uni_mat;
    
    private int cantidad;
    private float costoTotal = 0f;

    public Material() {
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getCostoTotal() {
        return costoTotal;
    }

    public void setCostoTotal(float costoTotal) {
        this.costoTotal = costoTotal;
    }

    public int getId_mat() {
        return id_mat;
    }

    public void setId_mat(int id_mat) {
        this.id_mat = id_mat;
    }

    public String getDesc_mat() {
        return desc_mat;
    }

    public void setDesc_mat(String desc_mat) {
        this.desc_mat = desc_mat;
    }

    public String getUni_med_mat() {
        return uni_med_mat;
    }

    public void setUni_med_mat(String uni_med_mat) {
        this.uni_med_mat = uni_med_mat;
    }

    public double getPrec_uni_mat() {
        return prec_uni_mat;
    }

    public void setPrec_uni_mat(double prec_uni_mat) {
        this.prec_uni_mat = prec_uni_mat;
    }
    
    
}
