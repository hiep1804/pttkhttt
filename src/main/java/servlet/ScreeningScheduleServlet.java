/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.ScreeningScheduleDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.chrono.ChronoLocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Movie;
import model.ScreeningSchedule;

/**
 *
 * @author hn235
 */
@WebServlet(name = "ScreeningScheduleServlet", urlPatterns = {"/choose-movie","/choose-time"})
public class ScreeningScheduleServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ScreeningScheduleServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScreeningScheduleServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ScreeningScheduleDAO screeningScheduleDAO=new ScreeningScheduleDAO();
        List<ScreeningSchedule> screeningSchedules=screeningScheduleDAO.getAllScreeningSchedule();
        HttpSession session=request.getSession();
        session.setAttribute("allScreeningSchedule", screeningSchedules);
        String path=request.getRequestURI();
        List<Movie> movies=new ArrayList<>();
        for(ScreeningSchedule screeningSchedule:screeningSchedules){
            movies.add(screeningSchedule.getMovie());
        }
        if(path.contains("/choose-movie")){
            LocalDateTime now=LocalDateTime.now();
            List<Movie> movieList=new ArrayList<>();
            for(ScreeningSchedule schedule:screeningSchedules){
                if(schedule.getTime().isAfter(now)){
                    movieList.add(schedule.getMovie());
                }
            }
            request.setAttribute("movieList", movieList);
            RequestDispatcher rd=request.getRequestDispatcher("choose_movie_home.jsp");
            rd.forward(request, response);
        }
        if(path.contains("/choose-time")){
            int id=Integer.parseInt(request.getParameter("movieId"));
            System.out.println(id);
            List<ScreeningSchedule> schedules=new ArrayList<>();
            for(ScreeningSchedule schedule:screeningSchedules){
                if(schedule.getMovie().getId()==id&&schedule.getTime().isAfter(LocalDateTime.now())){
                    schedules.add(schedule);
                }
            }
            request.setAttribute("timeList", schedules);
            RequestDispatcher rd=request.getRequestDispatcher("choose_time_home.jsp");
            rd.forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
