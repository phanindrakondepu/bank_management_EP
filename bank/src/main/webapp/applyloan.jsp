<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Apply for a Loan</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #121212;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
        }
        .container {
            width: 50%;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
            color: #fff;
        }
        h1 {
            text-align: center;
            color: #fff;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin: 10px 0 5px;
            color: #ddd;
        }
        input, select, textarea {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #444;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.1);
            color: #fff;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
        }
        .light {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 1000px;
            height: 1000px;
            background: rgba(3, 169, 244, 0.2);
            filter: blur(150px);
            transform: translate(-50%, -50%);
            animation: pulse 2s infinite;
            z-index: -1;
        }
        .glow {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 100%;
            height: 100%;
            transform: translate(-50%, -50%);
            animation: glow 2s infinite;
            z-index: -2;
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
        @keyframes glow {
            0%, 100% {
                box-shadow: 0 0 20px rgba(3, 169, 244, 0.5), 0 0 30px rgba(3, 169, 244, 0.5), 0 0 40px rgba(3, 169, 244, 0.5), 0 0 50px rgba(3, 169, 244, 0.5);
            }
            50% {
                box-shadow: 0 0 30px rgba(3, 169, 244, 0.5), 0 0 40px rgba(3, 169, 244, 0.5), 0 0 50px rgba(3, 169, 244, 0.5), 0 0 60px rgba(3, 169, 244, 0.5);
            }
        }
        .container::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: linear-gradient(45deg, #03a9f4, #0288d1, #03a9f4, #0288d1);
            background-size: 400%;
            border-radius: 10px;
            z-index: -3;
            animation: runningLights 4s linear infinite;
        }
        @keyframes runningLights {
            0% {
                background-position: 0 0;
            }
            100% {
                background-position: 400% 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Apply for a Loan</h1>
        <form action="LoanServlet" method="post">
            <label for="loanType">Loan Type:</label>
            <select id="loanType" name="loanType" required="required">
                <option value="home">Home Loan</option>
                <option value="personal">Personal Loan</option>
                <option value="car">Car Loan</option>
                <option value="education">Education Loan</option>
            </select>
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" required="required" />
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required="required" />
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" required="required" />
            <label for="amount">Loan Amount:</label>
            <input type="number" id="amount" name="amount" required="required" />
            <label for="message">Additional Information:</label>
            <textarea id="message" name="message" rows="4"></textarea>
            <button type="submit">Submit Application</button>
        </form>
    </div>
    <div class="glow"></div>
    <div class="light"></div>
</body>
</html>
