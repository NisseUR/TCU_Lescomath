import React from "react";
import ContentBox from './ContentBox.js';
import './Boxes.css';

function Boxes() {
  const repositories = [
    {
      boxName: "Números",
      boxUrl: "https://www.youtube.com/watch?v=0MQly46xEuk",
      topics: [
        "Números Naturales",
        "Operaciones: Suma, Resta, Multiplicación, División, Potencias",
        "Combinación de operaciones",
        // ... más temas ...
      ],
    },
    {
      boxName: "Fracciones",
      boxUrl: "https://www.youtube.com/watch?v=xxxxx",
      topics: [
        "Concepto de fracción",
        "Suma y resta de fracciones",
        // ... más temas ...
      ],
    },
    // ... más cajas ...
  ];

  return (
    <div className="boxes_containers">
      <div className="box-container">
        {repositories.map((box, index) => (
          <ContentBox key={index} repoName={box.boxName} repoUrl={box.boxUrl} topics={box.topics} />
        ))}
      </div>
    </div>
  );
}

export default Boxes;
