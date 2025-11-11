<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Bill Home</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #f0f4ff, #d9e4ff);
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                min-height: 100vh;
                padding-top: 80px;
                margin: 0;
            }

            h1 {
                font-size: 2.2em;
                margin-bottom: 40px;
                color: #1a1a1a;
                font-weight: 600;
                text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
            }

            .form-container {
                width: 100%;
                max-width: 450px;
                background-color: #ffffff;
                padding: 30px 40px;
                border-radius: 12px;
                box-shadow: 0 6px 15px rgba(0,0,0,0.1);
                text-align: left;
            }

            label {
                display: block;
                font-size: 1.05em;
                margin-bottom: 8px;
                color: #333333;
                font-weight: 500;
            }

            input[type="text"] {
                width: 100%;
                padding: 12px 15px;
                font-size: 1em;
                margin-bottom: 25px;
                border-radius: 8px;
                border: 1px solid #ccc;
                outline: none;
                transition: border-color 0.3s, box-shadow 0.3s;
                box-sizing: border-box;
            }

            input[type="text"]:focus {
                border-color: #4a90e2;
                box-shadow: 0 0 5px rgba(74,144,226,0.5);
            }

            .button-container {
                text-align: center;
            }

            .action-button {
                padding: 12px 35px;
                font-size: 1.1em;
                background-color: #4a90e2;
                border: none;
                border-radius: 8px;
                color: white;
                cursor: pointer;
                font-weight: 500;
                transition: background-color 0.3s, transform 0.2s;
                box-shadow: 0 4px 8px rgba(0,0,0,0.15);
            }

            .action-button:hover {
                background-color: #357ab8;
                transform: translateY(-2px);
                box-shadow: 0 6px 12px rgba(0,0,0,0.2);
            }

            @media (max-width: 500px) {
                .form-container {
                    padding: 20px;
                    width: 90%;
                }
                .action-button {
                    width: 100%;
                }
            }
        </style>

    </head>

    <h1>Bill Home</h1>
    <label for="nameLabel"><%=session.getAttribute("total")%></label><br><br>

    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Superqr.svg/330px-Superqr.svg.png" alt="Ảnh minh họa">

    <br>
    <form action="<%=request.getContextPath()%>/bill" method="post">
        <button type="submit" name="confirm">Confirm</button>
    </form>

</html>
