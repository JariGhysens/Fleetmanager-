import React from 'react'

const handleBestuurders = () => {
    window.location.href = '/NieuwSchermBestuurders';
    
}
const BestuurdersButton = () => {
  return (
    <button  className='buttons'  onClick={handleBestuurders} >Bestuurders</button>
  )
}

export default BestuurdersButton