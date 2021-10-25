/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.sistemacotizaciones.bean;

import com.mycompany.sistemacotizaciones.clases.Actividad;
import com.mycompany.sistemacotizaciones.conexion.VariableConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Usuario
 */
public class ActividadBean {

    private VariableConexion variableConexion;
    private Connection connection;
    private PreparedStatement ps;
    private ResultSet rs;
    private Actividad actModificar;
    private List<Actividad> listaActividad;

    public ActividadBean() throws SQLException {
        this.variableConexion = new VariableConexion();
        this.variableConexion.inicioConexion();
        this.connection = this.variableConexion.getConnection();
        System.out.println("Conectado");
    }

    @PreDestroy
    public void cerrarConexion() {
        this.variableConexion.cerrarConexion();
    }

    public String registrarActividad(HttpServletRequest request) {
        String mensaje = "";
        this.ps = null;
        if (request == null) {
            return "";
        }
        if (this.connection != null) {
            try {
                StringBuilder query = new StringBuilder();
                query.append(" INSERT INTO actividades ");
                query.append(" VALUES(nextval('sec_cat'),?,?,?,?) ");
                if (this.ps == null) {
                    this.ps = this.connection.prepareStatement(query.toString());
                }
                String idIt = request.getParameter("idItem");
                String des_act = request.getParameter("descAct");
                String uni_act = request.getParameter("uniAct");
                String cant_act = request.getParameter("catAct");

                this.ps.setInt(1, Integer.parseInt(idIt));
                this.ps.setString(2, des_act);
                this.ps.setString(3, uni_act);
                this.ps.setInt(4, Integer.parseInt(cant_act));

                int registro = this.ps.executeUpdate();
                if (registro == 1) {
                    mensaje = "Registro realizado con exito";
                } else {
                    mensaje = "Error al insertar registro";
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return mensaje;

    }
    //listar

    public String listarActi() {
        StringBuilder salidaTable = new StringBuilder();
        StringBuilder query = new StringBuilder();
        query.append(" SELECT * ");
        query.append(" FROM actividades ");
        try {
            this.ps = this.connection.prepareStatement(query.toString());
            this.rs = this.ps.executeQuery();
            while (this.rs.next()) {
                salidaTable.append("<tr>");
                salidaTable.append("<td>");
                salidaTable.append(this.rs.getString(3));
                salidaTable.append("</td>");
                salidaTable.append("<td>");
                salidaTable.append(this.rs.getString(4));
                salidaTable.append("</td>");
                salidaTable.append("<td>");
                salidaTable.append(this.rs.getInt(5));
                salidaTable.append("</td>");
                salidaTable.append("<td>");
                salidaTable.append("<a href=modificarActividad.jsp?cod=").append(rs.getInt(1)).append(">Modificar</a>");

                salidaTable.append("</td>");

                salidaTable.append("<td>");
                salidaTable.append("<a href=modificarActividad.jsp?cod=").append(rs.getInt(1)).append(">Eliminar</a>");

                salidaTable.append("</td>");
                salidaTable.append("</tr>");

            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error de conexion");
        }
        return salidaTable.toString();
    }

    public Actividad buscarActividad(String cod) {
        Actividad actividad = null;

        try {
            StringBuilder query = new StringBuilder();
            query.append(" SELECT * ");
            query.append(" FROM actividades ");
            query.append(" WHERE id_act = ? ");
            this.ps = this.connection.prepareStatement(query.toString());
            this.ps.setInt(1, Integer.parseInt(cod));
            ResultSet res = this.ps.executeQuery();
            if (res != null && res.next()) {
                actividad = new Actividad();
                actividad.setIdAct(res.getInt(1));
                actividad.setIdItem(res.getInt(2));
                actividad.setNombreAct(res.getString(3));
                actividad.setUniMedAct(res.getString(4));
                actividad.setCantAct(res.getInt(5));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return actividad;
    }

    public List<Actividad> listarActividadDetI(String idItem) {
        this.listaActividad = new ArrayList<>();

        StringBuilder query = new StringBuilder();
        query.append(" SELECT * ");
        query.append(" FROM actividades ");
        query.append(" WHERE id_item = ? ");
        try {
            this.ps = this.connection.prepareStatement(query.toString());
            System.out.println(idItem);
            this.ps.setInt(1, Integer.parseInt(idItem));
            this.rs = this.ps.executeQuery();

            while (this.rs.next()) {
                this.actModificar = new Actividad();
                this.actModificar.setIdAct(this.rs.getInt(1));
                this.actModificar.setIdItem(this.rs.getInt(2));
                this.actModificar.setNombreAct(this.rs.getString(3));
                this.actModificar.setUniMedAct(this.rs.getString(4));
                this.actModificar.setCantAct(this.rs.getInt(5));
                this.listaActividad.add(this.actModificar);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error de conexion");
        }
        return this.listaActividad;
    }

}
