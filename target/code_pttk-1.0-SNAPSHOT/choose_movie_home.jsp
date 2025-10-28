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

    <table>
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
            <tr>
                <td></td>
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
                <td></td>
            </tr>
        </tbody>
    </table>

</body>
</html>