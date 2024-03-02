import React, { useState } from 'react';
import './ContentBox.css';

function ContentBox({ repoName, repoUrl, topics }) {
  const [showDetails, setShowDetails] = useState(false);

  const handleToggleDetails = () => {
    setShowDetails(!showDetails);
  };

  return (
    <div className="content-box">
      <h2>{repoName}</h2>
      <a href={repoUrl} target="_blank" rel="noopener noreferrer">Abrir el video</a>
      <button onClick={handleToggleDetails}>Mostrar Temas</button>
      {showDetails && (
        <div className="topic-details">
          <ul>
            {topics.map((topic, index) => (
              <li key={index}>{topic}</li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
}

export default ContentBox;

