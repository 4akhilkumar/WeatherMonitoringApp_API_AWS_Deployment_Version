<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#317EFB"/>
    <meta name="google-site-verification" content="EXhdBzGaMsBcnkhYEbtp9ztAhQWut5QKH3N0eFHsabA" />
    <meta name="description" content="AkirA is a kind of Learning Mangement System which can be accessible in all your devices Android, iOS, and desktop devices.">
    
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href='pages/static/subscribe.css'>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <title>Subscribe - καιρός</title>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="header-image">
                <div class="header-image-particle header-image-particle-1"></div>
                <div class="header-image-particle header-image-particle-2"></div>
                <div class="header-image-particle header-image-particle-3"></div>
                
                <svg viewBox="0 0 512 512">
                    
                    <defs>
                        <linearGradient id="logo-gradient" x1="50%" y1="0%" x2="75%" y2="100%" >
                            <stop offset="0%" stop-color="#F79533">
                                <animate attributeName="stop-color" values="#F79533; #F37055; #EF4E7B; #A166AB; #5073B8; #1098AD; #07B39B; #6DBA82; #F79533" dur="4s" repeatCount="indefinite"></animate>
                            </stop>
                            <stop offset="100%" stop-color="#F79533">
                                <animate attributeName="stop-color" values="#F37055; #EF4E7B; #A166AB; #5073B8; #1098AD; #07B39B; #6DBA82; #F79533; #F37055" dur="4s" repeatCount="indefinite"></animate>
                            </stop>
                        </linearGradient>
                    </defs>
                    <path fill="url('#logo-gradient')" d="M496 127.1C496 381.3 309.1 512 255.1 512C204.9 512 16 385.3 16 127.1c0-19.41 11.7-36.89 29.61-44.28l191.1-80.01c4.906-2.031 13.13-3.701 18.44-3.701c5.281 0 13.58 1.67 18.46 3.701l192 80.01C484.3 91.1 496 108.6 496 127.1z"></path>
                </svg>
            </div>
    
            <h1 class="header-title text-center">
                Welcome to&nbsp;<span class="akira">καιρός!</span>
            </h1>
    
            <p class="text text-center">
                Safe <b>&nbsp; &#183; &nbsp;</b> Secure <b>&nbsp; &#183; &nbsp;</b> Ideal
            </p>
        </div>
    
        <form action="gotosubscribe" method="POST">
            <div class="input app-input">
                <input type="text" name="user_name" id="id_full_name" autocapitalize="none" onkeyup="isEmpty()" required>
                <label for="full_name"><i class="far fa-user"></i> Full name</label>
            </div>
            
            <div class="input app-input">
                <input type="text" name="place" id="id_place" autocapitalize="none" required>
                <label for="place"><i class="fas fa-map-marked-alt"></i> Place</label>
            </div>
    
            <div class="input app-input">
                <input type="email" name="email" id="id_email" onkeyup="isEmpty()" required>
                <label for="email"><i class="fa-solid fa-envelope"></i> Email</label>
            </div>

            <div class="input app-input">
                <input type="tel" name="phone_number" id="id_phone" onkeyup="isEmpty()" required>
                <label for="phone"><i class="fa-solid fa-phone"></i> Phone number</label>
            </div>
            
            <div class="g-recaptcha" data-sitekey="6LfmDxMdAAAAACs6hML3Ev6wOrB18ZkXSPjNWEvL" data-callback="enablebutton"></div>
            <button type="submit" class="button app-login-button" id="id_submit">
                <i class="fas fa-sign-in-alt"></i> Subscribe
            </button>
        </form>
    </div>
</body>
</html>

<script src='pages/static/subscribe.js'></script>