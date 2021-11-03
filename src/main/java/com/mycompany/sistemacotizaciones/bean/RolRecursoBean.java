/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sistemacotizaciones.bean;


import com.mycompany.sistemacotizaciones.clases.Recursos;
import com.mycompany.sistemacotizaciones.conexion.VariableConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PreDestroy;

public class RolRecursoBean {

    private Connection connection;
    private VariableConexion variable;

    public RolRecursoBean() throws SQLException {
        variable = new VariableConexion();
        variable.inicioConexion();
        connection = variable.getConnection();
        System.out.println("iniciando la conexion");
    }

    @PreDestroy
    public void cerrarConexion() {
        variable.cerrarConexion();
    }
    public List<Recursos> listaRecursos(String rol){
        List<Recursos> listaRecursos=new ArrayList<>();
        Recursos recurso=null;
        StringBuilder query=new StringBuilder();
        query.append(" select r.url,r.texto,r.estado ");
        query.append(" from recursos r ");
        query.append(" inner join rol_rec rr on rr.cod_rec=r.cod_rec ");
        query.append(" inner join rol ro on ro.cod_rol=rr.cod_rol ");
        query.append(" where ro.nombre_rol=? ");
        try {
            PreparedStatement st=connection.prepareStatement(query.toString());
            st.setString(1, rol);
            ResultSet resultado=st.executeQuery();
            while(resultado.next()){
                recurso=new Recursos();
                recurso.setUrl(resultado.getString(1));                
                recurso.setNombreEnlace(resultado.getString(2));
                recurso.setEstado(resultado.getString(3));
                listaRecursos.add(recurso);
            }
        } catch (SQLException e) {
            System.out.println("Error de conexion");
            e.printStackTrace();
        }
        return listaRecursos;
    }

}