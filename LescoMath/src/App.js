import React from 'react';
import MainTitle from './components/MainTitle/MainTitle.js'; 
import MainSearchBar from './components/MainSearchBar/MainSearchBar.js';
import Boxes from './components/ContentBox/Boxes.js';
import './App.css'

function App() {
  return (
    <div className="App">
      <MainTitle />
      <MainSearchBar onSearch={searchTerm => console.log(searchTerm)} />
      <Boxes />
    </div>
  );
}

export default App;