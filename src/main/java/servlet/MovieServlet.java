/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.MovieDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Movie;

/**
 *
 * @author hn235
 */
@WebServlet(name = "MovieServlet", urlPatterns = {"/movie"})
public class MovieServlet extends HttpServlet {

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
            out.println("<title>Servlet MovieServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MovieServlet at " + request.getContextPath() + "</h1>");
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
        RequestDispatcher rd=request.getRequestDispatcher("add_movie_info.jsp");
        rd.forward(request, response);
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
        request.setCharacterEncoding("UTF-8"); 
        
        // 1. Lấy tất cả tham số từ request
        Map<String, String[]> params = request.getParameterMap();
        
        // Cấu trúc để lưu trữ dữ liệu đã phân tích
        List<Map<String, String>> movieList = new ArrayList<>();
        
        // Map để nhóm dữ liệu tạm thời theo chỉ số hàng
        // Key: Chỉ số hàng (Integer), Value: Dữ liệu của hàng đó (Map<Tên Cột, Giá Trị>)
        Map<Integer, Map<String, String>> groupedData = new HashMap<>();

        // 2. Phân tích cú pháp tên tham số và nhóm theo hàng
        for (Map.Entry<String, String[]> entry : params.entrySet()) {
            String paramName = entry.getKey();
            // Lấy giá trị đầu tiên (vì input text chỉ có 1 giá trị)
            String value = entry.getValue()[0]; 
            
            // Chỉ xử lý các tham số thuộc về bảng dữ liệu
            if (paramName.startsWith("data[") && paramName.endsWith("]")) {
                try {
                    // Trích xuất chỉ số hàng (ví dụ: 0 từ "data[0][name]")
                    int startRow = paramName.indexOf('[') + 1;
                    int endRow = paramName.indexOf(']');
                    int rowIndex = Integer.parseInt(paramName.substring(startRow, endRow));
                    
                    // Trích xuất tên cột (ví dụ: name từ "[name]")
                    int startCol = paramName.lastIndexOf('[') + 1;
                    int endCol = paramName.lastIndexOf(']');
                    String colName = paramName.substring(startCol, endCol);

                    // Khởi tạo Map cho hàng đó nếu chưa tồn tại
                    groupedData.putIfAbsent(rowIndex, new HashMap<>());
                    
                    // Thêm dữ liệu vào Map của hàng tương ứng
                    groupedData.get(rowIndex).put(colName, value);

                } catch (Exception e) {
                    System.err.println("Lỗi khi phân tích tham số: " + paramName);
                    e.printStackTrace();
                }
            }
        }
        
        // 3. Chuyển dữ liệu đã nhóm vào danh sách cuối cùng và sắp xếp theo chỉ số hàng
        groupedData.keySet().stream()
            .sorted() // Đảm bảo thứ tự hàng đúng (0, 1, 2, ...)
            .forEach(key -> movieList.add(groupedData.get(key)));

        // 4. Xử lý dữ liệu (Ví dụ: in ra Console)
        System.out.println("Tổng số hàng phim nhận được: " + movieList.size());
        List<Movie> movies=new ArrayList<>();
        for (int i = 0; i < movieList.size(); i++) {
            Movie m=new Movie();
            Map<String, String> movie = movieList.get(i);
            // Kiểm tra và bỏ qua hàng rỗng nếu tất cả các trường đều trống
            if (movie.values().stream().allMatch(String::isEmpty)) {
                 System.out.println("Hàng " + (i + 1) + " bị bỏ qua do trống.");
                 continue; 
            }
            m.setName(movie.get("name"));
            m.setCategory(movie.get("category"));
            m.setDirector(movie.get("director"));
            m.setDuration(Integer.parseInt(movie.get("duration")));
            m.setNation(movie.get("nation"));
            m.setYear(Integer.parseInt(movie.get("year")));
            System.out.println("--- Phim " + (i + 1) + " ---");
            System.out.println("Tên: " + movie.get("name"));
            System.out.println("Category: " + movie.get("category"));
            System.out.println("Duration: " + movie.get("duration"));
            movies.add(m);
        }
        MovieDAO movieDAO=new MovieDAO();
        int a=movieDAO.addMovie(movies);
        if(a>0)   request.setAttribute("alertMessage", "Add success");
        else    request.setAttribute("alertMessage", "Add failed");
        response.sendRedirect(request.getContextPath()+"/movie_information_management_home.jsp");
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