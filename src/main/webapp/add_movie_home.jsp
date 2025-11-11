<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Movie Home</title>
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
    }
    h1 {
        text-decoration: underline;
        color: #CD5C5C; /* Màu đỏ nhạt hơn cho nổi bật */
    }
    table {
        margin: 20px auto;
        border-collapse: collapse;
        width: 80%;
    }
    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: center;
    }
    th {
        background-color: #f2f2f2;
    }
    input[type="text"] {
        width: 100%;
        box-sizing: border-box;
        border: none;
        padding: 5px;
    }
    .button-container {
        margin-top: 20px;
    }
    .button-container button {
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        margin: 0 10px;
    }
</style>
</head>
<body>

    <h1><p href="#">Add Movie</a> <a href="<%=request.getContextPath()%>/manager_main_home.jsp">Home</a></h1>

    <form id="movieForm" action="movie" method="post">
        <table id="movieTable" name="tblmovie">
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
            </tbody>
        </table>
        
        <div class="button-container">
            <button type="button" onclick="addRow()" name="addrow">Add Row</button>
            <button type="submit" name="save" value="add">Add</button>
        </div>
    </form>

    <script>
        /**
         * Hàm thêm một hàng mới vào bảng
         */
        function addRow() {
            var tableBody = document.getElementById("movieTable").getElementsByTagName('tbody')[0];
            var newRow = tableBody.insertRow();
            var rowIndex = tableBody.rows.length - 1; // Chỉ số hàng mới

            // Các cột và tên input tương ứng
            var columns = ["name", "category", "duration", "nation", "director", "year"];

            for (var i = 0; i < columns.length; i++) {
                var newCell = newRow.insertCell(i);
                var inputName = 'data[' + rowIndex + '][' + columns[i] + ']';
                if(i!=2&&i!=5) newCell.innerHTML = '<input type="text" name="' + inputName + '" required>';
                else newCell.innerHTML = '<input type="number" name="' + inputName + '" required>';
            }
        }
    </script>

</body>
</html>