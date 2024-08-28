<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Banking Application Sign Up</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #0f0c29;
            background: linear-gradient(to right, #24243e, #302b63, #0f0c29);
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
            overflow: auto;
            color: #fff;
        }
        .container {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            max-width: 600px;
            width: 100%;
            position: relative;
            margin: 20px;
        }
        h2 {
            margin-top: 0;
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        label {
            font-weight: bold;
        }
        input, select {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #333;
            color: #fff;
        }
        .form-group {
            display: flex;
            flex-direction: column;
        }
        .button {
            padding: 10px;
            font-size: 16px;
            color: #fff;
            background-color: #03a9f4;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }
        .button:hover {
            background-color: #0288d1;
        }
        .light {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 1000px;
            height: 1000px;
            background: #03a9f4;
            filter: blur(150px);
            transform: translate(-50%, -50%);
            animation: pulse 2s infinite;
            z-index: -1;
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
    </style>
</head>
<body>
    <div class="container">
        <h2>Banking Application Sign Up</h2>
        <form id="signupForm" action="SignUpServlet" method="post">
            <div class="form-group">
                <label for="firstname">First Name:</label>
                <input type="text" id="firstname" name="firstname" required="required"/>
            </div>
            <div class="form-group">
                <label for="lastname">Last Name:</label>
                <input type="text" id="lastname" name="lastname" required="required"/>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required="required"/>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" required="required"/>
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" required="required"/>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required="required"/>
            </div>
            <div class="form-group">
                <label for="city">City:</label>
                <input type="text" id="city" name="city" required="required"/>
            </div>
            <div class="form-group">
                <label for="state">State:</label>
                <input type="text" id="state" name="state" required="required"/>
            </div>
            <div class="form-group">
                <label for="zip">Zip Code:</label>
                <input type="text" id="zip" name="zip" required="required"/>
            </div>
            <div class="form-group">
                <label for="accounttype">Account Type:</label>
                <select id="accounttype" name="accounttype" required="required">
                    <option value="savings">Savings Account</option>
                    <option value="checking">Checking Account</option>
                    <option value="business">Business Account</option>
                </select>
            </div>
            <div class="form-group">
                <label for="amount">Amount:</label>
                <input type="number" id="amount" name="amount" required="required"/>
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required="required"/>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required="required"/>
            </div>
            <div class="form-group">
                <label for="confirmpassword">Confirm Password:</label>
                <input type="password" id="confirmpassword" name="confirmpassword" required="required"/>
            </div>
            <button type="submit" class="button">Sign Up</button>
        </form>
    </div>
    <div class="light"></div>
</body>
</html>
