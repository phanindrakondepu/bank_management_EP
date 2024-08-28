<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Banking Application Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('loginimage.avif') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            position: relative;
        }

        .login-box {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .login-box h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        .input-group {
            margin-bottom: 20px;
            position: relative;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .input-group label {
            position: absolute;
            top: 10px;
            left: 10px;
            font-size: 16px;
            color: #999;
            pointer-events: none;
            transition: all 0.2s ease;
        }

        .input-group input:focus + label,
        .input-group input:not(:placeholder-shown) + label {
            top: -14px;
            left: 10px;
            font-size: 12px;
            color: #333;
        }

        .login-btn,
        .signup-btn {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .login-btn {
            background-color: #4CAF50;
            color: #fff;
            margin-bottom: 10px;
        }

        .login-btn:hover {
            background-color: #45a049;
        }

        .signup-btn {
            background-color: #008CBA;
            color: #fff;
        }

        .signup-btn:hover {
            background-color: #007bb5;
        }

        .forgot-password {
            margin-top: 10px;
            color: #666;
            cursor: pointer;
            font-size: 14px;
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
                box-shadow: 0 0 20px #03a9f4, 0 0 30px #03a9f4, 0 0 40px #03a9f4, 0 0 50px #03a9f4;
            }
            50% {
                box-shadow: 0 0 30px #03a9f4, 0 0 40px #03a9f4, 0 0 50px #03a9f4, 0 0 60px #03a9f4;
            }
        }

        .login-box::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: linear-gradient(45deg, #03a9f4, #0288d1, #03a9f4, #0288d1);
            background-size: 400%;
            border-radius: 8px;
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
    <div class="login-container">
        <div class="login-box">
            <h2>Banking Application Login</h2>
            <form action="LoginServlet" method="post">
                <div class="input-group">
                    <input type="text" name="username" required="required" placeholder=" "/>
                    <label>Username</label>
                </div>
                <div class="input-group">
                    <input type="password" name="password" required="required" placeholder=""/>
                    <label>Password</label>
                </div>
                <button type="submit" class="login-btn">Login</button>
                <button type="button" class="signup-btn" onclick="location.href='signup.jsp'">Sign Up</button>
                <div class="forgot-password">Forgot password?</div>
            </form>
        </div>
        <div class="glow"></div>
    </div>
    <div class="light"></div>
</body>
</html>
