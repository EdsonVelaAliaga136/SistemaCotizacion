<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.sistemacotizaciones.clases.Recursos"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Bootstrap Material Admin by Bootstrapious.com</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="robots" content="all,follow">
        <!-- Bootstrap CSS-->
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome CSS-->
        <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
        <!-- Fontastic Custom icon font-->
        <link rel="stylesheet" href="css/fontastic.css">
        <!-- Google fonts - Poppins -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
        <!-- theme stylesheet-->
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="css/custom.css">
        <!-- Favicon-->
        <!-- Tweaks for older IEs--><!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
        <%!
            //definiendo un objeto para recibir la lista de recursos
            List<Recursos> listaRecursos = new ArrayList<Recursos>();
            //List<Recursos> listaRecursos = new ArrayList<>()
        %>
    </head>
    <body>
        <jsp:useBean id="rolRecursoBean" scope="session" class="com.mycompany.sistemacotizaciones.bean.RolRecursoBean"/>
        <%
            String usuario = request.getUserPrincipal().getName();
            String rol = null;
            if (request.isUserInRole("ADMINISTRADOR")) {
                rol = "ADMINISTRADOR";
            }
            if (request.isUserInRole("CAJERO")) {
                rol = "CAJERO";
            }
            if (request.isUserInRole("ALMACEN")) {
                rol = "ALMACEN";
            }
        %>
        <div class="page">
            <!-- Main Navbar-->
            <header class="header">
                <nav class="navbar">
                    <!-- Search Box-->
                    <div class="search-box">
                        <button class="dismiss"><i class="icon-close"></i></button>
                        <form id="searchForm" action="#" role="search">
                            <input type="search" placeholder="What are you looking for..." class="form-control">
                        </form>
                    </div>
                    <div class="container-fluid">
                        <div class="navbar-holder d-flex align-items-center justify-content-between">
                            <!-- Navbar Header-->
                            <div class="navbar-header">
                                <!-- Navbar Brand --><a href="index.html" class="navbar-brand d-none d-sm-inline-block">
                                    <div class="brand-text d-none d-lg-inline-block"><span>Aqua </span><strong>Soft</strong></div>
                                    <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>BD</strong></div></a>
                                <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
                            </div>
                            <!-- Navbar Menu -->
                            <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">                                          
                                <!-- Logout    -->
                                <li class="nav-item"><a href="<%= request.getContextPath() + "/logout"%>" class="nav-link logout"> <span class="d-none d-sm-inline">Logout</span><i class="fa fa-sign-out"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </nav>

            </header>

            <div class="page-content d-flex align-items-stretch"> 
                <!-- Side Navbar -->
                <nav class="side-navbar">
                    <!-- Sidebar Header-->
                    <div class="sidebar-header d-flex align-items-center">
                        <div class="avatar"><img src="img/avatar-11.jpg" alt="..." class="img-fluid rounded-circle"></div>
                        <div class="title">
                            <h1 class="h4"><%=usuario%></h1>
                            <p><%= rol%></p>
                        </div>
                    </div>
                    <!-- Sidebar Navidation Menus--><span class="heading">Menu</span>
                    <%
                        //LLAMANDO AL METODO PARA OBTENER LOS RECURSOS
                        listaRecursos = rolRecursoBean.listaRecursos(rol);
                        String path = request.getContextPath();
                        if (rolRecursoBean != null) {
                            out.print("<ul class='list-unstyled'>");
                            for (Recursos recursos : listaRecursos) {
                                if (recursos.getEstado().equalsIgnoreCase("activo")) {
                                    
                                    out.print("<ul>");
                                    out.print(" <li><a href='"+path+recursos.getUrl()+"'>"+recursos.getNombreEnlace()+"</a></li>");
                                    out.print("</ul>");
                                }
                            }
                            out.print("</ul>");
                        }
                    %>
                    <!--<ul class="list-unstyled">
                        <li><a href="#usuario" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>Usuarios </a>
                            <ul id="usuario" class="collapse list-unstyled ">
                            </ul>
                        </li>
                        <li><a href="#proyecto" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>Proyectos</a>
                            <ul id="proyecto" class="collapse list-unstyled ">
                                <li><a href="registrarProyecto.jsp">Nuevo Proyecto</a></li>
                            </ul>
                        </li>
                        <li><a href="#manobra" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>Mano de Obra</a>
                            <ul id="manobra" class="collapse list-unstyled ">
                                <li><a href="registrarEmpleado.jsp">Registrar empleado</a></li>
                                <li><a href="buscarEmpleado.jsp">Buscar Empleado</a></li>
                                <li><a href="listarEmpleado.jsp">Listar Empleado</a></li>
                            </ul>
                        </li>
                        <li><a href="#materiales" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>Materiales </a>
                            <ul id="materiales" class="collapse list-unstyled ">
                                <li><a href="registrarMaterial.jsp">Registrar Material</a></li>
                                <li><a href="listaMaterial.jsp">Listar Material</a></li>
                            </ul>
                        </li>
                        <li><a href="#exampledropdownDropdown" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>Reportes </a>
                            <ul id="exampledropdownDropdown" class="collapse list-unstyled ">
                                <li><a href="reporteEmpleado">Reporte Empleado</a></li>
                                <li><a href="reporteCotizaacion">Reporte Cotizacion</a></li>
                            </ul>
                        </li>
                    </ul>-->
                </nav>
                <div class="content-inner">
                    <!-- Page Header-->
                    <header class="page-header">
                        <div class="container-fluid">
                            <h2 class="no-margin-bottom">Dashboard</h2>
                        </div>
                    </header>