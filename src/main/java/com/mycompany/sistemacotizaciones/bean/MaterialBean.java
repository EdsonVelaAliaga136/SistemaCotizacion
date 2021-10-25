/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.sistemacotizaciones.bean;

import com.mycompany.sistemacotizaciones.clases.Material;
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
public class MaterialBean {

    private Connection connection;
    private VariableConexion variable;
    private PreparedStatement ps;
    private ResultSet rs;
    private Material materialModificar;
    private PreparedStatement psModificar;

    public MaterialBean() throws SQLException {
        this.variable = new VariableConexion();
        this.variable.inicioConexion();
        this.connection = this.variable.getConnection();
        System.out.println("Connection succesfully");
    }

    @PreDestroy
    public void cerrarConexion() {
        this.variable.cerrarConexion();
    }

    public String registrarMaterial(HttpServletRequest request) {
        String mensaje = "";
        this.ps = null;
        if (request == null) {
            return "";
        }
        if (this.connection != null) {
            try {
                StringBuilder query = new StringBuilder();
                query.append(" INSERT INTO material ");
                query.append(" VALUES(nextval('sec_mat'),?,?,?) ");
                if (this.ps == null) {
                    this.ps = this.connection.prepareStatement(query.toString());
                }
                String descripcion = request.getParameter("desc");
                String uniMed = request.getParameter("uniMed");
                double precUni = Double.parseDouble(request.getParameter("preProd"));

                this.ps.setString(1, descripcion);
                this.ps.setString(2, uniMed);
                this.ps.setDouble(3, precUni);

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
    public List<String> getMaterial(String nombre) {
        List<String> listaMaterial = new ArrayList<>();

        try {
            //obteniendo la lista de los materiales
            StringBuilder query = new StringBuilder();

            query.append(" select m.id_mat || ' ' ||  m.desc_mat ");
            query.append(" from material m ");
            query.append(" where lower(m.desc_mat) like ");
            query.append("lower('");
            query.append(nombre);
            query.append("%')");

            PreparedStatement pst = connection.prepareStatement(query.toString());
            ResultSet resultado = pst.executeQuery();
            while (resultado.next()) {
                listaMaterial.add(resultado.getString(1));
                System.out.println("pos: " + resultado.getString(1));
            }
        } catch (SQLException e) {
            System.out.println("Error de conexion");
            e.printStackTrace();
        }
        return listaMaterial;
    }

     public String listarMaterialSelect() {
        StringBuilder salidaTabla = new StringBuilder();
        StringBuilder query = new StringBuilder();
        query.append(" select m.id_mat, m.desc_mat ");
        query.append(" from material m ");
        try {
            PreparedStatement pst = connection.prepareStatement(query.toString());
            ResultSet resultado = pst.executeQuery();
            while (resultado.next()) {
                salidaTabla.append("<option value='");
                salidaTabla.append(resultado.getInt(1));
                salidaTabla.append("'>");
                salidaTabla.append(resultado.getString(2));
                salidaTabla.append("</option>");
                System.out.println(resultado.getString(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return salidaTabla.toString();
    }

    //modificarMaterial
    public String modificarMaterial(HttpServletRequest request, String codMat) {
        String mensaje = "";
        if (request == null) {
            return "";
        }
        if (this.connection != null) {
            try {
                StringBuilder query = new StringBuilder();
                query.append(" UPDATE material ");
                query.append(" SET desc_mat = ?, uni_med_mat = ? ,prec_uni_mat = ? ");
                query.append(" WHERE id_mat = ? ");

                if (this.psModificar == null) {
                    this.psModificar = this.connection.prepareCall(query.toString());
                }
                String desc = request.getParameter("desc");
                String uniMed = request.getParameter("uni");
                double prec = Double.parseDouble(request.getParameter("prec"));
                int idMat = Integer.parseInt(codMat);
                
                this.psModificar.setString(1, desc);
                this.psModificar.setString(2, uniMed);
                this.psModificar.setDouble(3, prec);
                this.psModificar.setInt(4, idMat);
                
                int reg = this.psModificar.executeUpdate();
                if (reg == 1) {
                    mensaje = "Modificacion correcta";
                } else {
                    mensaje = "Error al ejecutar el update";
                }

            } catch (SQLException e) {
                System.out.println("Error al ejecutar el update");
                e.printStackTrace();
            }
        }
        return mensaje;
    }

    //listar
    public String listarMaterial() {
        StringBuilder salidaTable = new StringBuilder();
        StringBuilder query = new StringBuilder();
        query.append(" SELECT * ");
        query.append(" FROM material ");
        try {
            this.ps = this.connection.prepareStatement(query.toString());
            this.rs = this.ps.executeQuery();
            while (this.rs.next()) {
                salidaTable.append("<tr>");
                salidaTable.append("<td>");
                salidaTable.append(this.rs.getString(2));
                salidaTable.append("</td>");

                salidaTable.append("<td>");
                salidaTable.append(this.rs.getString(3));
                salidaTable.append("</td>");

                salidaTable.append("<td>");
                salidaTable.append(this.rs.getDouble(4));
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

    public Material buscarMaterial(String cod) {
        this.materialModificar=new Material();       

        try {
            StringBuilder query = new StringBuilder();
            query.append(" SELECT * ");
            query.append(" FROM material ");
            query.append(" WHERE id_mat = ? ");
            this.ps = this.connection.prepareStatement(query.toString());
            this.ps.setInt(1, Integer.parseInt(cod));
            ResultSet res = this.ps.executeQuery();
            if (res.next()) {
                this.materialModificar=new Material(); 
                this.materialModificar.setId_mat(res.getInt(1));
                this.materialModificar.setDesc_mat(res.getString(2));
                this.materialModificar.setUni_med_mat(res.getString(3));
                this.materialModificar.setPrec_uni_mat(res.getDouble(4));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return this.materialModificar;
    }

    public Material getMaterialModificar() {
        return materialModificar;
    }

    public void setMaterialModificar(Material materialModificar) {
        this.materialModificar = materialModificar;
    }
    
}
