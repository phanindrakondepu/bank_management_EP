<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #0f0c29;
            background: linear-gradient(to right, #24243e, #302b63, #0f0c29);
            overflow: hidden;
        }

        .login-container {
            position: relative;
        }

        .login-box {
            position: relative;
            width: 400px;
            padding: 40px;
            background: rgba(0, 0, 0, 0.8);
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.5);
            overflow: hidden;
        }

        .login-box h2 {
            margin: 0 0 30px;
            padding: 0;
            color: #fff;
            text-transform: uppercase;
        }

        .login-box .input-box {
            position: relative;
            margin-bottom: 30px;
        }

        .login-box .input-box input {
            width: 100%;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            background: transparent;
        }

        .login-box .input-box label {
            position: absolute;
            top: 0;
            left: 0;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            pointer-events: none;
            transition: 0.5s;
        }

        .login-box .input-box input:focus ~ label,
        .login-box .input-box input:valid ~ label {
            top: -20px;
            left: 0;
            color: #03a9f4;
            font-size: 12px;
        }

        .login-box button {
            background: #03a9f4;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
            color: #fff;
        }

        .login-box button:hover {
            background: #0288d1;
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
    <div class="login-container">
        <div class="login-box">
            <h2>Admin Login</h2>
            <form action="AdminLogin" method="post">
                <div class="input-box">
                    <input type="text" name="username" required="required">
                    <label>Username</label>
                </div>
                <div class="input-box">
                    <input type="password" name="password" required="required">
                    <label>Password</label>
                </div>
                <button type="submit">Login</button>
            </form>
        </div>
        <div class="glow"></div>
    </div>
    <div class="light"></div>
</body>
</html>
