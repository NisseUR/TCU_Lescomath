import React from "react";
import ContentBox from './ContentBox.js';
import './Boxes.css'

function Boxes() {
  const repositories = [
    {
      boxName: "Números",
      boxUrl: "https://www.youtube.com/watch?v=0MQly46xEuk",
      levels: [
        {
          name: "Sétimo",
          topics: [
            { name: "Números Naturales", content: "  Operaciones: - Suma - Resta - Multiplicación - División - Potencias " },
          ],
        },
        {
          name: "Octavo",
          topics: [
            { name: "Fracciones", content: "Contenido de Fracciones..." },

          ],
        },

      ],
    },

  ];

  return (
    <div className="boxes_containers">
      {repositories.map(box => (
        <ContentBox key={box.boxName} repoName={box.boxName} repoUrl={box.boxUrl} levels={box.levels} />
      ))}
    </div>
  );
}

export default Boxes;
