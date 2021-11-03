/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sistemacotizaciones.bean;

/**
 *
 * @author Usuario
 */

import com.mycompany.sistemacotizaciones.conexion.VariableConexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.annotation.PreDestroy;

public class RolBean {

    private VariableConexion variable;
    private Connection connection;
    //constructor

    public RolBean() throws SQLException {
        variable = new VariableConexion();
        variable.inicioConexion();
        connection = variable.getConnection();
        System.out.println("Iniciando conexion");
    }

    @PreDestroy
    public void cerrarConexion() {
        variable.cerrarConexion();
        System.out.println("Cerrando conexion");
    }

    public String listarRolSelect() {
        StringBuilder salidaTabla = new StringBuilder();
        StringBuilder query = new StringBuilder();
        query.append(" select r.cod_rol,r.nombre_rol ");
        query.append(" from rol r ");
        try {
            Statement st=connection.createStatement();
            ResultSet resultado=st.executeQuery(query.toString());
            while(resultado.next()){
                salidaTabla.append("<option value='");
                salidaTabla.append(resultado.getInt(1));
                salidaTabla.append("'>");
                salidaTabla.append(resultado.getString(2));
                salidaTabla.append("</option>");
            }
        } catch (SQLException e) {
            System.out.println("Error de conexion");
            e.printStackTrace();
        }
        return salidaTabla.toString();
    }
    
}