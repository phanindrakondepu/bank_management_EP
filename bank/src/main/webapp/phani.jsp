<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Loan Types Slide Show</title>
    <style>
        /* Container for the slide show */
        .slideshow-container {
            position: relative;
            max-width: 100%;
            margin: auto;
            overflow: hidden;
            height: 400px; /* Fixed height for visibility */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Light shadow effect */
            border-radius: 8px; /* Rounded corners for container */
        }

        /* Slide cards */
        .mySlides {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 100%;
            position: absolute;
            transition: transform 1s ease-in-out; /* Smooth slide transition */
        }

        /* Card styling */
        .card {
            width: 80%;
            height: 80%;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            position: relative;
        }

        .card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(70%); /* Darker background for text visibility */
        }

        .card .text {
            position: absolute;
            bottom: 20px;
            left: 20px;
            color: #f2f2f2;
            font-size: 24px;
            font-weight: bold;
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background for text visibility */
            padding: 12px;
            border-radius: 8px; /* Rounded corners for text box */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4); /* Shadow effect for text box */
        }

        /* Navigation dots */
        .dot-container {
            text-align: center;
            position: absolute;
            bottom: 15px;
            width: 100%;
        }

        .dot {
            height: 12px;
            width: 12px;
            margin: 0 4px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease, transform 0.3s ease;
            cursor: pointer;
        }

        .dot:hover {
            transform: scale(1.3); /* Slightly enlarge the dot on hover */
            background-color: #717171; /* Change color on hover */
        }

        .active {
            background-color: #717171;
        }

        /* Dropdown styling */
        .dropdown {
            position: relative;
            display: inline-block;
            margin: 20px auto;
            text-align: center;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            border-radius: 8px;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            border-radius: 8px;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .dropdown-button {
            background-color: #4CAF50; /* Green background */
            color: white; /* White text */
            padding: 14px 20px;
            border: none;
            cursor: pointer;
            border-radius: 8px;
            font-size: 16px;
        }

        .dropdown-button:hover {
            background-color: #45a049; /* Darker green on hover */
        }

        /* Position dropdown below slides */
        .dropdown {
            position: relative;
            display: block;
            margin: 20px auto;
            text-align: center;
        }

        .dropdown-content {
            display: none;
            position: relative; /* Adjusted from absolute */
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            border-radius: 8px;
            margin-top: 10px; /* Space between slides and dropdown */
        }

        .dropdown-content.show {
            display: block;
        }
    </style>
</head>
<body>
    <div class="slideshow-container">

        <!-- Slides -->
        <div class="mySlides">
            <div class="card">
                <img src="loanimage.jpeg" alt="Bank Loan">
                <div class="text">Bank Loan</div>
            </div>
        </div>

        <div class="mySlides">
            <div class="card">
                <img src="bank.png" alt="Personal Loan">
                <div class="text">Personal Loan</div>
            </div>
        </div>

        <div class="mySlides">
            <div class="card">
                <img src="bank2.jpg" alt="Home Loan">
                <div class="text">Home Loan</div>
            </div>
        </div>

        <!-- Navigation dots -->
        <div class="dot-container">
            <span class="dot"></span>
            <span class="dot"></span>
            <span class="dot"></span>
        </div>
    </div>

    <!-- Dropdown Button -->
    <div class="dropdown">
        <button class="dropdown-button" onclick="toggleDropdown()">Dropdown</button>
        <div id="myDropdown" class="dropdown-content">
            <a href="#">Loan Information 1</a>
            <a href="#">Loan Information 2</a>
            <a href="#">Loan Information 3</a>
        </div>
    </div>

    <script>
        let slideIndex = 0;
        showSlides();

        function showSlides() {
            let i;
            let slides = document.getElementsByClassName("mySlides");
            let dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.transform = "translateX(-100%)";  
            }
            slideIndex++;
            if (slideIndex > slides.length) {slideIndex = 1}    
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex-1].style.transform = "translateX(0)";  
            dots[slideIndex-1].className += " active";
            setTimeout(showSlides, 5000); // Change slide every 5 seconds
        }

        // Dropdown functionality
        function toggleDropdown() {
            document.getElementById("myDropdown").classList.toggle("show");
        }

        // Close the dropdown if the user clicks outside of it
        window.onclick = function(event) {
            if (!event.target.matches('.dropdown-button')) {
                let dropdowns = document.getElementsByClassName("dropdown-content");
                for (let i = 0; i < dropdowns.length; i++) {
                    let openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }
            }
        }
    </script>
</body>
</html>
