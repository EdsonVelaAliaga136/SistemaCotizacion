/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.sistemacotizaciones.bean;

import com.mycompany.sistemacotizaciones.clases.ActividadMaterial;
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
public class ActividadMaterialBean {

    private VariableConexion variableConexion;
    private Connection connection;
    private PreparedStatement ps;
    private ResultSet rs;
    private ActividadMaterial actividadMaterialModificar;
    private List<ActividadMaterial> lisActividadMaterials;

    public ActividadMaterialBean() throws SQLException {
        this.variableConexion = new VariableConexion();
        this.variableConexion.inicioConexion();
        this.connection = this.variableConexion.getConnection();
        System.out.println("Conectado");
    }

    @PreDestroy
    public void cerrarConexion() {
        this.variableConexion.cerrarConexion();
    }

    public String registrarActMat(String idAct, String idMat, String cant) {
        String mensaje = "";
        this.ps = null;
        if (this.connection != null) {
            try {
                StringBuilder query = new StringBuilder();
                query.append(" INSERT INTO materiales ");
                query.append(" VALUES(nextval('sec_mats'),?,?,?) ");
                if (this.ps == null) {
                    this.ps = this.connection.prepareStatement(query.toString());
                }

                this.ps.setInt(1, Integer.parseInt(idAct));
                this.ps.setInt(2, Integer.parseInt(idMat));
                this.ps.setInt(3, Integer.parseInt(cant));

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

    public String listarActMat() {
        StringBuilder salidaTable = new StringBuilder();
        StringBuilder query = new StringBuilder();
        query.append(" SELECT * ");
        query.append(" FROM materiales ");
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
                salidaTable.append("<a href=modificarActMat.jsp?cod=").append(rs.getInt(1)).append(">Modificar</a>");

                salidaTable.append("</td>");

                salidaTable.append("<td>");
                salidaTable.append("<a href=modificarActMat.jsp?cod=").append(rs.getInt(1)).append(">Eliminar</a>");

                salidaTable.append("</td>");
                salidaTable.append("</tr>");

            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error de conexion");
        }
        return salidaTable.toString();
    }

    public ActividadMaterial buscarActividadMaterial(String cod) {
        ActividadMaterial actividadMaterial = null;

        try {
            StringBuilder query = new StringBuilder();
            query.append(" SELECT * ");
            query.append(" FROM materiales ");
            query.append(" WHERE id_mats = ? ");
            this.ps = this.connection.prepareStatement(query.toString());
            this.ps.setInt(1, Integer.parseInt(cod));
            ResultSet res = this.ps.executeQuery();
            if (res != null && res.next()) {
                actividadMaterial = new ActividadMaterial();
                actividadMaterial.setId_act(res.getInt(1));
                actividadMaterial.setId_mat(res.getInt(2));
                actividadMaterial.setCant_mat(res.getInt(3));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return actividadMaterial;
    }

    public List<ActividadMaterial> listarActividadDetI(String idAct) {
        this.lisActividadMaterials = new ArrayList<>();

        StringBuilder query = new StringBuilder();
        query.append(" SELECT * ");
        query.append(" FROM materiales ");
        query.append(" WHERE id_act = ? ");
        try {
            this.ps = this.connection.prepareStatement(query.toString());
            System.out.println(idAct);
            this.ps.setInt(1, Integer.parseInt(idAct));
            this.rs = this.ps.executeQuery();

            while (this.rs.next()) {
                this.actividadMaterialModificar = new ActividadMaterial();
                this.actividadMaterialModificar.setId_mats(this.rs.getInt(1));
                this.actividadMaterialModificar.setId_act(this.rs.getInt(2));
                this.actividadMaterialModificar.setId_mat(this.rs.getInt(3));
                this.actividadMaterialModificar.setCant_mat(this.rs.getInt(4));
                this.lisActividadMaterials.add(this.actividadMaterialModificar);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error de conexion");
        }
        return this.lisActividadMaterials;
    }

    public ActividadMaterial getActividadMaterialModificar() {
        return actividadMaterialModificar;
    }

    public void setActividadMaterialModificar(ActividadMaterial actividadMaterialModificar) {
        this.actividadMaterialModificar = actividadMaterialModificar;
    }

    public List<ActividadMaterial> getLisActividadMaterials() {
        return lisActividadMaterials;
    }

    public void setLisActividadMaterials(List<ActividadMaterial> lisActividadMaterials) {
        this.lisActividadMaterials = lisActividadMaterials;
    }
}
