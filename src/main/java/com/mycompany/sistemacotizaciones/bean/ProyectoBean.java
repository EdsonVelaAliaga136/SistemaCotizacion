/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.sistemacotizaciones.bean;

import com.mycompany.sistemacotizaciones.clases.Proyecto;
import com.mycompany.sistemacotizaciones.conexion.VariableConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Usuario
 */
public class ProyectoBean {

    private VariableConexion variableConexion;
    private Connection connection;
    private PreparedStatement ps;
    private ResultSet rs;
    private Proyecto modificarProyecto;

    public ProyectoBean() throws SQLException {
        this.variableConexion = new VariableConexion();
        this.variableConexion.inicioConexion();
        this.connection = this.variableConexion.getConnection();
        System.out.println("Conectado");
    }

     @PreDestroy
    public void cerrarConexion() {
        this.variableConexion.cerrarConexion();
    }

    public String registrarProyecto(HttpServletRequest request) {
        String mensaje = "";
        if (this.connection == null) {
            return "";
        }
        try {                        
            StringBuilder query = new StringBuilder();
            query.append(" INSERT INTO proyectos ");
            query.append(" VALUES(nextval('sec_proy'),? ,? ,?) ");            
            if (this.ps == null) {
                this.ps = this.connection.prepareStatement(query.toString());
            }            
            String cod_proy = request.getParameter("codProy");
            String nombre= request.getParameter("nomPro");
            String moneda = request.getParameter("mon");
            
            System.out.println(cod_proy);
            System.out.println(nombre);
            System.out.println(moneda);
            
            this.ps.setString(1, cod_proy);
            this.ps.setString(2, nombre);
            this.ps.setString(3, moneda);
            
            int reg =this.ps.executeUpdate();
            if(reg == 1){
                mensaje = "Registro realizado con exito";
            }else{
                mensaje = "Error al insertar registro";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mensaje;
    }
     public void buscarProyecto(String cod) {
        this.modificarProyecto=new Proyecto();       

        try {
            StringBuilder query = new StringBuilder();
            query.append(" SELECT * ");
            query.append(" FROM proyectos ");
            query.append(" WHERE id_proyecto = ? ");
            this.ps = this.connection.prepareStatement(query.toString());
            this.ps.setInt(1, Integer.parseInt(cod));
            ResultSet res = this.ps.executeQuery();
            if (res.next()) {
                this.modificarProyecto.setIdProyecto(res.getInt(1));
                this.modificarProyecto.setCodProyecto(res.getString(2));
                this.modificarProyecto.setNombre(res.getString(3));
                this.modificarProyecto.setMoneda(res.getString(4));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     public String obtenerUltimoProyecto() {
        this.modificarProyecto=new Proyecto();       
        String idProyectoMax="";
        try {
            StringBuilder query = new StringBuilder();
            query.append(" SELECT MAX(id_proyecto) ");
            query.append(" FROM proyectos ");
            this.ps = this.connection.prepareStatement(query.toString());
            ResultSet res = this.ps.executeQuery();
            if (res.next()) {
                idProyectoMax=res.getInt(1)+"";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return idProyectoMax;
    }

    public Proyecto getModificarProyecto() {
        return modificarProyecto;
    }

    public void setModificarProyecto(Proyecto modificarProyecto) {
        this.modificarProyecto = modificarProyecto;
    }
     
}
