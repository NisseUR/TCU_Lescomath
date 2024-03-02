import React, { useState } from 'react';
import './MainSearchBar.css'; 

function MainSearchBar({ onSearch }) {
  const [searchTerm, setSearchTerm] = useState('');

  const handleSubmit = (event) => {
    event.preventDefault();
    // lógica para buscar temas
    console.log(searchTerm);
  };

  return (
    <form onSubmit={handleSubmit} className="search-bar">
      <input
        type="text"
        className="search-input"
        placeholder="Buscar" // texto que aparece en la barra de busqueda
        value={searchTerm}
        onChange={e => setSearchTerm(e.target.value)}
      />
      <button type="submit" className="search-button">
        Enter
      </button>
    </form>
  );
}

export default MainSearchBar;