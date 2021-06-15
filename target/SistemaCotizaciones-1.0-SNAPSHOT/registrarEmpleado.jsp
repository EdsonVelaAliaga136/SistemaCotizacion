<%@include file="header.jsp" %>
<jsp:useBean id="empleado" scope="session" class="com.mycompany.sistemacotizaciones.bean.EmpleadoBean" />
<%
    if (request.getParameter("registrar") != null) {
        String mensaje = empleado.registrarEmpleado(request);
        out.print(mensaje);

        response.sendRedirect("listarEmpleado.jsp");
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
                <div class="row">
                    <div class="col-md-12 mb-4">
                        <h1 class="h2">Registrar Empleado</h1>

                    </div>
                    <div class="col-md-6">
                        <form method="POST">
                            <center>
                                <div class="form-group row">
                                    <label  class="col-sm-4 col-form-label">Descripcion:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="desc" placeholder="Cargo Empleado"  value="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Unidad de medida: </label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control"  placeholder="HR" name="uniMed"  value="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label  class="col-sm-4 col-form-label">Precio productivo : </label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" placeholder="0.00 Bs" name="preProd" value="">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-10">
                                        <input class="btn btn-info " type="submit" value="REGISTRAR" name="registrar" />
                                    </div>
                                </div>
                            </center>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div><!-- END COLORLIB-MAIN -->
</div><!-- END COLORLIB-PAGE -->

</section>



<%@include file="footer.jsp" %>
