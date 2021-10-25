<%@include file="header.jsp" %>
<jsp:useBean id="proyecto" scope="session" class="com.mycompany.sistemacotizaciones.bean.ProyectoBean" />
<%
    if (request.getParameter("registrarProyecto") != null) {
        String mensaje = proyecto.registrarProyecto(request);
        out.print(mensaje);
        String idProy = proyecto.obtenerUltimoProyecto();

        response.sendRedirect("registrarItem.jsp?idPro=" + idProy);
    }
%>


<!-- Dashboard Counts Section-->
<section class="dashboard-counts no-padding-bottom">

    <div class="container-fluid">        
        <div class="col-lg-12">                           
            <div class="card">
                <div class="card-close">

                </div>
                <div class="card-header d-flex align-items-center">
                    <h3 class="h4">Proyecto</h3>
                </div>
                <div class="card-body">
                    <form class="form-inline" method="POST">
                        <div class="form-group">
                            <label for="inlineFormInput" style="width: 150px"><small class="help-block-none">Codigo de Proyecto</small></label>
                            <label for="inlineFormInput" style="width: 620px"><small class="help-block-none">Nombre del Proyecto</small></label>
                            <label for="inlineFormInput" style="width: 198px"><small class="help-block-none">Tipo de Moneda</small></label>
                        </div>
                        
                        <div class="form-group">                            
                            <input id="inlineFormInput" style="width: 150px"  type="text" name="codProy" placeholder="PROY-0000" class="mr-3 form-control">
                        </div>
                        <div class="form-group">
                            <input id="inlineFormInputGroup" style="width: 620px"  type="text" placeholder="Nombre Proyecto" name="nomPro" class="mr-3 form-control">
                        </div>
                        <div class="form-group">                            
                            <input id="inlineFormInputGroup" style="width: 150px"  type="text" placeholder="BOLIVIANOS" name="mon" class="mr-3 form-control">
                        </div>
                        <div class="container-fluid"> 
                            <br>
                            <div class="form-group float-right">
                                <input type="submit" value="REGISTRAR" name="registrarProyecto" class=" btn btn-primary">
                            </div>
                        </div > 
                    </form>
                </div>
            </div>
        </div>

    </div>
</section>

<%@include file="footer.jsp" %>
