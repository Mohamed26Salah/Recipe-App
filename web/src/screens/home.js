import React from 'react'
import '../css/home.css' 
import { Link } from 'react-router-dom'

const Home = () => {
    return (
        <div className="home-container">
           <div className="information-container">
                <h1>Let's cook good <br /> food</h1>
                <h2>Check out the app and start cooking <br /> delicious meals!</h2>
           </div>
           <div className='get-started-container'>
                <h2>Click on the get started button in order to view more</h2>
                <Link to='/search' className='start-button'>Get started</Link>
           </div>
            
        </div>
    )
}

export default Home