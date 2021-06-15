<%@include file="header.jsp" %>
<jsp:useBean id="empleado" scope="session" class="com.mycompany.sistemacotizaciones.bean.EmpleadoBean" />
<%
    if (request.getParameter("registrar") != null) {
        String mensaje = empleado.registrarEmpleado(request);
        out.print(mensaje);
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
                        <h1 class="h2">Mano de obra</h1>

                    </div>
                    <div class="col-md-6">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Descripcion</th>
                                    <th>Unidad</th>
                                    <th>Precio productivo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%= empleado.listarEmpleado()%>                           
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </div><!-- END COLORLIB-MAIN -->
</div><!-- END COLORLIB-PAGE -->

</section>



<%@include file="footer.jsp" %>
