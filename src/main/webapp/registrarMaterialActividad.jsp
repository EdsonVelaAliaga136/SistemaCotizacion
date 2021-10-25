<%@page import="com.mycompany.sistemacotizaciones.clases.Material"%>
<%@page import="com.mycompany.sistemacotizaciones.clases.Material"%>
<%@page import="com.mycompany.sistemacotizaciones.clases.Actividad"%>
<%@page import="com.mycompany.sistemacotizaciones.clases.ActividadMaterial"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.sistemacotizaciones.clases.Item"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <link rel="shortcut icon" href="img/favicon.ico">
        <!-- Tweaks for older IEs--><!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
        <link rel="stylesheet" type="text/css" href="resources/css/jquery.autocomplete.css" />
        <script src="resources/js/jsapi_google.js"></script> 
        <script>
            google.load("jquery", "1");

            var costoTotal = 0;
            //funcion para calcular el subtotal de cada producto y la suma total
            function modificar(codMaterial) {

                var cantidad = document.getElementById('cant' + codMaterial).value;
                var precioUnitario = document.getElementById('precioU' + codMaterial).value;
                var precio = document.getElementById('pre' + codMaterial).value;
                //mostrando por consola los datos
                console.log('Codigo: ' + codMaterial);
                console.log('Cantidad: ' + cantidad);
                console.log('Precio Unitario: ' + precioUnitario);


                precio = precioUnitario * cantidad;
                costoTotal = (parseFloat(costoTotal) + parseFloat(precio));
                console.log('Costo Total: ' + costoTotal);
                document.getElementById('pre' + codMaterial).value = precio;
                document.getElementById('resultado').value = costoTotal;

            }
        </script>
    </head>
    <body>
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
                                <!-- Search-->
                                <li class="nav-item d-flex align-items-center"><a id="search" href="#"><i class="icon-search"></i></a></li>
                                <!-- Notifications-->
                                <li class="nav-item dropdown"> <a id="notifications" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fa fa-bell-o"></i><span class="badge bg-red badge-corner">12</span></a>
                                    <ul aria-labelledby="notifications" class="dropdown-menu">
                                        <li><a rel="nofollow" href="#" class="dropdown-item"> 
                                                <div class="notification">
                                                    <div class="notification-content"><i class="fa fa-envelope bg-green"></i>You have 6 new messages </div>
                                                    <div class="notification-time"><small>4 minutes ago</small></div>
                                                </div></a></li>                    
                                    </ul>
                                </li>
                                <!-- Messages                        -->
                                <li class="nav-item dropdown"> <a id="messages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fa fa-envelope-o"></i><span class="badge bg-orange badge-corner">10</span></a>
                                    <ul aria-labelledby="notifications" class="dropdown-menu">
                                        <li><a rel="nofollow" href="#" class="dropdown-item d-flex"> 
                                                <div class="msg-profile"> <img src="img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
                                                <div class="msg-body">
                                                    <h3 class="h5">Jason Doe</h3><span>Sent You Message</span>
                                                </div></a></li>                    
                                    </ul>
                                </li>                
                                <!-- Logout    -->
                                <li class="nav-item"><a href="login.html" class="nav-link logout"> <span class="d-none d-sm-inline">Logout</span><i class="fa fa-sign-out"></i></a></li>
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
                            <h1 class="h4">Mark Stephen</h1>
                            <p>Web Designer</p>
                        </div>
                    </div>
                    <!-- Sidebar Navidation Menus--><span class="heading">Menu</span>
                    <ul class="list-unstyled">
                        <li><a href="#usuario" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>Usuarios </a>
                            <ul id="usuario" class="collapse list-unstyled ">
                                <li><a href="#">Page</a></li>
                                <li><a href="#">Page</a></li>
                                <li><a href="#">Page</a></li>
                            </ul>
                        </li>
                        <li><a href="#proyecto" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>Proyectos</a>
                            <ul id="proyecto" class="collapse list-unstyled ">
                                <li><a href="registrarProyecto.jsp">Nuevo Proyecto</a></li>
                                <li><a href="#">Page</a></li>
                                <li><a href="#">Page</a></li>
                            </ul>
                        </li>
                        <li><a href="#manobra" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>Mano de Obra</a>
                            <ul id="manobra" class="collapse list-unstyled ">
                                <li><a href="registrarEmpleado.jsp">Registrar empleado</a></li>
                                <li><a href="buscarEmpleado.jsp">Buscar Empleado</a></li>
                                <li><a href="listarEmpleado.jsp">Listar Empleado</a></li>
                            </ul>
                        </li>
                        <li><a href="#mate" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>Materiales </a>
                            <ul id="mate" class="collapse list-unstyled ">
                                <li><a href="registrarMaterial.jsp">Registrar Material</a></li>
                                <li><a href="listaMaterial.jsp">Listar Material</a></li>
                                <li><a href="#">Plus</a></li>
                            </ul>
                        </li>
                        <li><a href="#exampledropdownDropdown" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>Example dropdown </a>
                            <ul id="exampledropdownDropdown" class="collapse list-unstyled ">
                                <li><a href="#">Page</a></li>
                                <li><a href="#">Page</a></li>
                                <li><a href="#">Page</a></li>
                            </ul>
                        </li>
                        <li><a href="login.html"> <i class="icon-interface-windows"></i>Login page </a></li>
                    </ul><span class="heading">CONFIGURACIONES</span>
                    <ul class="list-unstyled">
                        <li> <a href="#"> <i class="icon-flask"></i>Demo </a></li>
                        <li> <a href="#"> <i class="icon-screen"></i>Demo </a></li>
                        <li> <a href="#"> <i class="icon-mail"></i>Demo </a></li>
                        <li> <a href="#"> <i class="icon-picture"></i>Demo </a></li>
                    </ul>
                </nav>
                <div class="content-inner">
                    <!-- Page Header-->
                    <header class="page-header">
                        <div class="container-fluid">
                            <h2 class="no-margin-bottom">Dashboard</h2>
                        </div>
                    </header>

                    <jsp:useBean id="actividadmaterialbean" scope="session" class="com.mycompany.sistemacotizaciones.bean.ActividadMaterialBean"/>
                    <jsp:useBean id="materialBean" scope="session" class="com.mycompany.sistemacotizaciones.bean.MaterialBean"/>
                    <jsp:useBean id="item" scope="session" class="com.mycompany.sistemacotizaciones.bean.ItemBean"/>
                    <jsp:useBean id="actividad" scope="session" class="com.mycompany.sistemacotizaciones.bean.ActividadBean"/>
                    <jsp:useBean id="proyecto" scope="session" class="com.mycompany.sistemacotizaciones.bean.ProyectoBean" />

                    <%!
                        List<Material> lista;
                        Material materialAct;
                        Actividad actividadC;
                        String idAct;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         %>
                    <%
                        System.out.println("llega 1");

                        if (request.getParameter("idAct") != null) {
                            idAct = request.getParameter("idAct");
                            actividadC = new Actividad();
                            actividadC = actividad.buscarActividad(idAct);
                        }

                        if (session.getAttribute("listaMaterial") != null) {

                            if (request.getParameter("agregarM") != null) {
                                String valor = request.getParameter("material");
                                if (valor != null && valor.length() > 0) {
                                    String codigo = valor.substring(0, valor.indexOf(" "));
                                    String nombre = valor.substring(valor.indexOf(" "));

                                    System.out.print("codigo : " + codigo);
                                    System.out.print("producto: " + nombre);

                                    // TODO: llamar a BBDD pára recuperar datos del formulario
                                    materialAct = materialBean.buscarMaterial(codigo);

                                    // recupernado objeto de session
                                    lista = (List<Material>) session.getAttribute("listaMaterial");
                                    // agregando objeto producto a la lista de producto recuperado de session                     
                                    lista.add(materialAct);
                                    // actualizando objeto en sesion
                                    session.setAttribute("listaMaterial", lista);
                                }
                            }

                            if (request.getParameter("idMateriaE") != null) {

                                String idmate = request.getParameter("idMateriaE");
                                // recupernado objeto de session
                                List<Material> lista = (List<Material>) session.getAttribute("listaMaterial");
                                List<Material> listaTemporal = new ArrayList<Material>();

                                for (Material mate : lista) {
                                    String cadId = mate.getId_mat() + "";
                                    if (!cadId.equals(idmate)) {
                                        listaTemporal.add(mate);
                                    }
                                }
                                // actualizar lista en sesion
                                session.setAttribute("listaMaterial", listaTemporal);
                            }
                            if (request.getParameter("registrarMaterialesActividad") != null) {
                                
                                // recupernado objeto de session
                                List<Material> lista = (List<Material>) session.getAttribute("listaMaterial");
                                String cantidad, precio;
                                System.out.println(lista.size());
                                for (Material materia : lista) {
                                    
                                    //rescatando los datos de cantidad y precio calculado del producto
                                    cantidad = request.getParameter("cant" + materia.getId_mat());
                                    precio = request.getParameter("pre" + materia.getId_mat());
                                    System.out.print("cantidad: " + cantidad);
                                    System.out.print("precio: " + precio);
                                    if (cantidad != null) {
                                        try {
                                            materia.setCantidad(Integer.parseInt(cantidad));
                                            materia.setCostoTotal(Float.parseFloat(precio));
                                            System.out.println("Materia: " + materia.getId_mat());
                                            String idActividadA = session.getAttribute("idActividadActual").toString();
                                            System.out.println("idAct:"+idActividadA);
                                            String idMaterialA = materia.getId_mat() + "";
                                            String cantidadMaterialA = materia.getCantidad() + "";
                                            System.out.println("idA: " + idActividadA);
                                            System.out.println("idM: " + idMaterialA);
                                            System.out.println("cant: " + cantidadMaterialA);
                                            String mens = actividadmaterialbean.registrarActMat(idActividadA, idMaterialA, cantidadMaterialA);
                                            System.out.println("mensaje registrar matAct" + mens);
                                            Actividad a = new Actividad();

                                            a = actividad.buscarActividad(idActividadA);
                                            System.out.println("idItem: " + a.getIdItem() + "");
                                            
                                            //response.sendRedirect("registrarActividad.jsp?idItem=" + a.getIdItem() + "");
                                        } catch (NumberFormatException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                    /*if (precio != null) {
                                        try {
                                            materia.setCostoTotal(Float.parseFloat(precio));

                                        } catch (NumberFormatException e) {
                                            e.printStackTrace();
                                        }

                                    }*/

                                }
                                //lista = (List<Material>) session.getAttribute("listaMaterial");
                                //lista.clear(); // actualizando lista de la sesion
                                session.setAttribute("listaMaterial", lista);
                            }

                            if (request.getParameter("registrarMat") != null) {
                                System.out.println("Material : registrando");
                                String ms = materialBean.registrarMaterial(request);
                                System.out.println("Material registrado: " + ms);
                                //request.setAttribute("registrarMat", null);
                                System.out.println("Material : registrando");
                            }

                        } else {
                            System.out.println("llega 3");
                            //primera vez
                            //instanciando la lista de tipo Productocompra
                            //subiendo a session la lista de productos
                            idAct = request.getParameter("idAct");

                            session.setAttribute("idActividadActual", idAct);
                            lista = new ArrayList<Material>();

                            session.setAttribute("listaMaterial", lista);

                            actividadC = new Actividad();
                            actividadC = actividad.buscarActividad(idAct);
                            session.setAttribute("actividadActual", actividadC);
                            System.out.println("llega");
                        }
                    %>


                    <!-- Dashboard Counts Section-->
                    <section class="dashboard-counts no-padding-bottom">

                        <div class="container-fluid">        
                            <div class="col-lg-12">                           
                                <div class="card">
                                    <div class="card-close">
                                        <div class="dropdown">
                                            <button type="button" id="closeCard3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>

                                        </div>
                                    </div>
                                    <div class="card-header d-flex align-items-center">
                                        <h3 class="h4">Materiales</h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-inline">
                                            <div class="form-group">
                                                <label for="inlineFormInput" style="width: 150px"><small class="help-block-none">Actividad</small></label>
                                                <label for="inlineFormInput" style="width: 620px"><small class="help-block-none">Descripcion</small></label>
                                                <label for="inlineFormInput" style="width: 198px"><small class="help-block-none">Item</small></label>
                                            </div>
                                            <div class="form-inline">
                                                <div class="form-group">
                                                    <input id="inlineFormInput" type="text" style="width: 150px"  name="idItemF" placeholder="" class="mr-3 form-control" value="<%=actividadC.getIdAct()%>" readonly/>
                                                </div>
                                                <div class="form-group">                                
                                                    <input id="inlineFormInput" type="text" style="width: 620px"  name="nomItem" placeholder="DESCRIPCION" class="mr-3 form-control" value="<%=actividadC.getNombreAct()%>" readonly/>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <input id="inlineFormInputGroup" type="text" style="width: 150px"  placeholder="COD-PROY000" name="codProy" class="mr-3 form-control" value="<%=actividadC.getIdItem()%>"  readonly/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <form method="POST" action="#" >
                                <div class="card">
                                    <!-- Modal-->
                                    <div id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" class="modal fade text-left">
                                        <div role="document" class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 id="exampleModalLabel" class="modal-title">Agregar Material</h4>
                                                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Lorem ipsum dolor sit amet consectetur.</p>
                                                    <hr>                           

                                                    <div class="form-horizontal" >

                                                        <div class="form-group row">
                                                            <label class="col-sm-3 form-control-label">Descripción </label>
                                                            <div class="col-sm-9">
                                                                <input id="inputHorizontalSuccess" name="desc" type="text" placeholder="Descripcion" class="form-control form-control-success">
                                                            </div>
                                                            <input type="hidden" name="idProyecto" value="" />
                                                        </div>  
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 form-control-label">Unidad de Medida</label>
                                                            <div class="col-sm-9">
                                                                <input id="inputHorizontalSuccess"  name="uniMed" type="text" placeholder="Unidad de medida" class="form-control form-control-success">
                                                            </div>
                                                            <input type="hidden" name="idProyecto" value="" />
                                                        </div>    
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 form-control-label">Precio Productivo</label>
                                                            <div class="col-sm-9">
                                                                <input id="inputHorizontalSuccess" name="preProd" type="text" placeholder="Cantidad" class="form-control form-control-success">
                                                            </div>
                                                            <input type="hidden" name="idProyecto" value="" />
                                                        </div>
                                                        <div class="form-group row"> 
                                                            <div class="col-sm-9 offset-sm-3">
                                                                <input type="submit" class="btn btn-success float-right" name="registrarMat" value="Agregar" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>



                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-close">
                                                <div class="dropdown">
                                                    <button  type="button" data-toggle="modal" data-target="#myModal" class="btn btn-sm btn-primary">Registrar Material </button>
                                                </div>

                                            </div>
                                            <div class="card-header d-flex align-items-center">
                                                <h3 class="h4">MATERIALES</h3>

                                            </div>
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <table border="1">
                                                        <thead>
                                                            <tr>
                                                                <th colspan="2" >Agregar Material  </th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>Nombre Material </td>
                                                                <td><input type="text" name="material" id="material" /></td>
                                                            </tr>
                                                            <tr>

                                                                <td><input type="submit" value="Agregar" id="agregarM" name="agregarM" />   </td>                                                              
                                                                <td><input type="reset" value="Limpiar" /></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <table class="table table-striped table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>DESCRIPCIÓN</th>  
                                                                <th>UNIDAD</th>

                                                                <th>PRECIO UNITARIO</th>
                                                                <th>CANTIDAD</th>
                                                                <th>SUBTOTAL</th> 
                                                                <th>Accion</th> 
                                                            </tr>
                                                        </thead>
                                                        <tbody>

                                                            <%

                                                                // recupernado objeto de session
                                                                List<Material> listaM = (List<Material>) session.getAttribute("listaMaterial");
                                                                float sumaTotal = 0f;
                                                                int i = 0;
                                                                if (lista != null) {
                                                                    for (Material mat : listaM) {
                                                                        i++;
                                                                        out.print("<tr>");

                                                                        out.print("<td>");
                                                                        out.print(i);
                                                                        out.print("</td>");

                                                                        out.print("<td>");
                                                                        out.print(mat.getDesc_mat());
                                                                        out.print("</td>");

                                                                        out.print("<td>");
                                                                        out.print(mat.getUni_med_mat());
                                                                        out.print("</td>");

                                                                        out.print("<td>");
                                                                        out.print("<input type='text' style='width: 150px' id='precioU" + mat.getId_mat() + "' readonly value='"
                                                                                + mat.getPrec_uni_mat() + "' name='precioU" + mat.getId_mat() + "' />");
                                                                        out.print("</td>");

                                                                        out.print("<td>");
                                                                        out.print("<input type='text' autocomplete='off' id='cant"
                                                                                + mat.getId_mat() + "' onblur='modificar(" + mat.getId_mat() + ");' value = '"
                                                                                + mat.getCantidad() + "' name='cant"
                                                                                + mat.getId_mat() + "' />");
                                                                        out.print("</td>");

                                                                        out.print("<td>");
                                                                        out.print("<input type='text' id='pre" + mat.getId_mat() + "' readonly value='"
                                                                                + mat.getCostoTotal() + "' name='pre" + mat.getId_mat() + "' />");
                                                                        out.print("</td>");

                                                                        out.print("<td>");
                                                                        out.print("<a href='registrarMaterialActividad.jsp?idMateriaE=" + mat.getId_mat() + "'>Eliminar</a>");
                                                                        out.print("</td>");

                                                                        out.print("</tr>");
                                                                        sumaTotal = sumaTotal + mat.getCostoTotal();
                                                                    }
                                                                }
                                                            %>
                                                            <tr>
                                                                <td colspan="5" align='right'>Precio Total</td>
                                                                <td><input autocomplete="off" type="text" id="resultado" name="subtotalMateriales" readonly value="<%=sumaTotal%>" /></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="7" align="center">
                                                                    <input type="submit" value="Terminar Seleccion" id="registrarProducto" name="registrarMaterialesActividad" />
                                                                </td>    
                                                            </tr>

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </section>
                    <script src="resources/js/jquery.autocomplete.js"></script>
                    <script>
            $("#material").autocomplete("autocompleteMaterial.jsp");
                    </script>

                    <!-- Page Footer-->
                    <footer class="main-footer">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-sm-6">
                                    <p>Your company &copy; 2017-2020</p>
                                </div>
                                <div class="col-sm-6 text-right">
                                    <p>Design by <a href="https://bootstrapious.com/p/admin-template" class="external">Bootstrapious</a></p>
                                    <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
                                </div>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>
        </div>
        <!-- <script src="js/jquery.min.js"></script>
        <script src="js/main.js"></script>
        <script src="vendor/jquery/jquery.min.js"></script>-->
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <!-- JavaScript files-->
        <script src="vendor/popper.js/umd/popper.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendor/jquery.cookie/jquery.cookie.js"></script>
        <script src="vendor/chart.js/Chart.min.js"></script>
        <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
        <script src="js/charts-home.js"></script>
        <!-- Main File-->
        <script src="js/front.js"></script>
    </body>
</html>
