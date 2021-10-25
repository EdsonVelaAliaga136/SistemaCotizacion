<%-- 
    Document   : autocompleteProductos
    Created on : 17-08-2021, 05:52:05 PM
    Author     : Melissa Ibañez Lopez
--%>

<%@page import="com.mycompany.sistemacotizaciones.bean.MaterialBean"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    System.out.println("Ingrese a listar");
    MaterialBean materialBean = (MaterialBean) session.getAttribute("materialBean");
    //se esta obteniendo el parametro enviado por autocomplete, el nombre del parametro q no debe ser cambiado
    String material = request.getParameter("q");

    List<String> lista = materialBean.getMaterial(material);
    for(String a: lista){
        System.out.println("Lista----->:"+ a);
    }
    System.out.println("Lista: " + (lista == null ? "NULL" : lista.size()));

    if (lista != null && lista.size() > 0) {
        for (String nomMaterial : lista) {
            out.println(nomMaterial);
        }
    }
    System.out.println("Despues de listar");
%>
