import React, { useState } from 'react';
import './ContentBox.css';

// Un nuevo componente para manejar los temas dentro de cada nivel
function Topic({ title, children }) {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <div>
      <button className="topic-title" onClick={() => setIsOpen(!isOpen)}>{title}</button>
      {isOpen && <div className="topic-content">{children}</div>}
    </div>
  );
}

function ContentBox({ repoName, repoUrl, levels }) {
  const [showDetails, setShowDetails] = useState(false);

  return (
    <div className="content-box">
      <h2>{repoName}</h2>
      <a href={repoUrl} target="_blank" rel="noopener noreferrer">Abrir el video</a>
      <button onClick={() => setShowDetails(!showDetails)}>Mostrar Niveles</button>
      {showDetails && (
        <div className="level-container">
          {levels.map((level) => (
            <Topic key={level.name} title={level.name}>
              {level.topics.map((topic) => (
                <Topic key={topic.name} title={topic.name}>
                  {/* Aquí iría el contenido del tema, como texto o componentes adicionales */}
                  <p>{topic.content}</p>
                </Topic>
              ))}
            </Topic>
          ))}
        </div>
      )}
    </div>
  );
}

export default ContentBox;
