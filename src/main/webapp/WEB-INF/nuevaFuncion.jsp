<%--
  Created by IntelliJ IDEA.
  User: joels
  Date: 12/07/2022
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="Beans.Pelicula" %>
<%@ page import="Beans.Cine" %>
<jsp:useBean id="listaPeliculas" type="java.util.ArrayList<Beans.Pelicula>" scope="request"/>
<jsp:useBean id="listaCines" type="java.util.ArrayList<Beans.Cine>" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="https://cdn-icons.flaticon.com/png/512/3223/premium/3223018.png?token=exp=1657648681~hmac=087611660cd778d1b2cee44987cb9493">
        <title>Añadir Nueva Funcion</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <div class='container'>

            <div class="row mb-4">
                <div class="col"></div>
                <div class="col-md-6">
                    <h1 class='mb-3'>Nueva funcion</h1>
                    <hr>
                    <form method="POST" action="<%=request.getContextPath()%>/CarteleraServlet?action=agregarFuncion">

                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Selecciona pelicula</label>
                            <select class="form-control" id="exampleFormControlSelect1" name="idPelicula">
                                <%for(Pelicula pelicula : listaPeliculas){%>
                                <option value="<%=pelicula.getIdPelicula()%>"><%=pelicula.getNombre()%></option>
                                <%}%>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Selecciona cine</label>
                            <select class="form-control" id="exampleFormControlSelect2" name="idCine">
                                <%for(Cine cine : listaCines){%>
                                <option value="<%=cine.getIdCine()%>"><%=cine.getNombre()%></option>
                                <%}%>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="3d">¿3D?</label>
                            <input type="text" class="form-control form-control-sm" id="3d" name="3d">
                            <small id="Help1" class="form-text text-muted">Ingrese 1 si es 3D y 0 si no es 3D</small>
                        </div>

                        <div class="form-group">
                            <label for="doblada">¿doblada o subtitulada?</label>
                            <input type="text" class="form-control form-control-sm" id="doblada" name="doblada">
                            <small id="Help2" class="form-text text-muted">Ingrese 1 si es doblada y 0 si es subtitulada</small>
                        </div>

                        <div class="form-group">
                            <label for="horario">Horario</label>
                            <input type="text" class="form-control form-control-sm" id="horario" name="horario">
                        </div>

                        <a href="#" class="btn btn-danger">Cancelar</a>
                        <button type="submit" value="Guardar" class="btn btn-primary"/>
                    </form>
                </div>
                <div class="col"></div>
            </div>
        </div>
    </body>
</html>
