
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <title>Sistema COVEFAR</title>
    </head>
    <body>
        <br>
        <br>
        <div class="container">
            <div id="layout">
                <center>
                    <div class="card" style="width: 50rem;">
                        <!--<img src="imagenes/logo.png" class="img-fluid card-img-top"> -->
                        <div class="card-body" id="loginTable">
                            <form method="POST" action="j_security_check" name="j_security_check">
                                <div class="form-group">
                                    <label class="loginLabel"> Usuario</label>
                                    <input type="text" class="form-control" id="" aria-describedby="emailHelp" name="j_username">
                                    <small id="emailHelp" class="form-text text-muted">Ingrese su nombre de usuario.</small>
                                </div>
                                <div class="form-group">
                                    <label class="loginLabel">Contrase??a</label>
                                    <input type="password" class="form-control" id="" name="j_password">
                                </div>

                                <button type="submit" class="btn btn-primary">Iniciar Sesion</button>
                            </form>
                        </div>
                    </div>
                </center>
            </div>
        </div>
    </body>
</html>

