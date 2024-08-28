<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Bank Balance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #0f0c29;
            background: linear-gradient(to right, #24243e, #302b63, #0f0c29);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 20px;
            overflow: hidden;
            color: #fff;
        }
        .container {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            max-width: 600px;
            width: 100%;
            text-align: center;
            position: relative;
            z-index: 1;
        }
        h2 {
            margin-top: 0;
            animation: fadeInDown 1s ease-in-out;
        }
        p {
            margin-top: 20px;
            font-size: 18px;
            color: #ddd;
            animation: fadeIn 1.5s ease-in-out;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-top: 20px;
            animation: fadeInUp 1s ease-in-out;
        }
        input[type="text"], input[type="password"] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #333;
            color: #fff;
        }
        .button {
            padding: 10px;
            font-size: 16px;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .button:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }
        .light {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 1000px;
            height: 1000px;
            background: #4CAF50;
            filter: blur(150px);
            transform: translate(-50%, -50%);
            animation: pulse 2s infinite;
            z-index: 0;
        }
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        @keyframes pulse {
            0%, 100% {
                transform: translate(-50%, -50%) scale(1);
                opacity: 0.5;
            }
            50% {
                transform: translate(-50%, -50%) scale(1.2);
                opacity: 1;
            }
        }
        .back-button-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Bank Balance</h2>
        <p>Welcome to our Banking System! Use the form below to check your current account balance.</p>
        <form action="BalanceServlet" method="post">
            <input type="text" name="username" placeholder="Enter Username" required="required"/>
            <input type="password" name="password" placeholder="Enter Password" required="required"/>
            <button type="submit" class="button">Check Balance</button>
        </form>
        <% if (request.getAttribute("balance") != null) { %>
            <p>Your current balance: $<%= request.getAttribute("balance") %></p>
        <% } %>
        <div class="back-button-container">
            <a href="index1.jsp" class="button">Back</a>
        </div>
    </div>
    <div class="light"></div>
</body>
</html>
