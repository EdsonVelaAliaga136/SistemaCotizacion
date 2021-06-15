/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.sistemacotizaciones.bean;

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
public class EmpleadoBean {

    private Connection conection;
    private VariableConexion variable;
    private PreparedStatement ps;
    private ResultSet rs;

    public EmpleadoBean() throws SQLException {
        this.variable = new VariableConexion();
        this.variable.inicioConexion();
        this.conection = this.variable.getConnection();
        System.out.println("Se inicio la conexion");
    }

    @PreDestroy
    public void cerrarConexion() {
        this.variable.cerrarConexion();
    }

    public String registrarEmpleado(HttpServletRequest request) {
        String mensaje = "";
        ps=null;
        if (request == null) {
            return "REQUEST VACIO";
        }
        if (this.conection != null) {
            try {
                StringBuilder query = new StringBuilder();
                query.append(" INSERT INTO empleado ");
                query.append(" VALUES (nextval('sec_emp'),?,?,?)");

                if (ps == null) {
                    ps = conection.prepareStatement(query.toString());
                }

                String descripcion = request.getParameter("desc");
                String unidadMedida = request.getParameter("uniMed");
                String precioProdEmp = request.getParameter("preProd");
                
                ps.setString(1, descripcion);
                ps.setString(2, unidadMedida);
                ps.setDouble(3, Double.parseDouble(precioProdEmp));
                
                int registro = ps.executeUpdate();
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
   

    public  String listarEmpleado() {
        StringBuilder salidaTabla = new StringBuilder();
        StringBuilder query = new StringBuilder();
        query.append(" SELECT  e.des_emp, e.uni_med_emp, e.prec_prod_emp ");
        query.append(" FROM empleado  e ");
        try {
            ps = this.conection.prepareStatement(query.toString());
            rs = ps.executeQuery();

            while (rs.next()) {
                salidaTabla.append("<tr>");
                salidaTabla.append("<td>");
                salidaTabla.append(rs.getString(1));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(rs.getString(2));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(rs.getDouble(3));
                salidaTabla.append("</td>");                
                salidaTabla.append("</tr>");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error de conexion");
        }
        return salidaTabla.toString();
    }

    public String buscarEmpleado(String emp) {
         StringBuilder salidaTabla = new StringBuilder();
        StringBuilder query = new StringBuilder();
        query.append(" SELECT  e.des_emp, e.uni_med_emp, e.prec_prod_emp ");
        query.append(" FROM empleado  e ");
        query.append(" WHERE e.des_emp = ? ");
        try {
            ps = this.conection.prepareStatement(query.toString());
            ps.setString(1, emp);
            rs = ps.executeQuery();

            while (rs.next()) {
                salidaTabla.append("<tr>");
                salidaTabla.append("<td>");
                salidaTabla.append(rs.getString(1));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(rs.getString(2));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(rs.getDouble(3));
                salidaTabla.append("</td>");                
                salidaTabla.append("</tr>");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error de conexion");
        }
        return salidaTabla.toString();
    }
    
    public String listarProductoSelect(){
        StringBuilder salidaTabla=new StringBuilder();
        StringBuilder query= new StringBuilder();
        query.append(" SELECT e.des_emp ");
        query.append(" FROM empleado e ");
        try{
            ps=conection.prepareStatement(query.toString());
            rs=ps.executeQuery();
            while (rs.next()) {                
                salidaTabla.append("<option value = '");
                salidaTabla.append(rs.getString(1));
                salidaTabla.append("'>");
                salidaTabla.append(rs.getString(1));
                salidaTabla.append("</option>");
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return salidaTabla.toString();
    }
}
