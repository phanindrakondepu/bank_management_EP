<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Banking Application</title>
    <link rel="stylesheet" href="style.css"/>
    <style>
        /* Custom styles for circular photo frame */
        .profile-photo {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            overflow: hidden;
            margin-right: 10px;
            position: relative;
            cursor: pointer;
        }
        .profile-photo img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .profile-dropdown {
            position: absolute;
            top: 50px; /* Adjust as needed */
            right: 10px; /* Adjust as needed */
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            display: none;
            z-index: 1000;
        }
        .profile-dropdown a {
            display: block;
            padding: 10px 20px;
            text-decoration: none;
            color: #333;
        }
        .profile-dropdown a:hover {
            background-color: #f0f0f0;
        }
        /* Custom styles for the navbar */
        .navbar {
            background-color: #004d99;
            color: #fff;
            padding: 10px 20px;
        }
        .navbar .container {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .nav-links {
            list-style: none;
            padding: 0;
            display: flex;
        }
        .nav-links li {
            margin-left: 20px;
        }
        .nav-links a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
        }
        .nav-links a:hover {
            color: #ffcc00;
        }
        /* Main content styles */
        .main-content {
            height: calc(100vh - 80px); /* Adjust based on header and footer height */
            background: url('bank1.webp') no-repeat center center;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            text-align: center;
            padding: 20px;
        }
        .main-content h2 {
            color: #fff;
            font-size: 2rem;
            margin-bottom: 20px;
        }
        .main-content p {
            color: #fff;
            font-size: 1.2rem;
        }
        /* Footer styles */
        footer {
            background-color: #004d99;
            color: #fff;
            padding: 10px 20px;
            text-align: center;
            width: 100%;
            position: absolute;
            bottom: 0;
        }
    </style>
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="container">
                <%-- Check if user is logged in to display appropriate links --%>
                <%
                    String username = (String) session.getAttribute("username");
                    boolean isLoggedIn = username != null;
                %>
                <div class="profile-photo" id="profilePhoto">
                    <img src="bank.png" alt="Profile Photo">
                </div>
                <ul class="nav-links">
                    <li><a href="">Home</a></li>
                    
                    <li><a href="loginpage.jsp">Login</a></li>
                    <li><a href="adminlogin.jsp">AdminLogin</a></li>
                    
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <main class="main-content">
        <h2>Welcome to Banking Application</h2>
        <p>Explore our trusted banking services and manage your finances securely.</p>
    </main>

    <footer>
        <div class="container">
            <p>&#169; 2024 Phanindra. All rights reserved.</p>
        </div>
    </footer>

    <script>
        // JavaScript to toggle profile dropdown
        const profilePhoto = document.getElementById('profilePhoto');
        const profileDropdown = document.getElementById('profileDropdown');

        profilePhoto.addEventListener('click', function() {
            profileDropdown.style.display = (profileDropdown.style.display === 'block') ? 'none' : 'block';
        });

        // Close dropdown on click outside
        document.addEventListener('click', function(event) {
            if (!profilePhoto.contains(event.target) && !profileDropdown.contains(event.target)) {
                profileDropdown.style.display = 'none';
            }
        });
    </script>
</body>
</html>
