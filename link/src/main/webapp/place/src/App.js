import React, {useState} from 'react';
import GoogleMap from 'google-map-react';
import SearchBar from './component/SearchBar';
import Marker from './component/Marker';

import './App.css';
import './style/Map.css'

const App = props => {
    // state 설정 및 초기화
    const [apiReady, setApiReady] = useState(false);
    const [map, setMap] = useState(null);
    const [googlemaps, setGooglemaps] = useState(null);
    const [center, setCenter] = useState({ lat: 37.5, lng: 127 });
    const [places, setPlaces] = useState([]);
    const [place, setPlace] = useState();

    // click Marker
    const [target, setTarget] = useState(null);

    let zoom = 10;

    if(window.screen.width >= 768){
        zoom = 15;
    }
    
    const handleApiLoaded = (map, maps) => {
      // map과 maps 개체가 로드됐다면, 각각의 state값에 넣어준다
        if (map && maps) {
          setApiReady(true);
          setMap(map);
          setGooglemaps(maps);
        }
    };

    const myPlace = (places) => {
      let bounds = new googlemaps.LatLngBounds();

      if (!places.geometry) return;

      if (places.geometry.viewport) {
          bounds.union(places.geometry.viewport);
      } else {
          bounds.extend(places.geometry.location);
      }

      map.fitBounds(bounds);
      
    };

    const onPlaceChanged = (places) => {
      let bounds = new googlemaps.LatLngBounds();

      places.forEach((place)=>{
      if (!place.geometry) return;

      if (place.geometry.viewport) {
          bounds.union(place.geometry.viewport);
      } else {
          bounds.extend(place.geometry.location);
      }

      })

      map.fitBounds(bounds);

    };

    const markerClicked = (key) => {
      setTarget(key);
    }

    const addPlace = (places) => {
      if(places) {

        if(!places.length) {
          setPlace(places);
          myPlace(places);
        } else {
          setPlaces(places);
          onPlaceChanged(places);
        }
      }
    };

    return(
        <div className="container" style={{ height: '100vh'}}>
          <div className='left-navbar'>
          {apiReady && googlemaps && (
          <SearchBar 
          map={map}
          mapApi={googlemaps}
          addPlace={addPlace}
          />)}
          </div>
          <div className='content'>
            <div className = "googleMap">
                <GoogleMap
                bootstrapURLKeys={{ 
                    key: process.env.REACT_APP_GOOGLE_API_KEY,
                    libraries: ['places'], }}
                defaultZoom={zoom}
                center={center}

                yesIWantToUseGoogleMapApiInternals

                onChildClick={markerClicked}

                onGoogleApiLoaded={({ map, maps }) => handleApiLoaded(map, maps)}
                >
                
                {places.length !== 0  && (places.map((place) => {
                    console.log("첫번째");
                    return (
                      <Marker
                        key={place.place_id}
                        text={place.name}
                        lat={place.geometry.location.lat()}
                        lng={place.geometry.location.lng()}
                        target={place.place_id === target}
                        place={place}
                      />
                    )}
                    
                    ))
                    
                }

                </GoogleMap>
            </div>
        </div>
      </div>        
    )
}

export default App;