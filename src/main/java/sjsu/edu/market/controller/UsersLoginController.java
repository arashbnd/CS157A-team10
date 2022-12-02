package sjsu.edu.market.controller;


import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sjsu.edu.market.dao.LoginDao;
import sjsu.edu.market.dao.RegisterDao;
import sjsu.edu.market.model.UsersLogin;
import sjsu.edu.market.utils.DBUtils;
import sjsu.edu.market.utils.MyUtils;

@WebServlet("/login")
public class UsersLoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginDao loginDao;

    public void init() {
        loginDao = new LoginDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/login.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        authenticate(request, response);
    }

    private void authenticate(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String username = request.getParameter("user_name");
        String password = request.getParameter("user_password");
        String rememberMeStr = request.getParameter("rememberMe");
        boolean remember = "Y".equals(rememberMeStr);

        UsersLogin loginUsers = null;
        boolean hasError = false;
        String errorString = null;

        if (username == null || password == null || username.length() == 0 || password.length() == 0) {
            hasError = true;
            errorString = "Required username or password";
        } else {
            Connection connection = MyUtils.getStoredConnection(request);
            try {
                loginUsers = LoginDao.findUser(connection, username, password);

                if (loginUsers == null) {
                    hasError = true;
                    errorString = " Username or password invalid";
                }
            } catch (SQLException e) {
                e.printStackTrace();
                hasError = true;
                errorString = e.getMessage();
            }
        }

        if (hasError) {
            loginUsers = new UsersLogin();
            loginUsers.setUsername(username);
            loginUsers.setPassword(password);

            request.setAttribute("errorString", errorString);
            request.setAttribute("loginUsers", loginUsers);

            RequestDispatcher dispatcher //
                    = this.getServletContext().getRequestDispatcher("/WEB-INF/view/login.jsp");
            dispatcher.forward(request, response);
        }

        else {
            HttpSession session = request.getSession();
            MyUtils.storeLoginedUser(session, loginUsers);
            if (remember) {
                MyUtils.storeUserCookie(response, loginUsers);
            }
            else {
                MyUtils.deleteUserCookie(response);
            }
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }
}
