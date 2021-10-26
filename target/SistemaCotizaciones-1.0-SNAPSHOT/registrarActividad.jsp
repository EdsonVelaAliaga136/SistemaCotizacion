<%@page import="com.mycompany.sistemacotizaciones.clases.Actividad"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.sistemacotizaciones.clases.Item"%>
<%@include file="header.jsp" %>


<jsp:useBean id="proyecto" scope="session" class="com.mycompany.sistemacotizaciones.bean.ProyectoBean" />
<jsp:useBean id="material" scope="session" class="com.mycompany.sistemacotizaciones.bean.MaterialBean"/>
<jsp:useBean id="item" scope="session" class="com.mycompany.sistemacotizaciones.bean.ItemBean"/>
<jsp:useBean id="actividad" scope="session" class="com.mycompany.sistemacotizaciones.bean.ActividadBean"/>

<%!
    List<Actividad> lista;
    Actividad actividadItem;
    Item itemC;
    Long codCotFac=0L;
%>
<%
    String idIte = request.getParameter("idItem");
    itemC = new Item();
    itemC = item.buscarItem(idIte);
    List<Actividad> listaTemp = new ArrayList<Actividad>();
    listaTemp = actividad.listarActividadDetI(itemC.getIdItem() + "");
    if (listaTemp != null) {
        lista = new ArrayList<Actividad>();
        session.setAttribute("listaActividad", lista);
        //itemProyecto = item.buscarItem(idP);                
        lista = (List<Actividad>) session.getAttribute("listaActividad");
        lista.clear();
        //lista.add(itemProyecto);
        for (Actividad a : listaTemp) {
            lista.add(a);
            System.out.println("----");
        }
        session.setAttribute("listaActividad", lista);
    }
    if (session.getAttribute("listaActividad") != null) {
        if (request.getParameter("agregarA") != null) {
            String idI = request.getParameter("idItem");
            itemC = item.buscarItem(idI);
            String m = actividad.registrarActividad(request);
            System.out.println(m);

            listaTemp = new ArrayList<Actividad>();
            listaTemp = actividad.listarActividadDetI(itemC.getIdItem() + "");
            System.out.println();
            if (listaTemp != null) {
                //itemProyecto = item.buscarItem(idP);                
                lista = (List<Actividad>) session.getAttribute("listaActividad");
                lista.clear();
                //lista.add(itemProyecto);
                for (Actividad a : listaTemp) {
                    lista.add(a);
                    System.out.println("----");
                }
                session.setAttribute("listaActividad", lista);
            } else {
                System.out.println("Lista vacias");
            }

        } else {
            System.out.println("VACIO");
        }

    } else {
        //primera vez
        //instanciando la lista de tipo Productocompra
        //subiendo a session la lista de productos

        lista = new ArrayList<Actividad>();
        session.setAttribute("listaActividad", lista);

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
                    <h3 class="h4">Proyecto</h3>
                </div>
                <div class="card-body">
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="inlineFormInput" style="width: 150px"><small class="help-block-none">Item</small></label>
                            <label for="inlineFormInput" style="width: 620px"><small class="help-block-none">Descripcion</small></label>
                            <label for="inlineFormInput" style="width: 198px"><small class="help-block-none">Proyecto</small></label>
                        </div>
                        <div class="form-inline">
                            <div class="form-group">
                                <input id="inlineFormInput" type="text" style="width: 150px"  name="idItemF" placeholder="" class="mr-3 form-control" value="<%=itemC.getIdItem()%>" readonly/>
                            </div>
                            <div class="form-group">                                
                                <input id="inlineFormInput" type="text" style="width: 620px"  name="nomItem" placeholder="DESCRIPCION" class="mr-3 form-control" value="<%=itemC.getNombreItem()%>" readonly/>
                            </div>
                            <% //out.print(proyecto.getModificarProyecto().getNombre());  %>
                            <div class="form-group">
                                <input id="inlineFormInputGroup" type="text" style="width: 150px"  placeholder="COD-PROY000" name="codProy" class="mr-3 form-control" value="<%=itemC.getIdProy()%>"  readonly/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-close">                    
                <!-- Modal-->
                <div id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" class="modal fade text-left">
                    <div role="document" class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 id="exampleModalLabel" class="modal-title">Agregar Actividad</h4>
                                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
                            </div>
                            <div class="modal-body">
                                <p>Lorem ipsum dolor sit amet consectetur.</p>
                                <hr>                           

                                <form class="form-horizontal" method="POST" >

                                    <div class="form-group row">
                                        <label class="col-sm-3 form-control-label">Descripción </label>
                                        <div class="col-sm-9">
                                            <input id="inputHorizontalSuccess" name="descAct" type="text" placeholder="Descripcion" class="form-control form-control-success">
                                        </div>
                                        <input type="hidden" name="idProyecto" value="" />
                                    </div>  
                                    <div class="form-group row">
                                        <label class="col-sm-3 form-control-label">Unidad </label>
                                        <div class="col-sm-9">
                                            <input id="inputHorizontalSuccess"  name="uniAct" type="text" placeholder="Unidad de medida" class="form-control form-control-success">
                                        </div>
                                        <input type="hidden" name="idProyecto" value="" />
                                    </div>    
                                    <div class="form-group row">
                                        <label class="col-sm-3 form-control-label">Cantidad</label>
                                        <div class="col-sm-9">
                                            <input id="inputHorizontalSuccess" name="catAct" type="text" placeholder="Cantidad" class="form-control form-control-success">
                                        </div>
                                        <input type="hidden" name="idProyecto" value="" />
                                    </div>
                                    <div class="form-group row"> 
                                        <div class="col-sm-9 offset-sm-3">
                                            <input type="submit" class="btn btn-success float-right" name="agregarA" value="Agregar" >
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <div class="col-lg-12">
                <div class="card">
                    <div class="card-close">
                        <div class="dropdown">                            
                            <button  type="button" data-toggle="modal" data-target="#myModal" class="btn btn-sm btn-primary">Agregar Actividad </button>
                        </div>

                    </div>
                    <div class="card-header d-flex align-items-center">
                        <h3 class="h4">ACTIVIDADES</h3>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">                       
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>DESCRIPCIÓN</th>  
                                        <th>UNIDAD</th>
                                        <th>CANTIDAD</th>
                                        <th>COSTO TOTAL</th> 
                                        <th></th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    <%                        // recupernado objeto de session
                                        List<Actividad> lista = (List<Actividad>) session.getAttribute("listaActividad");
                                        float sumaTotal = 0f;
                                        int i = 0;
                                        if (lista != null) {
                                            for (Actividad actI : lista) {
                                                i++;
                                                out.print("<tr>");
                                                out.print("<td>");
                                                out.print(i);
                                                out.print("</td>");
                                                out.print("<td>");
                                                out.print(actI.getNombreAct());
                                                out.print("</td>");

                                                out.print("<td>");
                                                out.print("<input type='text' style='width: 150px' id='" + actI.getIdAct() + "' readonly value='"
                                                        + actI.getUniMedAct() + "' name='pre" + actI.getIdAct() + "' />");
                                                out.print("</td>");

                                                out.print("<td>");
                                                out.print("<input type='text' style='width: 150px' id='" + actI.getIdAct() + "' readonly value='"
                                                        + actI.getCantAct() + "' name='cant" + actI.getIdAct() + "' />");
                                                out.print("</td>");

                                                out.print("<td>");
                                                out.print("<input type='text' style='width: 150px' id='" + actI.getIdAct() + "' readonly value='"
                                                        + actI.getCostoAct() + "' name='pre" + actI.getIdAct() + "' />");
                                                out.print("</td>");

                                                out.print("<td>");
                                                out.print("<a href='registrarMaterialActividad.jsp?idAct=" + actI.getIdAct() + "'>Agregar Material</a>");
                                                out.print("</td>");

                                                out.print("</tr>");
                                                sumaTotal = sumaTotal + actI.getIdAct();
                                            }
                                        }
                                    %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>

</section>


<%@include file="footer.jsp" %>
