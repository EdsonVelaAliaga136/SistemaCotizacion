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
public class Actividad implements Serializable {

    private int idAct;
    private String nombreAct;
    private String uniMedAct;
    private int cantAct;
    private List<Material> listaMateriaAct;
    private List<Personal> listaPersAct;
    private List<Herramienta> listaHerrAct;
    private int idItem;
    private float costoAct = 0;

    public int getIdItem() {
        return idItem;
    }

    public void setIdItem(int idItem) {
        this.idItem = idItem;
    }

    public float getCostoAct() {
        return costoAct;
    }

    public void setCostoAct(float costoAct) {
        this.costoAct = costoAct;
    }
    
    public Actividad() {
    }

    public int getIdAct() {
        return idAct;
    }

    public void setIdAct(int idAct) {
        this.idAct = idAct;
    }

    public String getNombreAct() {
        return nombreAct;
    }

    public void setNombreAct(String nombreAct) {
        this.nombreAct = nombreAct;
    }

    public String getUniMedAct() {
        return uniMedAct;
    }

    public void setUniMedAct(String uniMedAct) {
        this.uniMedAct = uniMedAct;
    }

    public int getCantAct() {
        return cantAct;
    }

    public void setCantAct(int cantAct) {
        this.cantAct = cantAct;
    }

    public List<Material> getListaMateriaAct() {
        return listaMateriaAct;
    }

    public void setListaMateriaAct(List<Material> listaMateriaAct) {
        this.listaMateriaAct = listaMateriaAct;
    }

    public List<Personal> getListaPersAct() {
        return listaPersAct;
    }

    public void setListaPersAct(List<Personal> listaPersAct) {
        this.listaPersAct = listaPersAct;
    }

    public List<Herramienta> getListaHerrAct() {
        return listaHerrAct;
    }

    public void setListaHerrAct(List<Herramienta> listaHerrAct) {
        this.listaHerrAct = listaHerrAct;
    }

}
