<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #764ba2, #667eea);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .register-card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            padding: 40px;
            width: 100%;
            max-width: 450px;
        }
        .register-card h3 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }
        .form-control:focus {
            box-shadow: 0 0 0 0.25rem rgba(118, 75, 162, 0.25);
            border-color: #764ba2;
        }
        .btn-primary {
            background-color: #764ba2;
            border-color: #764ba2;
        }
        .btn-primary:hover {
            background-color: #6b46c1;
        }
    </style>
</head>
<body>

<div class="register-card">
    <h3>Tạo tài khoản mới</h3>
    <form action="register" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Tên đăng nhập</label>
            <input type="text" class="form-control" id="username" name="username" required placeholder="Nhập tên đăng nhập">
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Địa chỉ Email</label>
            <input type="email" class="form-control" id="email" name="email" required placeholder="Nhập email của bạn">
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password" required placeholder="Nhập mật khẩu">
        </div>

        <div class="mb-3">
            <label for="confirmPassword" class="form-label">Xác nhận mật khẩu</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required placeholder="Nhập lại mật khẩu">
        </div>

        <div class="mb-3">
            <label for="nation" class="form-label">Quốc gia</label>
            <select class="form-select" id="nation" name="nation" required>
                <option value="">-- Chọn quốc gia --</option>
                <option>Việt Nam</option>
                <option>Mỹ</option>
                <option>Nhật Bản</option>
                <option>Hàn Quốc</option>
                <option>Pháp</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary w-100">Đăng ký</button>

        <%-- Hiển thị thông báo (nếu có) --%>
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <div class="alert alert-info mt-3" role="alert">
                <%= message %>
            </div>
        <%
            }
        %>

        <div class="mt-3 text-center">
            <a href="login.jsp">Đã có tài khoản? Đăng nhập</a>
        </div>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
