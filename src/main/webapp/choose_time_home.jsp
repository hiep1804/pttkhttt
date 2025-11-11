<%@page import="model.ScreeningSchedule"%>
<%@page import="java.util.List"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.format.FormatStyle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Choose Time Home</title>
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
                /* Mô phỏng tiêu đề đơn giản như trong ảnh */
                font-weight: normal;
            }

            /* Thiết lập bảng */
            table {
                margin: 20px auto;
                border-collapse: collapse;
                width: 50%; /* Bảng có chiều rộng vừa phải */
                max-width: 500px;
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
                font-size: 1.1em;
            }
        </style>
    </head>
    <body>

        <h1>Choose Time Home</h1>
        <%
            List<ScreeningSchedule> timeList = (List<ScreeningSchedule>) request.getAttribute("timeList");
            String url = request.getContextPath() + "/choose-seat";
        %>
        <table name="tbltime">
            <thead>
                <tr>
                    <th>Time</th>
                </tr>
            </thead>
            <tbody>
                <% if (timeList != null && !timeList.isEmpty()) {
                        for (ScreeningSchedule schedule : timeList) {
                %>
                <tr onclick="selectMovie('<%= schedule.getId()%>', '<%= url%>')">
                    <td><%=schedule.getTime().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.SHORT))%></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6">No times found</td>
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
                window.location.href = url + "?timeId=" + movieId;

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