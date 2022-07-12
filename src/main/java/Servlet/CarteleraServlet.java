package Servlet;

import Beans.Cartelera;
import Beans.Empleado;
import Daos.DaoCartelera;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CarteleraServlet", value = "/CarteleraServlet")
public class CarteleraServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");

        RequestDispatcher view;
        Cartelera cartelera = new Cartelera();
        String rol = (String) request.getSession().getAttribute("rol");


        switch (action){
            case "agregarFuncion":

                String idPelicula = request.getParameter("idPelicula");
                String idCine = request.getParameter("idCine");
                String tresD = request.getParameter("3d");
                String doblada = request.getParameter("doblada");
                String horario = request.getParameter("horario");

                DaoCartelera carteleraDao = new DaoCartelera();
                carteleraDao.guardarFuncion(Integer.parseInt(idPelicula), Integer.parseInt(idCine),
                        Integer.parseInt(tresD), Integer.parseInt(doblada), horario);
                response.sendRedirect(""); //TODO: agregar sendredirect

                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");

        RequestDispatcher view;

        DaoCartelera carteleraDao = new DaoCartelera();
        Empleado empleado = (Empleado) request.getSession().getAttribute("empleadoSession");
        switch (action) {
            case "lista":
                request.setAttribute("listaCartelera", carteleraDao.listaCartelera(empleado.getCine().getIdCine()));
                view = request.getRequestDispatcher("listaCartelera.jsp");
                view.forward(request, response);
                break;
            case "agregarNuevaFuncion":
                request.setAttribute("listaPeliculas", carteleraDao.obtenerListaPeliculas());
                request.setAttribute("listaCines", carteleraDao.obtenerListaCines());
                view = request.getRequestDispatcher("nuevaFuncion.jsp");
                view.forward(request, response);
                break;
        }

    }
}
