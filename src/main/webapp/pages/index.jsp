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
	<script src="https://api.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.js"></script>
    <link rel="stylesheet" href="pages/static/style.css">
    
    <c:if test="${empty WeatherData}">
    <style>
    .additional-values {
    	display: none;
    }
    </style>
   	</c:if>
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
        <div class="container">
            <div class="search-weather">
                <div class="seacrh-place-form">
                    <form action="searchLocation" method="POST" class="search-place">
                        <input type="search" name="location" id="id_place" value="${LocationData.get('City')}" placeholder="Search Location" required>
                        <button class="btn search-place-button" type="submit"><i class="fas fa-search-location"></i> Search</button>
                    </form>
                </div>
                <c:if test = "${not empty LocationData}">
	                <div class="place_name-current-temperature">
	                    <h4><i class="fas fa-map-marker-alt"></i> ${LocationData.get("City")}, ${LocationData.get("Country")} &#183; 
                      	    <c:choose>
							    <c:when test="${WeatherData.get('Temperature').get('current') > 312}">
							    	<i class="fas fa-temperature-high"></i>
								  </c:when>
								  <c:otherwise>
								 	<i class="fas fa-temperature-low"></i> 
								</c:otherwise>
							</c:choose>              
	                    <fmt:formatNumber type="number" maxFractionDigits="0" value="${WeatherData.get('Temperature').get('current') - 273.15}" /> &#8451;</h4>
	                </div>
		      	</c:if>
                <div class="additional-features">
                    <div class="box-one af-box">
                        <div class="af-icon"><i class="fas fa-biking"></i></div>
                        <div class="af-text">Cycling
                        <span class="additional-values">${100 - AdditionalForecasts.get('Bicycling').getInt('Value') * 10}</span>
                        </div>
                    </div>
                    <div class="box-two af-box">
                        <div class="af-icon"><i class="fas fa-truck-monster"></i></div>
                        <div class="af-text">Driving
                        <span class="additional-values">${100 - AdditionalForecasts.get('DrivingConditions').getInt('Value') * 10}</span>
                        </div>
                    </div>
                    <div class="box-three af-box">
                        <div class="af-icon"><i class="fas fa-running"></i></div>
                        <div class="af-text">Jogging
                        <span class="additional-values">${100 - AdditionalForecasts.get('Jogging').getInt('Value') * 10}</span>
                        </div>
                    </div>
                    <div class="box-four af-box">
                        <div class="af-icon"><i class="fas fa-lungs"></i></div>
                        <div class="af-text">Asthma
                        <span class="additional-values">${100 - AdditionalForecasts.get('Asthma').getInt('Value') * 10}</span>
                        </div>
                    </div>
                    <div class="box-five af-box">
                        <div class="af-icon"><i class="fas fa-water"></i></div>
                        <div class="af-text">Sea shore
                        <span class="additional-values">${100 - AdditionalForecasts.get('BeachAndPool').getInt('Value') * 10}</span>
                        </div>
                    </div>
                    <div class="box-six af-box">
                        <div class="af-icon"><i class="fas fa-plane-departure"></i></div>
                        <div class="af-text">Airplane
                        <span class="additional-values">${100 - AdditionalForecasts.get('FlightDelays').getInt('Value') * 10}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
        <iframe src="http://localhost:8080/weather" width="100%" height="280"></iframe>
        </div>
        <div class="weather-map-container">
            <div class="weather-map-header">
                <h2>World Weather Map (Temperature)</h2>
            </div>
            <div class="weather-map" id="map"></div>
        </div>
        <div class="second-container">
            <div class="weather-news">
                <h1 class="weather-news-title">Weather News</h1>
                <ul class="cards">
                    <li class="cards_item-weather-news">
                        <div class="weather-news-card card-width-100" onclick="document.location=''">
                            <div class="card_image weather-news-image">
                                <img src="pages/static/one.jpg" alt="" class="weather-news-image">
                            </div>
                            <div class="weather-news-card-content">
                                <h4 class="weather-news-card-title">Climate</h4>
                                <p class="weather-news-card-info">
                                2021: A year full of extreme weather events Vero, suscipit. Omnis, autem labore nobis in id ducimus laudantium distinctio voluptatem ut incidunt iure repudiandae nisi nemo eveniet tempora, fugit necessitatibus?
                                </p>
                                <p class="weather-news-card-date-time">Date & Time: 01st Jan 2022</p>
                            </div>
                        </div>
                    </li>
                </ul>
                <ul class="cards">
                    <li class="cards_item-weather-news">
                        <div class="weather-news-card card-width-100" onclick="document.location=''">
                            <div class="card_image weather-news-image">
                                <img src="pages/static/two.jpg" alt="" class="weather-news-image">
                            </div>
                            <div class="weather-news-card-content">
                                <h4 class="weather-news-card-title">Weather News</h4>
                                <p class="weather-news-card-info">
                                Snowstorm to aid in Colorado firefighting efforts Vero, suscipit. Omnis, autem labore nobis in id ducimus laudantium distinctio voluptatem ut incidunt iure repudiandae nisi nemo eveniet tempora, fugit necessitatibus?
                                </p>
                                <p class="weather-news-card-date-time">Date & Time: 28th Dec 2021</p>
                            </div>
                        </div>
                    </li>
                </ul>
                <ul class="cards">
                    <li class="cards_item-weather-news">
                        <div class="weather-news-card card-width-100" onclick="document.location=''">
                            <div class="card_image weather-news-image">
                                <img src="pages/static/three.jpg" alt="" class="weather-news-image">
                            </div>
                            <div class="weather-news-card-content">
                                <h4 class="weather-news-card-title">SEVERE WEATHER</h4>
                                <p class="weather-news-card-info">
                                Terrifying video shows moment man is struck by lightning Omnis, autem labore nobis in id ducimus laudantium distinctio voluptatem ut incidunt iure repudiandae nisi nemo eveniet tempora, fugit necessitatibus?
                                </p>
                                <p class="weather-news-card-date-time">Date & Time: 31st Dec 2021</p>
                            </div>
                        </div>
                    </li>
                </ul>
                <ul class="cards">
                    <li class="cards_item-weather-news">
                        <div class="weather-news-card card-width-100" onclick="document.location=''">
                            <div class="card_image weather-news-image">
                                <img src="pages/static/four.jpg" alt="" class="weather-news-image">
                            </div>
                            <div class="weather-news-card-content">
                                <h4 class="weather-news-card-title">WINTER WEATHER</h4>
                                <p class="weather-news-card-info">
                                Snow, freeze-up to follow severe weather in part of southern US autem labore nobis in id ducimus laudantium distinctio voluptatem ut incidunt iure repudiandae nisi nemo eveniet tempora, fugit necessitatibus?
                                </p>
                                <p class="weather-news-card-date-time">Date & Time: 01st Jan 2022</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="climate-weather-awareness">
                <h1 class="climate-weather-awareness-title">Climate & Weather Awareness</h1>
                <ul class="cards"> 
                    <li class="cards_item cards_item-climate-weather-awareness">
                      <div class="card create_course_card" onclick="document.location=''">
                        <div class="card_image climate-weather-awareness-image">
                            <img src="pages/static/five.jpg" alt="">
                        </div>
                        <div class="card_content">
                          <h2 class="create_card_title">2021's most impactful weather moments from around the world</h2>
                          <p class="card_text">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis, impedit delectus, natus temporibus voluptate magni beatae laudantium cupiditate harum nesciunt suscipit maxime saepe. Ab et minus voluptatibus minima consequatur nesciunt.
                          </p>
                        </div>
                      </div>
                    </li>
                    <li class="cards_item cards_item-climate-weather-awareness">
                      <div class="card create_course_card" onclick="document.location=''">
                        <div class="card_image climate-weather-awareness-image">
                            <img src="pages/static/six.jpg" alt="">
                        </div>
                        <div class="card_content">
                          <h2 class="create_card_title">Dangerous flooding and severe storms will erupt this weekend</h2>
                          <p class="card_text">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis, impedit delectus, natus temporibus voluptate magni beatae laudantium cupiditate harum nesciunt suscipit maxime saepe. Ab et minus voluptatibus minima consequatur nesciunt.
                          </p>
                        </div>
                      </div>
                    </li>
                    <li class="cards_item cards_item-climate-weather-awareness">
                      <div class="card create_course_card" onclick="document.location=''">
                        <div class="card_image climate-weather-awareness-image">
                            <img src="pages/static/seven.jpg" alt="">
                        </div>
                        <div class="card_content">
                          <h2 class="create_card_title">Winter storm warnings issued as heavy snow looms for central US</h2>
                          <p class="card_text">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis, impedit delectus, natus temporibus voluptate magni beatae laudantium cupiditate harum nesciunt suscipit maxime saepe. Ab et minus voluptatibus minima consequatur nesciunt.
                          </p>
                        </div>
                      </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="detailed-location-info">
            <i class="fas fa-map-marked-alt"></i> &nbsp; 
            <c:choose>
			    <c:when test="${empty LocationData}">
			    	Asia Continent > India
				  </c:when>
				  <c:otherwise>
				 	${LocationData.get("Country")} > ${LocationData.get("District")} > ${LocationData.get("City")}
				</c:otherwise>
			</c:choose>
        </div>
        
        <footer>
            <div class="kairos-about">
                <h3>καιρός - Weather Monitoring App</h3>
                <div class="kairos-abour-links">
                    <a href="about">About Kairos</a>
                    <a href="#">Contact Us</a>
                </div>
            </div>
            <div class="subscription-services">
                <h3>Subscription & Services</h3>
                <div class="subscription-services-links">
                    <a href="gotosubscribe">Weather Forecasts Info Email</a>
                    <a href="gotosubscribe">Climate Change - Pandemic Alerts</a>
                </div>
            </div>
            <div class="kairos-disclaimer-info">
                <div class="kairos-rights">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto iure corrupti facere beatae dolores hic quod! Excepturi in, pariatur, saepe aliquid, iure laudantium consequuntur commodi modi ipsum sit at accusamus.</p>
                </div>
                <div class="kairos-disclaimer-links">
                    <a href="#">Terms of Use</a>
                    <a href="#">Privacy Policy</a>
                    <a href="#">Cookie Policy</a>
                </div>
            </div>
        </footer>
    </main>
    <script>
	    mapboxgl.accessToken = 'pk.eyJ1IjoiNHByb2p0ZXN0IiwiYSI6ImNreG1xajBjZTFzdzgycXViMGY2cmppcWcifQ.Y2t3JnmjLFNWFBBNHiVdCw';
	    const map = new mapboxgl.Map({
	    container: 'map',
	    style: 'mapbox://styles/mapbox/streets-v11',
	    <c:choose>
		    <c:when test="${empty LocationData}">
		    	center: [81.959, 16.93],
			  </c:when>
			  <c:otherwise>
			  	center: [${LocationData.get("Longitude")}, ${LocationData.get("Latitude")}],
			</c:otherwise>
		</c:choose>
	    zoom: 2
	    });
	    
	    const marker1 = new mapboxgl.Marker()
   	    <c:choose>
		    <c:when test="${empty LocationData}">
		    	.setLngLat([81.959, 16.93])
			  </c:when>
			  <c:otherwise>
			 	.setLngLat([${LocationData.get("Longitude")}, ${LocationData.get("Latitude")}])
			</c:otherwise>
		</c:choose>
	    .addTo(map);
        const popup = new mapboxgl.Popup({ closeOnClick: false })
   	    <c:choose>
		    <c:when test="${empty LocationData}">
		    	.setLngLat([81.959, 16.93])
		    	.setHTML('<p>Anaparthy</p>')
			  </c:when>
			  <c:otherwise>
			 	.setLngLat([${LocationData.get("Longitude")}, ${LocationData.get("Latitude")}])
			 	.setHTML('<p>${LocationData.get("City")}</p>')
			</c:otherwise>
		</c:choose>
        .addTo(map);

        map.on('load', function(){
            map.addLayer({
                "id": "simple-tiles",
                "type": "raster",
                "source": {
                "type": "raster",
                "tiles": ["https://tile.openweathermap.org/map/temp_new/{z}/{x}/{y}.png?appid=874718354841f0e0250b4b06a05a971e"],
                "tileSize": 256
                },
                "minzoom": 0,
                "maxzoom": 22
            });
        });
    </script>
</body>
</html>