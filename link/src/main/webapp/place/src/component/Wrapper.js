import React from 'react';

const Wrapper = ({className, alt, icon}) => {
    
    return (
        <img className={className} src="point.jpg" alt={alt} width={icon.width}/>
    )
}
 
export default Wrapper;