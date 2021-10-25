/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.sistemacotizaciones.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Usuario
 */
public class VariableConexion {

    public static String URL_BBDD = "jdbc:postgresql://localhost:5433/BD_Sis_Cot_V2";
    public static String DRIVER_BBDD = "org.postgresql.Driver";
    public static String USER_BBDD = "postgres";
    public static String PASSWORD_BBDD = "Reinatanaka#1234";

    private Connection connection;

    public void inicioConexion() throws SQLException {
        try {
            Class.forName(DRIVER_BBDD);
            connection = DriverManager.getConnection(URL_BBDD, USER_BBDD, PASSWORD_BBDD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void cerrarConexion(){
        if(connection!= null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }
    
}
