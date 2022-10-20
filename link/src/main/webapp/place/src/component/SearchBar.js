import React, {useState} from "react"
import Category from './Category';
import "../style/SearchBar.css";

class SearchBar extends React.Component{

    render(){
        return (
                <div className="searchBar">
                    <div id="mainLogo">
                        <img
                        src="/logo.png"
                        alt="place-now logo"
                        />
                    </div>

                    <input
                        id="pac-input"
                        className="controls"
                        type="text"
                        placeholder="Search Box"
                        ref={(ref)=> this.input = ref}
                    />

                    <Category
                        map={this.props.map}
                        mapApi={this.props.mapApi}
                        addPlace={this.props.addPlace}>
                    </Category>
                </div>
            
        )
    }

    onPlacesChanged = ({map, mapApi, addPlace}= this.props) => {
        const selected = this.searchBox.getPlaces();
        
        let bounds = new mapApi.LatLngBounds();

        selected.forEach((place) => {
            if (!place.geometry) return;

            if (place.geometry.viewport) {
                bounds.union(place.geometry.viewport);
            } else {
                bounds.extend(place.geometry.location);
            }
        })
        
        map.fitBounds(bounds);
        addPlace(selected);
    }

    componentDidMount({ map, mapApi} = this.props ) {
        this.searchBox = new mapApi.places.SearchBox(this.input);

        // searchBox에서 장소 선택 시, 이벤트 발생
        this.searchBox.addListener('places_changed', this.onPlacesChanged);

        // seachBox 결과가 map화면에 보여지며 해당 위치로 viewport가 이동
        this.searchBox.bindTo('bounds', map);
    }

    componentWillUnmount({mapApi} = this.props) {
        mapApi.event.clearInstanceListeners(this.input);
    }

}

export default SearchBar;