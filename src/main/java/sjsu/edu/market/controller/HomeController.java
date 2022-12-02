package sjsu.edu.market.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sjsu.edu.market.utils.MyUtils;

@WebServlet(urlPatterns = { "/home"})
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public HomeController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        List<Movies> movies = null;
//        try {
//            movies = MovieDao.listMovies();
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//        request.setAttribute("movies", movies);
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/homepage.jsp");

        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}