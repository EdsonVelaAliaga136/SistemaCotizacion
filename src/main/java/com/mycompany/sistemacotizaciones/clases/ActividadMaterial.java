/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.sistemacotizaciones.clases;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class ActividadMaterial implements Serializable{
    private int id_mats;
    private int id_act;
    private int id_mat;
    private int cant_mat;
    private float subtotal = 0f;
    private List<Material> listaMaterial;
    
    public ActividadMaterial() {
    }

    public int getId_mats() {
        return id_mats;
    }

    public void setId_mats(int id_mats) {
        this.id_mats = id_mats;
    }

    public int getId_act() {
        return id_act;
    }

    public void setId_act(int id_act) {
        this.id_act = id_act;
    }

    public int getId_mat() {
        return id_mat;
    }

    public void setId_mat(int id_mat) {
        this.id_mat = id_mat;
    }

    public int getCant_mat() {
        return cant_mat;
    }

    public void setCant_mat(int cant_mat) {
        this.cant_mat = cant_mat;
    }

    public float getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(float subtotal) {
        this.subtotal = subtotal;
    }

    public List<Material> getListaMaterial() {
        return listaMaterial;
    }

    public void setListaMaterial(List<Material> listaMaterial) {
        this.listaMaterial = listaMaterial;
    }
    
    
}
