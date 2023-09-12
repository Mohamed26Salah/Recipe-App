import React from 'react'
import {Routes, Route} from 'react-router-dom'
import Home from './screens/home'
import Search from './screens/search'

const AppRoutes = () => {
    return <Routes>
    <Route path='/' element={<Home/>} />
    <Route path='/search' element={<Search/>} />
  </Routes>
}

export default AppRoutes