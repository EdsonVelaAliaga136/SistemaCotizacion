/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.sistemacotizaciones.bean;

import com.mycompany.sistemacotizaciones.clases.Item;
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
public class ItemBean {
     private VariableConexion variableConexion;
    private Connection connection;
    private PreparedStatement ps;
    private ResultSet rs;
    private Item itemModificar;
    private List<Item> listaItem;

    public ItemBean() throws SQLException {
        this.variableConexion = new VariableConexion();
        this.variableConexion.inicioConexion();
        this.connection = this.variableConexion.getConnection();
        System.out.println("Conectado");
    }
    @PreDestroy
    public void cerrarConexion() {
        this.variableConexion.cerrarConexion();
    }
    
     public String registrarItem(HttpServletRequest request) {
        String mensaje = "";
        this.ps = null;
        if (request == null) {
            return "";
        }
        if (this.connection != null) {
            try {
                StringBuilder query = new StringBuilder();
                query.append(" INSERT INTO item ");
                query.append(" VALUES(nextval('sec_mat'),?,?) ");
                if (this.ps == null) {
                    this.ps = this.connection.prepareStatement(query.toString());
                }
                String id = request.getParameter("idProyecto");
                String nombre = request.getParameter("nombreItem");

                this.ps.setInt(1, Integer.parseInt(id));
                this.ps.setString(2, nombre);

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
    public String listarItem() {
        StringBuilder salidaTable = new StringBuilder();
        StringBuilder query = new StringBuilder();
        query.append(" SELECT * ");
        query.append(" FROM item ");
        try {
            this.ps = this.connection.prepareStatement(query.toString());
            this.rs = this.ps.executeQuery();
            while (this.rs.next()) {
                salidaTable.append("<tr>");
                salidaTable.append("<td>");
                salidaTable.append(this.rs.getString(3));
                salidaTable.append("</td>");
                salidaTable.append("<td>");
                salidaTable.append("<a href=modificarMaterial.jsp?cod=").append(rs.getInt(1)).append(">Modificar</a>");

                salidaTable.append("</td>");

                salidaTable.append("<td>");
                salidaTable.append("<a href=modificarMaterial.jsp?cod=").append(rs.getInt(1)).append(">Eliminar</a>");

                salidaTable.append("</td>");
                salidaTable.append("</tr>");

            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error de conexion");
        }
        return salidaTable.toString();
    }
     public Item buscarItem(String cod) {
        Item item=null;      

        try {
            StringBuilder query = new StringBuilder();
            query.append(" SELECT * ");
            query.append(" FROM item ");
            query.append(" WHERE id_item = ? ");
            this.ps = this.connection.prepareStatement(query.toString());
            this.ps.setInt(1, Integer.parseInt(cod));
            ResultSet res = this.ps.executeQuery();
            if (res != null && res.next()) {
                item=new Item();
                item.setIdItem(res.getInt(1));
                item.setIdProy(res.getInt(2));
                item.setNombreItem(res.getString(3));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return item;
    }
     public List<Item> listarItemDetI(String idProy) {
        this.listaItem=new ArrayList<>();
       
        StringBuilder query = new StringBuilder();
        query.append(" SELECT * ");
        query.append(" FROM item ");
        query.append(" WHERE id_proyecto = ? ");
        try {
            this.ps = this.connection.prepareStatement(query.toString());
            this.ps.setInt(1, Integer.parseInt(idProy));
            this.rs = this.ps.executeQuery();
            
            while (this.rs.next()) {
                this.itemModificar=new Item();
                this.itemModificar.setIdItem(this.rs.getInt(1));
                this.itemModificar.setIdProy(this.rs.getInt(2));
                this.itemModificar.setNombreItem(this.rs.getString(3));
                this.listaItem.add(itemModificar);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error de conexion");
        }
        return this.listaItem;
    }
}
