import React from 'react';
import InfoWindow from './InfoWindow'
import styled from 'styled-components';

const Wrapper = styled.div`
  position: absolute;
  top: 50%;
  left: 50%;
  width: fit-content;
  height: fit-content;
  user-select: none;
  transform: translate(-50%, -90%);
  z-index: ${(props) => (props.target ? 999 : -1)};
  
`;


const Marker = ({ text, target, place }) => {
  let icon = target ? { name : "icon_dot", width : "10px" } : { name :"icon_default", width : "40px" };

  return (
    
    <div>
    {target && <InfoWindow place={place}/>}
    <Wrapper
      className="marker"
      name = {place.name}
      alt={text}>
          <img src="point.jpg" alt={text} width={icon.width}/>
    </Wrapper>
    </div>
  );
}



export default Marker;