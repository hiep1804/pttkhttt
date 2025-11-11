<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie Information Management Home</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: linear-gradient(to right, #667eea, #764ba2);
            color: white;
        }
        h1 {
            margin-bottom: 50px;
            font-size: 3rem;
            text-shadow: 1px 1px 5px rgba(0,0,0,0.3);
        }
        .btn-manager {
            font-size: 1.5rem;
            padding: 20px 40px;
            border-radius: 12px;
            background-color: #ffffff;
            color: #667eea;
            font-weight: bold;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
            transition: all 0.3s ease;
        }
        .btn-manager:hover {
            background-color: #f0f0f0;
            transform: translateY(-3px);
            color: #5a67d8;
        }
    </style>
</head>
<body>

    <h1>Movie Information Management Home</h1>
    <a href="<%=request.getContextPath()%>/add_movie_home.jsp" class="btn btn-manager" name="showAddMovie">Add movie information</a>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
