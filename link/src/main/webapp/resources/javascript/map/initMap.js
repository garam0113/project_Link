let map;
let center;

window.initAutocomplete = function() {
	map = new google.maps.Map(document.getElementById("map"), {
		center : { lat : 37.5780721, lng : 126.9662211 },
		zoom : 13,
		mapTypeId : "roadmap",
	});
	
	searchBox();
	searchBtn();
};

function searchBox() {
	
	const input = document.getElementById("pac-input");
	const searchBox = new google.maps.places.SearchBox(input);
	
	map.addListener("bounds_changed", function() {
		searchBox.setBounds(map.getBounds());
	});
	
	let markers = [];
	
	searchBox.addListener("places_changed", () => {
		const places = searchBox.getPlaces();

		if (places.length == 0) {
			return;
		}

		// Clear out the old markers.
		markers.forEach((marker) => {
			marker.setMap(null);
		});
		markers = [];

		// For each place, get the icon, name and location.
		const bounds = new google.maps.LatLngBounds();

		places.forEach((place) => {
			if (!place.geometry || !place.geometry.location) {
				console.log("Returned place contains no geometry");
				return;
			}

			const icon = {
				url: place.icon,
				size: new google.maps.Size(71, 71),
				origin: new google.maps.Point(0, 0),
				anchor: new google.maps.Point(17, 34),
				scaledSize: new google.maps.Size(25, 25),
			};

			// Create a marker for each place.
			markers.push(
				new google.maps.Marker({
					map,
					icon,
					title: place.name,
					position: place.geometry.location,
				})
			);
			if (place.geometry.viewport) {
				// Only geocodes have viewport.
				bounds.union(place.geometry.viewport);
			} else {
				bounds.extend(place.geometry.location);
			}
		});
		map.fitBounds(bounds);

	});
}

function searchBtn() {
	if(searchBar) {
		console.log("searchBar is define");
		
		center = new google.maps.LatLng(37.5780721, 126.9662211);
		map.addListener("center_changed", function() {
			center = map.getCenter();
		});
	}
}

function showCafe() {
	let request = {
		location : center,
		radius : "500",
		type : ["cafe"],
	};
	
	service = new google.maps.places.PlacesService(map);
	service.nearbySearch(request, callback);
}

function callback(results, status) {
	if(status == google.maps.places.PlacesServiceStatus.OK) {
		for(var i = 0 ; i < results.length ; i++){
			makePlaceMarker(results[i]);
		}
	} else {
		alert("no results");
	}
}

function makePlaceMarker(place) {
	console.log(place);
	
	if(!place.geometry) {
		console.log("returned place contains no geometry");
		return;
	}
	
	let bounds = new google.maps.LatLngBounds();
	
	const icon = {
		url: place.icon,
		size: new google.maps.Size(71, 71),
		origin: new google.maps.Point(0, 0),
		anchor: new google.maps.Point(17, 34),
		scaledSize: new google.maps.Size(25, 25),
	};
	
	markers.push(
		new google.maps.Marker({
			map : map,
			icon : icon,
			title : place.name,
			position : place.geometry.location,
		})
	);
	
	if (place.geometry.viewport) {
		// Only geocodes have viewport.
		bounds.union(place.geometry.viewport);
	} else {
		bounds.extend(place.geometry.location);
	}
	
	map.fitBounds(bounds);
}