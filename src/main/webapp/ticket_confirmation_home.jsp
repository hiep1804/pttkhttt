<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket Confirmation Home</title>
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

    /* Thiết lập Form và Input */
    .form-container {
        width: 60%;
        max-width: 600px;
        margin: 0 auto;
        text-align: left;
    }

    label {
        display: block;
        font-size: 1.1em;
        margin-bottom: 5px;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        font-size: 1em;
        margin-bottom: 30px;
        box-sizing: border-box; /* Đảm bảo padding không làm tăng chiều rộng */
        border: 1px solid #ccc;
        box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
    }

    /* Thiết lập nút */
    .button-container {
        text-align: center;
    }

    .action-button {
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
    <h1>Ticket Confirmation Home</h1>
    <div class="form-container">
        <form action="<%=request.getContextPath()%>/bill" method="post">
            
            <label for="loyaltyCode">Loyalty card code</label>
            <input type="text" id="loyaltyCode" name="loyaltycode">

            <div class="button-container">
                <button type="submit" class="action-button" name="confirm">confirm</button>
            </div>
        </form>
    </div>

</body>
</html>