package Servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher;
        String logout = request.getParameter("finish");
        if(logout == null){
            requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request,response);

        }else{
            if(logout.equals("yes")){

                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/MenuSinLoginServlet");

            }else{

                requestDispatcher = request.getRequestDispatcher("index.jsp");
                requestDispatcher.forward(request,response);

            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
