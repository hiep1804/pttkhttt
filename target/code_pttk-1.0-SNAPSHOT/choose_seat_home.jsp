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
        height: 30px; /* Chiều cao cố định cho hàng dữ liệu trống */
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
        background-color: #ddd; /* Màu nền xám nhạt */
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

    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Row</th>
                <th>Column</th>
                <th>Status</th>
                <th>Choose</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
    </table>

    <form action="url_xu_ly_dat_ve" method="post">
        <button type="submit" class="action-button">Book tickets</button>
    </form>

</body>
</html>