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

        <link rel="stylesheet" type="text/css" href="resources/css/jquery.autocomplete.css" />
        <script src="resources/js/jsapi_google.js"></script> 
        <script>
            google.load("jquery", "1");
            /*
             var costoTotal = 0;
             //funcion para calcular el subtotal de cada producto y la suma total
             function modificar(codProducto) {
             
             var cantidad = document.getElementById('cant' + codProducto).value;
             var precioUnitario = document.getElementById('precioU' + codProducto).value;
             var stock = document.getElementById('stock' + codProducto).value;
             var precio = document.getElementById('pre' + codProducto).value;
             //mostrando por consola los datos
             console.log('Codigo: ' + codProducto);
             console.log('Cantidad: ' + cantidad);
             console.log('Precio Unitario: ' + precioUnitario);
             console.log('Stock: ' + stock);
             
             
             precio = precioUnitario * cantidad;
             costoTotal = (parseFloat(costoTotal) + parseFloat(precio));
             console.log('Costo Total: ' + costoTotal);
             document.getElementById('pre' + codProducto).value = precio;
             document.getElementById('resultado').value = costoTotal;
             
             
             }*/
        </script>
    </head>
    <body>
        <%!
            List<Material> lista;
            Material materialAct;
            Actividad actividadC;
        %>
        <jsp:useBean id="materialBean" scope="session" class="com.mycompany.sistemacotizaciones.bean.MaterialBean"/>


        <%

            if (session.getAttribute("listaMaterial") != null) {
                if (request.getParameter("agregarM") != null) {
                    String valor = request.getParameter("material");
                    //actividadC = actividad.buscarActividad(idM);
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

                } else {
                    System.out.println("VACIO");
                }
                if (request.getParameter("registrarMat") != null) {
                    String ms = materialBean.registrarMaterial(request);
                    System.out.println("Material registrado: " + ms);
                    request.setAttribute("registrarMat", null);
                }
            } else {
                //primera vez
                //instanciando la lista de tipo Productocompra
                //subiendo a session la lista de productos

                lista = new ArrayList<Material>();

                session.setAttribute("listaMaterial", lista);

            }
        %>

            <form method="POST" action="#" >
                <div class="col-lg-12">                           
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
                </div>
            </form>

        <script src="resources/js/jquery.autocomplete.js"></script>
        <script>
            $("#material").autocomplete("autocompleteMaterial.jsp");
        </script>                                         

        <script src="js/main.js"></script>
        <!-- JavaScript files-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/popper.js/umd/popper.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendor/chart.js/Chart.min.js"></script>
        <script src="js/charts-home.js"></script>
        <!-- Main File-->
        <script src="js/front.js"></script>
    </body>
</html>
