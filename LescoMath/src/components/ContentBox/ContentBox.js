import React from 'react';
import './ContentBox.css'

function ContentBox({ repoName, repoUrl }) {
  return (
    <div className="content-box">
      <h2>{repoName}</h2>
      <a href={repoUrl} target="_blank" rel="noopener noreferrer">Abrir el video</a>
    </div>
  );
}

export default ContentBox;