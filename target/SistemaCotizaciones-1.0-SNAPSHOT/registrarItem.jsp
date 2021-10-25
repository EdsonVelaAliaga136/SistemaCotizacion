<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.sistemacotizaciones.clases.Item"%>
<%@include file="header.jsp" %>

<jsp:useBean id="proyecto" scope="session" class="com.mycompany.sistemacotizaciones.bean.ProyectoBean" />
<jsp:useBean id="item" scope="session" class="com.mycompany.sistemacotizaciones.bean.ItemBean"/>

<%!
    List<Item> lista;
    Item itemProyecto;
%>
<%
    String idPro = request.getParameter("idPro");
    proyecto.buscarProyecto(idPro);
    if (session.getAttribute("listaItems") != null) {
        if (request.getParameter("agregarItem") != null) {
            String idPros = request.getParameter("idPro");
            proyecto.buscarProyecto(idPros);
            String m = item.registrarItem(request);
            System.out.println(m);
            String idP = proyecto.getModificarProyecto().getIdProyecto() + "";
            System.out.println("idP= " + idP);
            List<Item> listaTemp = new ArrayList<Item>();
            listaTemp = item.listarItemDetI(idP);
            System.out.println();
            if (listaTemp != null) {
                //itemProyecto = item.buscarItem(idP);                
                lista = (List<Item>) session.getAttribute("listaItems");
                lista.clear();
                //lista.add(itemProyecto);
                for (Item i : listaTemp) {
                    lista.add(i);
                    System.out.println("----");
                }
                session.setAttribute("listaItems", lista);
            }else{
                System.out.println("Lista vacias");
            }

        } else {
            System.out.println("VACIO");
        }

    } else {
        //primera vez
        //instanciando la lista de tipo Productocompra
        //subiendo a session la lista de productos
        lista = new ArrayList<Item>();
        session.setAttribute("listaItems", lista);

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
                            <label for="inlineFormInput" style="width: 150px"><small class="help-block-none">Codigo de Proyecto</small></label>
                            <label for="inlineFormInput" style="width: 620px"><small class="help-block-none">Nombre del Proyecto</small></label>
                            <label for="inlineFormInput" style="width: 198px"><small class="help-block-none">Tipo de Moneda</small></label>
                        </div>
                        <div class="form-inline">
                            <div class="form-group">
                                <input id="inlineFormInput" type="text" style="width: 150px"  name="codProy" placeholder="PROY-0000" class="mr-3 form-control" value="<%=proyecto.getModificarProyecto().getCodProyecto()%>" readonly/>
                            </div>
                            <div class="form-group">                                
                                <input id="inlineFormInput" type="text" style="width: 620px"  name="nomPro" placeholder="NOMBRE PROYECTO" class="mr-3 form-control" value="<%=proyecto.getModificarProyecto().getNombre()%>" readonly/>
                            </div>
                            <% //out.print(proyecto.getModificarProyecto().getNombre());  %>
                            <div class="form-group">
                                <input id="inlineFormInputGroup" type="text" style="width: 150px"  placeholder="BOLIVIANOS" name="mon" class="mr-3 form-control" value="<%=proyecto.getModificarProyecto().getMoneda()%>"  readonly/>
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
                                <h4 id="exampleModalLabel" class="modal-title">Agregar Item</h4>
                                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
                            </div>
                            <div class="modal-body">
                                <p>Lorem ipsum dolor sit amet consectetur.</p>
                                <hr>                           

                                <form class="form-horizontal" method="POST" >

                                    <div class="form-group row">
                                        <label class="col-sm-3 form-control-label">Descripcón </label>
                                        <div class="col-sm-9">
                                            <input id="inputHorizontalSuccess" name="nombreItem" type="text" placeholder="Descripcion" class="form-control form-control-success">
                                        </div>
                                        <input type="hidden" name="idProyecto" value="<%=proyecto.getModificarProyecto().getIdProyecto()%>" />
                                    </div>                                    
                                    <div class="form-group row">       
                                        <div class="col-sm-9 offset-sm-3">
                                            <input type="submit" class="btn btn-success float-right" name="agregarItem" value="Agregar" >
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
                            <button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-sm btn-primary">Agregar Item </button>
                        </div>
                    </div>
                    <div class="card-header d-flex align-items-center">
                        <h3 class="h4">ITEM'S</h3>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">                       
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>DESCRIPCIÓN</th>  
                                        <th>CANTIDAD</th> 
                                        <th>SUB TOTAL</th> 
                                        <th></th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    <%                        // recupernado objeto de session
                                        List<Item> lista = (List<Item>) session.getAttribute("listaItems");
                                        float sumaTotal = 0f;
                                        int i = 0;
                                        if (lista != null) {
                                            for (Item itemP : lista) {
                                                i++;
                                                out.print("<tr>");
                                                out.print("<td>");
                                                out.print(i);
                                                out.print("</td>");
                                                out.print("<td>");
                                                out.print(itemP.getNombreItem());
                                                out.print("</td>");                                              
                                               
                                                out.print("<td>");

                                                out.print("<input type='text' autocomplete='off' id='cant"
                                                        + itemP.getIdItem()
                                                        + "' onblur='modificar(" + itemP.getIdItem() + ");' value = '"
                                                        + "' name='cant"
                                                        + itemP.getIdItem() + "' />");

                                                out.print("</td>");
                                                out.print("<td>");
                                                out.print("<input type='text' id='pre" + itemP.getIdItem() + "' readonly value='"
                                                        + itemP.getPrecioItem() + "' name='pre" + itemP.getIdItem() + "' />");
                                                out.print("</td>");
                                                out.print("<td>");
                                                out.print("<a href='registrarActividad.jsp?idItem=" + itemP.getIdItem() + "'>Agregar Actividades</a>");
                                                out.print("</td>");

                                                out.print("</tr>");
                                                sumaTotal = sumaTotal + itemP.getPrecioItem();
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
