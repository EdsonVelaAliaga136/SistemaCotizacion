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

<!-- Dashboard Counts Section-->
<section class="dashboard-counts no-padding-bottom">
    <div class="container-fluid">
        <div class="col-lg-8">
            <div class="card">
                <div class="card-close">
                    <div class="dropdown">
                        <button type="button" id="closeCard3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                        <div aria-labelledby="closeCard3" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                    </div>
                </div>
                <div class="card-header d-flex align-items-center">
                    <h3 class="h4">Buscar personal requerido</h3>
                </div>
                <div class="card-body">
                    <form method="POST">
                        <div class="row">                            
                            <div class=" col-md-8 mb-4">
                                <div class="form-inline">
                                    <label for="sel1" class="mr-1">Seleccione :</label>
                                    <select class="form-control col-md-8" name="cod_emp">
                                        <%= empleado.listarProductoSelect()%>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4 mb-4">
                                <input class="btn btn-info form-control" type="submit" name="buscar1" value="Buscar" />
                            </div>
                        </div>                        
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">                       
                                    <table class="table table-striped table-hover">
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
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="footer.jsp" %>
