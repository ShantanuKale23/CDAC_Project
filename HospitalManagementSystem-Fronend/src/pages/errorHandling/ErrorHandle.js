import React from 'react'
import { Link } from 'react-router-dom'

const ErrorHandle = () => {
  return (
    <div >
      <div style={{color:"red",backgroundColor:"white",fontSize:"100px"}}>Please authorise !!</div>
     
     
     <a style={{fontSize:"30px",color:"black",fontWeight:"bold"}} href="/">click to authorise</a>
    
    
    
    </div>
    
  )
}

export default ErrorHandle