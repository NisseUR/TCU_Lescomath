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
            { name: "Números Naturales", content: "Operaciones: - Suma - Resta - Multiplicación - División - Potencias " },
            
            { name: "Combinación de operaciones", content: "Operaciones: - Suma - Resta - Multiplicación - División - Potencias " },
          
            { name: "Teoría de números", content: "Operaciones: - Suma - Resta - Multiplicación - División - Potencias " },
          
            
          ],
        },
        {
          name: "Octavo",
          topics: [
            { name: "Números racionales ", content: "Concepto de número racional, Representaciones, Relaciones de orden" },
          ],
        },
        {
          name: "Noveno",
          topics: [
            { name: "Números reales", content: "Números irracionales, Concepto de número real, Representaciones, Comparación, Relaciones de orden, Recta numérica" },
          ],
        },
      ],
    },


    {
      boxName: "Geometría",
      boxUrl: "https://www.youtube.com/watch?v=URL_DEL_VIDEO_GEOMETRIA",
      levels: [
        {
          name: "Sétimo",
          topics: [
            { name: "Punto", content: "Puntos colineales y no colineales, Puntos coplanares y no coplanares, Punto medio" },
            { name: "Recta", content: "Segmento, Semirrecta, Rayo, ..." },
            // Agrega más temas según sea necesario
          ],
        },
        {
          name: "Octavo",
          topics: [
            { name: "Transformaciones en el plano", content: "Homotecias" },
            { name: "Visualización Espacial", content: "Pirámide recta " },
            // Agrega más temas según sea necesario
          ],
        },
        {
          name: "Noveno",
          topics: [
            { name: "Triángulos", content: "Teorema de Pitágoras" },
          ],
        },
      ],
    },


    {
      boxName: "Relaciones y Álgebra",
      boxUrl: "https://www.youtube.com/watch?v=0MQly46xEuk",
      levels: [
        {
          name: "Sétimo",
          topics: [
            { name: "Números Naturales", content: "Operaciones: - Suma - Resta - Multiplicación - División - Potencias " },
          ],
        },
        {
          name: "Octavo",
          topics: [
            { name: "Números racionales ", content: "Concepto de número racional, Representaciones, Relaciones de orden" },
          ],
        },
        {
          name: "Noveno",
          topics: [
            { name: "Números reales", content: "Números irracionales, Concepto de número real, Representaciones, Comparación, Relaciones de orden, Recta numérica" },
          ],
        },
      ],
    },


    {
      boxName: "Estadística y Probabilidad ",
      boxUrl: "https://www.youtube.com/watch?v=0MQly46xEuk",
      levels: [
        {
          name: "Sétimo",
          topics: [
            { name: "Números Naturales", content: "Operaciones: - Suma - Resta - Multiplicación - División - Potencias " },
          ],
        },
        {
          name: "Octavo",
          topics: [
            { name: "Números racionales ", content: "Concepto de número racional, Representaciones, Relaciones de orden" },
          ],
        },
        {
          name: "Noveno",
          topics: [
            { name: "Números reales", content: "Números irracionales, Concepto de número real, Representaciones, Comparación, Relaciones de orden, Recta numérica" },
          ],
        },
      ],
    },

  
  ];

  return (
    <div className="boxes_containers">
      {repositories.map((box, index) => (
        <ContentBox key={index} repoName={box.boxName} repoUrl={box.boxUrl} levels={box.levels} />
      ))}
    </div>
  );
}

export default Boxes;
