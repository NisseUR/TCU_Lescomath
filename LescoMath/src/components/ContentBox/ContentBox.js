import React, { useState } from 'react';
import './ContentBox.css';

function Topic({ title, children, levelClass }) { // Añade levelClass a los props
  const [isOpen, setIsOpen] = useState(false);

  return (
    <div>
      <button className={`topic-title ${levelClass}`} onClick={() => setIsOpen(!isOpen)}>{title}</button>
      {isOpen && <div className={`topic-content ${levelClass}`}>{children}</div>}
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
            <Topic key={level.name} title={level.name} levelClass={`nivel-${level.name.toLowerCase()}`}>
              {level.topics.map((topic) => (
                <Topic key={topic.name} title={topic.name}>
                  <p>{topic.content}</p> {/* Considera agregar levelClass aquí si quieres aplicar estilos específicos a los contenidos */}
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
