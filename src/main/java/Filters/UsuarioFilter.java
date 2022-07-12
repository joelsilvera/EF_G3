package Filters;

import Beans.Empleado;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "UsuarioFilter")
public class UsuarioFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        Empleado empleado = (Empleado) req.getSession().getAttribute("empleadoSesion");
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
    }
}
