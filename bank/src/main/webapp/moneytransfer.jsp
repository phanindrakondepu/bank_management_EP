<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transfer Funds</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #141e30;
            background: linear-gradient(to right, #243b55, #141e30);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: white;
        }
        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
            animation: fadeIn 1s ease-out, glowing 1.5s infinite alternate;
            position: relative;
            overflow: hidden;
        }
        .container::before, .container::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: rgba(255, 255, 255, 0.1);
            animation: rotateBg 10s linear infinite;
            z-index: -1;
        }
        .container::after {
            animation-delay: -5s;
        }
        @keyframes rotateBg {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @keyframes glowing {
            from {
                box-shadow: 0 0 10px rgba(0, 255, 255, 0.6), 0 0 20px rgba(0, 255, 255, 0.4);
            }
            to {
                box-shadow: 0 0 20px rgba(0, 255, 255, 0.8), 0 0 30px rgba(0, 255, 255, 0.6);
            }
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 8px;
            font-weight: bold;
        }
        input[type="text"], input[type="submit"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            transition: all 0.3s;
        }
        input[type="text"]:focus {
            box-shadow: 0 0 10px rgba(0, 255, 255, 0.8);
            outline: none;
            border-color: #00ffcc;
        }
        input[type="submit"] {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            border: none;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
        }
        input[type="submit"]:hover {
            background: linear-gradient(to right, #0072ff, #00c6ff);
            transform: scale(1.05);
        }
        .back-button-container {
            text-align: center;
            margin-top: 20px;
        }
        .back-button {
            padding: 10px;
            font-size: 16px;
            color: #fff;
            background-color: #f44336;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s;
            text-decoration: none;
        }
        .back-button:hover {
            background-color: #d32f2f;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Transfer Funds</h1>
        <form action="MoneyTransfer" method="post">
            <label>From Account Username:</label>
            <input type="text" name="fromUsername" required="required">
            
            <label>To Account Username:</label>
            <input type="text" name="toUsername" required="required">
            
            <label>Amount:</label>
            <input type="text" name="amount" required="required">
            
            <input type="submit" value="Transfer Funds">
        </form>
        <div class="back-button-container">
            <a href="index1.jsp" class="back-button">Back</a>
        </div>
    </div>
</body>
</html>
