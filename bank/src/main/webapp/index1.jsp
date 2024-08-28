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

        /* Video background styles */
        .video-container {
            position: fixed;
            right: 0;
            bottom: 0;
            min-width: 100%;
            min-height: 100%;
            z-index: -1;
            overflow: hidden;
        }
        .video-container video {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: -1;
            filter: brightness(50%);
        }

        
        }
        .cta-button {
            padding: 15px 30px;
            font-size: 1.2rem;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        .cta-button:hover {
            background-color: #45a049;
        }
        /* Button above video styles */
        .get-started-button {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 1; /* Ensure it's above the video */
        }
    </style>
</head>
<body>
    <!-- Video Background -->
    <div class="video-container">
        <video autoplay muted loop>
    <source src="base.mp4" type="video/mp4">
       </video>


    </div>

    <!-- Get Started Button -->
    <a href="cards.jsp" class="cta-button get-started-button">Get Started</a>

    <header>
        <nav class="navbar">
            <div class="container">
                <%-- Check if user is logged in to display appropriate links --%>
                <%
                    String username = (String) session.getAttribute("username");
                    boolean isLoggedIn = username != null;
                %>
                <div class="profile-photo" id="profilePhoto" style="<%= isLoggedIn ? "" : "display: none;" %>">
                    <img src="bank.png" alt="Profile Photo">
                </div>
                <ul class="nav-links">
                    <li><a href="">Home</a></li>
                    <li><a href="moneytransfer.jsp">Transfer</a></li>
                   <li><a href="bankbalance.jsp">Balance</a></li>
                    <li><a href="loan.jsp">Loans</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                    <li><a href="index.jsp">Logout</a></li>
                </ul>
                <div class="profile-dropdown" id="profileDropdown" style="display: none;">
                    <a href="profile.jsp">Profile</a>
                    <a href="logout.jsp">Logout</a>
                </div>
            </div>
        </nav>
    </header>

   

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
