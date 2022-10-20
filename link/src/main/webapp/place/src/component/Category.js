import React, {useState} from "react";
import axios from "axios";
import '../style/Category.css';

const Category = ({map, mapApi, addPlace}) => {
	let service = new mapApi.places.PlacesService(map);
	let myService = new mapApi.places.PlacesService(map);

	const categories = [
		{ id : "myLocation", icon : "fas fa-map-marker"},
		{ id : "cafe", icon : "fas fa-coffee"},
		{ id : "restaurant", icon : "fas fa-utensils"},
		{ id : "hospital", icon : "fas fa-hospital"},
		{ id : "gas_station", icon : "fas fa-gas-pump"},
		{ id : "parking", icon : "fas fa-square-parking"}
	];

	const onClick = (e) => {
		searchByType(e.target.className);
	}

	const categoryList = categories.map((category, i) =>
		<button key = {i} className={category.id} onClick={onClick}>
			<i className={category.icon}></i>			
		</button>
	)

	const searchByType = (placeType) => {

		let request 

		if(placeType === "myLocation") {
			let lat, lng;
			if (navigator.geolocation) { // GPS를 지원하면
				navigator.geolocation.getCurrentPosition(function(position) {
					lat = position.coords.latitude;
					lng = position.coords.longitude;
					alert("현재위치");
					
					axios.get ('https://maps.googleapis.com/maps/api/geocode/json?latlng=' 
					+ lat +',' + lng + '&key=' + process.env.REACT_APP_GOOGLE_API_KEY).then((res) => {
						console.log(res.data.results[0].place_id);

						request = {
							placeId: res.data.results[0].place_id
						}

						myService.getDetails(request, showPlace);
						
					})
					
				}, function(error) {
					console.error(error);
				}, {
					enableHighAccuracy: false,
					maximumAge: 0,
					timeout: Infinity
				});

			} else {
				alert('GPS를 지원하지 않습니다');
				return;
			}
		} else {
			request = {
			location: map.getCenter(),
			radius: "250",
			type: [placeType],
			};

			service.nearbySearch(request, showPlace);
		}

    }

    const showPlace = (results, status) => {

            if (status === mapApi.places.PlacesServiceStatus.OK) {
                addPlace(results);
            } else {
            	alert("no results");
            }

    }

	return (
		<div className="category" id="category">
			{categoryList}
		</div>
	)
}

export default Category;