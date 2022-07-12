package Servlet;

import Beans.Empleado;
import Daos.DaoEmpleado;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "login" : request.getParameter("action");
        switch (action) {
            case "login":
                String inputUsuario = request.getParameter("inputEmail");
                String inputPassword = request.getParameter("inputPassword");
                DaoEmpleado empleadoDao= new DaoEmpleado();
                Empleado empleado = empleadoDao.validarEmpleado(inputUsuario, inputPassword);

                if(empleado!=null){
                    HttpSession session =request.getSession();
                    session.setAttribute("empleadoSession", empleado);

                    String rol = empleado.getRoles().get(0).getNombre();


                    if ("vendedor".equals(rol)) {
                        response.sendRedirect(request.getContextPath() + "/CarteleraServlet?action=lista");
                    } else if ("gestor".equals(rol)) {
                        response.sendRedirect(request.getContextPath() + "/CarteleraServlet?action=lista");
                    } else if ("admin".equals(rol)) {
                        response.sendRedirect(request.getContextPath() + "/");
                    }
                }else{
                    response.sendRedirect(request.getContextPath()+"/LoginServlet?error");
                }
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion")!=null?
                request.getParameter("accion"): "login";
        HttpSession session = request.getSession();
        switch (accion){
            case "login":
                Empleado empleado = (Empleado) session.getAttribute("empleado");
                if(empleado!= null){
                    response.sendRedirect(request.getContextPath()+"/EmpleadoServlet");
                }
                request.setAttribute("employeeSession", empleado);
                request.setAttribute("rol", session.getAttribute("rol"));
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "logout":

                session.invalidate();
                response.sendRedirect(request.getContextPath()+"/EmployeeServlet");
                break;


        }

    }
}
