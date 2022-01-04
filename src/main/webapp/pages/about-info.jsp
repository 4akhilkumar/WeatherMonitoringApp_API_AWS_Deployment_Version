<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="καιρός (kairós) is Greek Pronounciated Word. καιρός means Weather in Greek Language. καιρός is an Weather Monitoring Web Application which keeps tracking the weather and help in making you adapative for the weather.">
    <title>καιρός | Weather Monitoring Application</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="https://api.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.css" rel="stylesheet">
	<script nonce="bGIuK-dPcUfmMOgM-nVG3A" src="https://api.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@800&display=swap');
        :root {
            --medium-font-size: 1.50rem;
            --normal-font-size: 1rem;
            --small-font-size: 0.75rem;
            --smaller-font-size: 0.50rem;

            --font-weight-400: 400;
            --font-weight-500: 500;
            --font-weight-600: 600;
            --font-weight-700: 700;
            --font-weight-800: 800; 
            --font-weight-900: 900;

            --body-color: #e1f5fe;
            --anchor-tag: #2196f3;
            --border-color: #0000001f;
            --outline-color: #90caf9;
            --text-color: #58555E;
            --button-bg-color: #000;
            --card-bg-color: #FFF;
        }

        :root {
            --body-color: #e1f5fe;
            --anchor-tag: #2196f3;
            --border-color: #0000001f;
            --outline-color: #90caf9;
            --text-color: #58555E;
            --button-bg-color: #000;
            --card-bg-color: #FFF;
        }

        @media (prefers-color-scheme: dark) {
            :root {
                --body-color: #202124;
                --anchor-tag: #2196f3;
                --border-color: #0000001f;
                --outline-color: #90caf9;
                --text-color: #58555E;
                --button-bg-color: #000;
                --card-bg-color: #FFF;
            }
        }

        *, ::before, ::after {
            box-sizing: border-box;
        }

        body {
            padding: 0;
            margin: 0;
            background-color: var(--body-color);
            /* background-color: #51a1c4; */
            font-family: system-ui;
            color: #424242;
        }

        #map { 
            position: relative; 
            width: 100%; 
        }

        a {
            text-decoration: none;
            color: #616161;
            min-width: fit-content;
            font-weight: var(--font-weight-500);
        }

        a:hover {
            box-shadow: none;
        }

        header {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            align-items: center;
            padding: 0.75rem;

            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            box-shadow: 0 1px 0 rgba(22, 8, 43, 0.1);
            background-color: var(--body-color);
            z-index: 9999;
        }

        .kairos-logo {
            font-family: 'Roboto Slab', serif;
            font-size: 2rem;
            box-shadow: inset 0px -2px 0px 0px #42a5f5;
        }

        .btn {
            color: var(--text-color);
            padding: 0.8rem;
            font-size: 14px;
            text-transform: uppercase;
            border-radius: 0.25rem;
            font-weight: 400;
            display: block;
            cursor: pointer;
            /* border: 1px solid rgb(122 122 122 / 25%); */
            border: 1px solid #efefef;
            /* background: transparent; */
            transition: 0.4s;
        }

        .login-button {
            box-shadow: -2px 2px 0px 1px #00000040;
        }

        .search-place-button {
            box-shadow: 2px 2px 0px 1px #00000040;
        }

        .login-button, .search-place-button {
            background-color: #FFF;
            font-weight: var(--font-weight-700);
            transition: 0.4s;
        }

        .login-button:hover, .search-place-button:hover {
            color: #FFF;
            border: 1px solid var(--button-bg-color);
            background-color: var(--button-bg-color);
            box-shadow: none;
        }
        .about-us {
            margin-top: 5rem;
            padding: 1rem 5rem 0 5rem;
        }
        .how-to-use {
            padding: 1rem 5rem 0 5rem;
        }
        .brand-name {
            font-family: 'Roboto Slab', serif;
            font-size: 2rem;
            box-shadow: inset 0px -2px 0px 0px #42a5f5;
        }
        img.search-bar {
            width:100%;
            border:2px solid #424242;
            border-radius: .5rem;
        }
    </style>
</head>
<body>
    <main>
        <header>
            <div class="kairos-logo">
                καιρός
            </div>
            <div class="login" onclick="document.location='gotosubscribe'">
                <button class="btn login-button"><i class="fas fa-user-plus"></i> Subscribe</button>
            </div>
        </header>
        <div class="about-us">
            <h1>About <span class="brand-name"> καιρός (kairós) </span> </h1>
            <h2 style="font-weight: 400;">
                καιρός (kairós) is Greek Pronounciated Word. καιρός means Weather in Greek Language. καιρός is an Weather Monitoring Web Application which keeps tracking the weather and help in making you adapative for the weather.
                Weather prediction, To provide Day-to-Day information about weather forecasting to the user and the information about approaching Bad Weathers like Heavy Rains, High Temperatures in Summer, Storms etc.
            </h2>
        </div>

        <div class="how-to-use">
            <h1>How to understand the weather in <span class="brand-name"> καιρός (kairós) </span> ?</h1>
            <h2 style="font-weight: 400;"><i class="fas fa-dot-circle"></i> You can search the desired place (location) to know the weather information. As shown in below image.</h2>
            <img class="search-bar" src="pages/static/search-bar.png" alt="">
            <br>
            <br>
            <br>
            <h2 style="font-weight: 400;">
            <i class="fas fa-dot-circle"></i> These are the additional factors that you can use to know the atmosphere in your desired place.
            </h2>
            <h3 style="font-weight: 500;">Note: Scale Range is 0 - 10</h3>
            <h3 style="font-weight: 400;">1. Whether you can do cycling or not <b>||</b> Where Hight value is Good and least value is Poor.</h3>
            <h3 style="font-weight: 400;">2. Whether you can drive the vehicle during mist condition <b>||</b> Where Hight value is Good and least value is Poor.</h3>
            <h3 style="font-weight: 400;">3. Whether you can Jogging at that time which won't block your vaccum tubes <b>||</b> Where Hight value is Good and least value is Poor.</h3>
            <h3 style="font-weight: 400;">4. Whether the surrounding air is pollution free or not. So, You can respiration (Health) will not effect <b>||</b> Where Hight value is Poor and least value is Good.</h3>
            <h3 style="font-weight: 400;">5. Whether you can go for fishing or not. Sometime there might be chance of high tidals in sea <b>||</b> Where Hight value is Good and least value is Poor.</h3>
            <h3 style="font-weight: 400;">6. Whether you can plan any trip via Flights or not. Because of weather sometime there might be chance of delay <b>||</b> Where Hight value is Poor and least value is Good.</h3>
            <img class="search-bar" src="pages/static/additional-info.png" alt="">
            <br>
            <br>
            <br>
            <h2 style="font-weight: 400;"><i class="fas fa-dot-circle"></i> You can understand the temperature in the location (places) through this map. As shown in below image.</h2>
            <img class="search-bar" src="pages/static/map.png" alt="">
            <br>
            <br>
            <br>
            <h2 style="font-weight: 400;"><i class="fas fa-dot-circle"></i> You can also know the news regarding news. As shown in below image.</h2>
            <img class="search-bar" src="pages/static/news.png" alt="">
        </div>
        <br>
        <br>
</body>
</html>