<%@include file="header.jsp" %>
<jsp:useBean id="empleado" scope="session" class="com.mycompany.sistemacotizaciones.bean.EmpleadoBean" />
<%
    if (request.getParameter("registrar") != null) {
        String mensaje = empleado.registrarEmpleado(request);
        out.print(mensaje);

        response.sendRedirect("listarEmpleado.jsp");
    }
%>

<!-- Dashboard Counts Section-->
<section class="dashboard-counts no-padding-bottom">
    <div class="container-fluid">
        <div class="col-lg-8">
            <div class="card">
                <div class="card-close">
                    <div class="dropdown">
                        <button type="button" id="closeCard2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                        <div aria-labelledby="closeCard2" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                    </div>
                </div>
                <div class="card-header d-flex align-items-center">
                    <h3 class="h4">Registrar Empleado</h3>
                </div>
                <div class="card-body">

                    <form class="form-horizontal" method="POST">
                        <div class="form-group row">
                            <label class="col-sm-3 form-control-label">Descripcion:</label>
                            <div class="col-sm-9">
                                <input id="inputHorizontalSuccess" type="text"  name="desc" placeholder="Cargo Empleado" class="form-control form-control-success">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 form-control-label">Unidad de medida:</label>
                            <div class="col-sm-9">
                                <input id="inputHorizontalWarning" type="text" placeholder="HR" name="uniMed"  class="form-control form-control-warning">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 form-control-label">Precio productivo :</label>
                            <div class="col-sm-9">
                                <input id="inputHorizontalWarning" type="text" placeholder="0.00 Bs" name="preProd" class="form-control form-control-warning">
                            </div>
                        </div>
                        <div class="form-group row">       
                            <div class="col-sm-9 offset-sm-3">
                                <input type="submit" value="REGISTRAR" name="registrar" class="btn btn-primary">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>      
    </div>
</section>

<%@include file="footer.jsp" %>
