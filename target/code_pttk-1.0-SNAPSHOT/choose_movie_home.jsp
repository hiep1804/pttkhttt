<%@page import="java.util.List"%>
<%@page import="model.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Choose Movie Home</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
                background-color: #f8f8f8;
                padding-top: 50px;
            }

            h1 {
                font-size: 2em;
                margin-bottom: 50px;
                color: #333;
                /* Mô phỏng đường gạch chân đôi nhẹ nhàng như trong ảnh */
                text-decoration: underline;
                text-decoration-color: #cd5c5c; /* Màu đỏ nhạt hơn */
                padding-bottom: 2px;
            }

            /* Thiết lập bảng */
            table {
                margin: 20px auto;
                border-collapse: collapse;
                width: 85%;
                max-width: 1000px;
                border: 1px solid black;
            }

            /* Thiết lập tiêu đề và ô dữ liệu */
            th, td {
                border: 1px solid black;
                padding: 10px;
                text-align: center;
                height: 30px; /* Chiều cao cố định cho hàng dữ liệu trống */
            }

            th {
                background-color: #e9e9e9; /* Màu nền nhẹ cho tiêu đề */
                font-weight: bold;
            }
        </style>
    </head>
    <body>

        <h1><a href="#" style="text-decoration: underline; color: #333;">Choose Movie</a> <a href="#" style="text-decoration: underline; color: #333;">Home</a></h1>
        <%
            List<Movie> movies = (List< Movie>) request.getAttribute("movieList");
            // Định nghĩa URL Servlet đích cho hành động chọn phim
            String selectMovieUrl = request.getContextPath() + "/choose-time";
        %>
        <table name="lblmovie">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Duration</th>
                    <th>Nation</th>
                    <th>Director</th>
                    <th>Year</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (movies != null && !movies.isEmpty()) {
                        // Lặp qua danh sách phim để tạo hàng
                        for (Movie movie : movies) {
                %>
                <tr onclick="selectMovie('<%= movie.getId()%>', '<%= selectMovieUrl%>')">
                    <td><%= movie.getName()%></td>
                    <td><%= movie.getCategory()%></td>
                    <td><%= movie.getDuration()%></td>
                    <td><%= movie.getNation()%></td>
                    <td><%= movie.getDirector()%></td>
                    <td><%= movie.getYear()%></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6">No movies found</td>
                </tr>
                <% }%>
            </tbody>
        </table>
        <script>
            /**
             * Hàm được gọi khi người dùng click vào một hàng phim
             * @param {number} movieId - ID của bộ phim vừa được chọn
             * @param {string} url - URL của Servlet xử lý (ví dụ: /selectTimeServlet)
             */
            function selectMovie(movieId, url) {
                // Gửi dữ liệu (ID phim) đi đến Servlet bằng phương thức GET
                // Thao tác này sẽ chuyển hướng (redirect) trình duyệt đến URL mới
                window.location.href = url + "?movieId=" + movieId;

                // Hoặc, nếu muốn dùng form POST để gửi dữ liệu ẩn (phức tạp hơn, nhưng an toàn hơn)
                /*
                 var form = document.createElement('form');
                 form.method = 'POST';
                 form.action = url;
                     
                 var hiddenField = document.createElement('input');
                 hiddenField.type = 'hidden';
                 hiddenField.name = 'movieId';
                 hiddenField.value = movieId;
                     
                 form.appendChild(hiddenField);
                 document.body.appendChild(form);
                 form.submit();
                 */
            }
        </script>
    </body>
</html>