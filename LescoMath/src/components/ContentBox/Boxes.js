import React from "react";
import ContentBox from './ContentBox.js';
import './Boxes.css'

function Boxes() {

    const repositories = [
      {boxName: "Números", boxUrl: "https://www.youtube.com/watch?v=0MQly46xEuk"}, 
    ];
  
    return (
      <div className="boxes_containers">
        <div className="box-container"> {/**/}
          {repositories.map(box => (
            <ContentBox key={box.boxName} repoName={box.boxName} repoUrl={box.boxUrl} />
          ))}
        </div>
      </div>
    );
  }
  
export default Boxes;