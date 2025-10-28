<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Home</title>
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
        /* Đảm bảo nội dung nằm giữa trang */
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh; /* Chiều cao đầy đủ của viewport */
        margin: 0;
        background-color: #f8f8f8;
    }
    
    h1 {
        font-size: 2em;
        margin-bottom: 50px; /* Khoảng cách với nút */
        color: #333;
        font-weight: normal; /* Giữ kiểu chữ đơn giản như trong ảnh */
    }
    
    .action-button {
        padding: 10px 25px;
        font-size: 1.1em;
        background-color: #ddd; /* Màu nền xám nhạt */
        border: 1px solid #aaa; /* Đường viền xám đậm */
        cursor: pointer;
        text-decoration: none; /* Loại bỏ gạch chân nếu dùng thẻ <a> */
        color: #000;
        box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2); /* Tạo đổ bóng nhẹ */
        transition: background-color 0.3s;
    }

    .action-button:hover {
        background-color: #ccc;
    }
</style>
</head>
<body>

    <h1>Customer Home</h1>
    
    <a href="url_mua_ve_online" class="action-button">Buy tickets online</a>
    
    </body>
</html>