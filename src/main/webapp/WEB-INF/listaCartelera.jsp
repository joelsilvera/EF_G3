<%--
  Created by IntelliJ IDEA.
  User: joels
  Date: 12/07/2022
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>

<%@page import="java.util.ArrayList"%>
<%@ page import="Beans.Cartelera" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="listaCartelera" type="java.util.ArrayList<Beans.Cartelera>" scope="request" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="https://cdn-icons.flaticon.com/png/512/3223/premium/3223018.png?token=exp=1657648681~hmac=087611660cd778d1b2cee44987cb9493">
        <title>Cartelera</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <div class='container'>

            <div class="row mb-5 mt-4">
                <div class="col-lg-6">
                    <h1 class=''>Cartelera</h1>
                </div>
                <div class="col-lg-6 my-auto text-lg-right">
                    <a href="<%= request.getContextPath()%>/CarteleraServlet?action=agregar" class="btn btn-primary">Agregar nueva funcion</a>
                </div>
            </div>
            <table class="table">
                <thead>
                    <tr>
                        <th>Cadena</th>
                        <th>Cine</th>
                        <th>Pelicula</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%

                        for (Cartelera c : listaCartelera) {
                    %>
                    <tr>
                        <td><%= c.getCine().getCadena().getNombreComercial()%></td>
                        <td><%= c.getCine().getNombre()%></td>
                        <td><%=c.getPelicula().getNombre()%>-
                            <%if(c.getTresD()==1){%>
                            3d
                            <%}%>
                            <%if(c.getSubtitulada()==1){%>
                            Subtitulada
                            <%}%>
                            <%if(c.getDoblada()==1){%>
                            Doblada
                            <%}%>

                        </td>
                        <%}%>
                    </tr>

                </tbody>


            </table>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        </div>
    </body>
</html>
