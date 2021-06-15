<%@include file="header.jsp" %>
<%! String salidaTabla = "";%>
<jsp:useBean id="empleado" scope="session" class="com.mycompany.sistemacotizaciones.bean.EmpleadoBean" />
<% if (request.getParameter("buscar") != null) {
        String nomDes = request.getParameter("nomEmp");
        salidaTabla = empleado.buscarEmpleado(nomDes);

    }
    if (request.getParameter("buscar1") != null) {
        String nomDes = request.getParameter("cod_emp");
        salidaTabla = empleado.buscarEmpleado(nomDes);

    }
%>
<div id="colorlib-page">
    <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
    <aside id="colorlib-aside" role="complementary" class="js-fullheight">
        <nav id="colorlib-main-menu" role="navigation">
            <ul>
                <li class="colorlib-active"><a href="index.jsp">Home</a></li>
                <li><a href="listarEmpleado.jsp">Listar Empleado</a></li>
                <li><a href="registrarEmpleado.jsp">Registrar Empleado</a></li>
                <li><a href="buscarEmpleado.jsp">Buscar Empleado</a></li>
            </ul>
        </nav>
    </aside> <!-- END COLORLIB-ASIDE -->

    <div id="colorlib-main">
        <section class="ftco-section pt-4 mb-5 ftco-intro">
            <div class="container-fluid px-3 px-md-0">
                <h1 class="h2">Buscar Empleado de Mano de obra</h1>
                <form method="POST">
                    <div class="row">
                        <div class="col-md-4 mb-4">

                            <div class="input-group mb-3">
                                <input type="text" name="nomEmp" class="form-control" placeholder="Buscar">
                                <div class="input-group-append">
                                    <button name="buscar" class="btn btn-info" type="submit">Go</button>
                                </div>
                            </div>                            
                        </div>

                    </div>
                    <div class="row">
                        <div class=" col-md-8 mb-4">
                            <div class="form-inline">
                                <label for="sel1" class="mr-1">Seleccione :</label>
                                <select class="form-control col-md-6" name="cod_emp">
                                    <%= empleado.listarProductoSelect()%>
                                </select>

                            </div>

                        </div>
                        <div class="col-md-2 mb-4">
                            <input class="btn btn-info form-control" type="submit" name="buscar1" value="Buscar" />
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-8">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Descripcion</th>
                                        <th>Unidad</th>
                                        <th>Precio productivo</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%= salidaTabla%>                           
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </div><!-- END COLORLIB-MAIN -->
</div><!-- END COLORLIB-PAGE -->

</section>



<%@include file="footer.jsp" %>
