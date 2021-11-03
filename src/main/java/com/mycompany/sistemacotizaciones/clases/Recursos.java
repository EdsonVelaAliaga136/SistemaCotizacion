/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sistemacotizaciones.clases;

import java.io.Serializable;

/**
 *
 * @author Usuario
 */
public class Recursos implements Serializable{
        //atributos
    private String url;
    private String nombreEnlace;
    private String estado;
    //constructor

    public Recursos() {
        url="";        
        nombreEnlace="";
        estado="";
    }
    //getter y setter

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }    

    public String getNombreEnlace() {
        return nombreEnlace;
    }

    public void setNombreEnlace(String nombreEnlace) {
        this.nombreEnlace = nombreEnlace;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
}
