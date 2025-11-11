<%@page import="java.util.List"%>
<%@page import="model.Ticket"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Choose Seat Home</title>
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
        font-weight: normal;
    }

    /* Thiết lập bảng */
    table {
        margin: 20px auto;
        border-collapse: collapse;
        width: 80%; 
        max-width: 800px;
        border: 1px solid black;
    }
    
    /* Thiết lập tiêu đề và ô dữ liệu */
    th, td {
        border: 1px solid black;
        padding: 10px;
        text-align: center;
        height: 30px; 
    }
    
    th {
        background-color: #e9e9e9;
        font-weight: bold;
    }

    /* Thiết lập nút */
    .action-button {
        margin-top: 30px;
        padding: 10px 30px;
        font-size: 1.1em;
        background-color: #ddd; 
        border: 1px solid #aaa; 
        cursor: pointer;
        color: #000;
        box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2); 
        transition: background-color 0.3s;
    }

    .action-button:hover {
        background-color: #ccc;
    }
</style>
</head>
<body>

    <h1>Choose Seat Home</h1>
    <%
        List<Ticket> tickets = (List<Ticket>)request.getAttribute("ticketList");
        String url = request.getContextPath() + "/ticket-confirm";
    %>
    
    <form action="<%= url %>" method="post">
        <table name="tblseat">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Row</th>
                    <th>Column</th>
                    <th>Price</th>
                    <th>Choose</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    if (tickets != null && !tickets.isEmpty()) {
                        for (Ticket t : tickets) {
                %>
                <tr>
                    <td><%= t.getSeat().getName() %></td> 
                    <td><%= t.getSeat().getRow() %></td>
                    <td><%= t.getSeat().getCol() %></td>
                    <td><%= t.getPrice()%></td>
                    <td>
                        <input type="checkbox" name="selected_seats" value="<%= t.getId() %>">
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="4">Không có ghế nào được tìm thấy.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

            <button type="submit" class="action-button" name="book">Book tickets</button>
    </form>

</body>
</html>