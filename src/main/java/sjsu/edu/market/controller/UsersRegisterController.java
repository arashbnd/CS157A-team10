package sjsu.edu.market.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sjsu.edu.market.dao.RegisterDao;
import sjsu.edu.market.model.UsersRegister;
import sjsu.edu.market.utils.MyUtils;

@WebServlet("/register")
public class UsersRegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RegisterDao registerDao;

    public void init() {
        registerDao = new RegisterDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/register.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        register(request, response);
    }

    protected void register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);
        boolean result = false;
        String errorString = null;

        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        UsersRegister users = new UsersRegister();

        users.setFirstName(firstName);
        users.setLastName(lastName);
        users.setUsername(username);
        users.setPassword(password);
        users.setEmail(email);
        users.setAddress(address);
        users.setPhone(phone);
        try {
            RegisterDao.registerUsers(users);
            RegisterDao.registerLogin();
        } catch (Exception e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }

        if (errorString != null) {
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/view/register.jsp");
            dispatcher.forward(request, response);
        }
        else {
            response.sendRedirect(request.getContextPath() + "/login");
        }


    }
}