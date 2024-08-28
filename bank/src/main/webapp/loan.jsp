<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cards with CSS Animation</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #121212; /* Dark background color */
            color: #ffffff; /* White text color for contrast */
            padding: 20px;
            box-sizing: border-box;
            overflow-x: hidden;
        }

        .intro {
            text-align: center;
            margin-bottom: 30px;
        }

        .intro h1 {
            font-size: 36px;
            margin-bottom: 10px;
            color: #ffd700; /* Gold color */
            text-shadow: 0 0 10px rgba(255, 215, 0, 0.7);
            animation: glow 2s infinite alternate;
        }

        @keyframes glow {
            0% {
                text-shadow: 0 0 5px #ffd700, 0 0 10px #ffd700, 0 0 15px #ffd700, 0 0 20px #ffd700, 0 0 25px #ffd700, 0 0 30px #ffd700;
            }
            100% {
                text-shadow: 0 0 10px #ffd700, 0 0 20px #ffd700, 0 0 30px #ffd700, 0 0 40px #ffd700, 0 0 50px #ffd700, 0 0 60px #ffd700;
            }
        }

        .intro p {
            font-size: 18px;
            margin: 0;
            color: #bbb;
        }

        .card-container {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
            position: relative;
            z-index: 1;
        }

        .card {
            width: 300px;
            height: 400px;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
            transition: transform 0.3s, box-shadow 0.3s;
            background-color: #1c1c1c; /* Darker card background */
            position: relative;
            display: flex;
            flex-direction: column;
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, transparent, transparent 40%, rgba(255, 255, 255, 0.2));
            opacity: 0;
            transition: opacity 0.3s;
        }

        .card:hover::before {
            opacity: 1;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.7);
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-bottom: 2px solid #ffd700;
        }

        .card-content {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #ffd700; /* Gold color */
            text-shadow: 0 0 10px rgba(255, 215, 0, 0.7);
        }

        .card-text {
            font-size: 16px;
            color: #ddd; /* Light gray for readability */
            flex-grow: 1;
        }

       .card-button {
    background-color: #007BFF;
    color: white;
    border: none;
    padding: 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    border-radius: 5px;
    cursor: pointer;
    margin: 10px 0;
    transition: background-color 0.3s, transform 0.2s;
    z-index: 10; /* Ensure the button is above other elements */
}


        .card-button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .light-effect {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.3), transparent);
            transform: translate(-50%, -50%);
            pointer-events: none;
            z-index: 0;
            transition: transform 0.3s;
        }

        .card:hover ~ .light-effect {
            transform: translate(-50%, -50%) scale(1.1);
        }
    </style>
</head>
<body>
    <div class="intro">
        <h1>Welcome to Our Banking Services</h1>
        <p>Explore a wide range of banking solutions designed to meet all your financial needs. From secure money transfers to flexible loan options, we have everything you need to manage your finances effectively. Contact us for more information or explore the options below.</p>
    </div>
    <div class="card-container">
        <div class="card">
            <img src="images/homeloan.jpg" alt="Loan">
            <div class="card-content">
                <div class="card-title">Home Loan</div>
                <div class="card-text">
                    Interest Rate: 3.5% p.a.<br>
                    Maximum Tenure: 30 years<br>
                    Loan Amount: Up to $500,000<br>
                </div>
                <button class="card-button" onclick="location.href='applyloan.jsp'">Apply Loan</button>
            </div>
        </div>
        <div class="card">
            <img src="images/personalloan.jpeg" alt="Loan">
            <div class="card-content">
                <div class="card-title">Personal Loan</div>
                <div class="card-text">
                    Interest Rate: 7.5% p.a.<br>
                    Maximum Tenure: 5 years<br>
                    Loan Amount: Up to $50,000<br>
                </div>
                <button class="card-button" onclick="location.href='applyloan.jsp'">Apply Loan</button>
            </div>
        </div>
        <div class="card">
            <img src="images/carloan.png" alt="Loan">
            <div class="card-content">
                <div class="card-title">Car Loan</div>
                <div class="card-text">
                    Interest Rate: 4.0% p.a.<br>
                    Maximum Tenure: 7 years<br>
                    Loan Amount: Up to $100,000<br>
                </div>
                <button class="card-button" onclick="location.href='applyloan.jsp'">Apply Loan</button>
            </div>
        </div>
        <div class="card">
            <img src="images/educationloan.jpeg" alt="Loan">
            <div class="card-content">
                <div class="card-title">Education Loan</div>
                <div class="card-text">
                    Interest Rate: 5.0% p.a.<br>
                    Maximum Tenure: 15 years<br>
                    Loan Amount: Up to $200,000<br></div>
                <button class="card-button" onclick="location.href='applyloan.jsp'">Apply Loan</button>
            </div>
        </div>
        <div class="card">
            <img src="contact.jpeg" alt="Contact">
            <div class="card-content">
                <div class="card-title">Contact</div>
                <div class="card-text">Reach out to us for any queries or assistance regarding our banking services.</div>
                <button class="card-button" onclick="location.href='contact.jsp'">Learn More</button>
            </div>
        </div>
    </div>
    <div class="light-effect"></div>
</body>
</html>
