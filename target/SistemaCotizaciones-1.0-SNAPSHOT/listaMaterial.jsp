<%@include file="header.jsp" %>
<jsp:useBean id="material" scope="session" class="com.mycompany.sistemacotizaciones.bean.MaterialBean" />
<%
    /*if (request.getParameter("registrar") != null) {
        
        out.print(mensaje);
    }*/
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
                    <h3 class="h4">Materiales</h3>
                </div>
                <div class="card-body">
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
                                <%= material.listarMaterial()%>                           
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
