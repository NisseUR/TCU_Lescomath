import { useState } from 'react'
import './App.css'
import { Button, Card, Container, Form, Icon } from 'semantic-ui-react'
import io from 'socket.io-client'
import Chat from './Chat'

const socket = io.connect("http://localhost:3001")

function App() {
  const [username, setUsername] = useState("")
  const [room, setRoom] = useState("")
  const [showChat, setShowChat] = useState(false)

  const joinRoom = () => {
    if (username !== "" && room !== "") {
      socket.emit("join_room", room)
      setShowChat(true)
    }
  }

  return (
    <Container>
      {!showChat ? (
        <Card fluid>
          <Card.Content header='Unirme a un Chat de Grupo' />
          <Card.Content>
            <Form>
              <Form.Field>
                <label>Nombre de usuario:</label>
                <input
                  type="text"
                  placeholder='Ejemplo: Kevin Rojas'
                  onChange={e => setUsername(e.target.value)}
                />
              </Form.Field>
              <Form.Field>
                <label>Número de Grupo:</label>
                <input
                  type="text"
                  placeholder='Ejemplo: Grupo 1'
                  onChange={e => setRoom(e.target.value)}
                />
              </Form.Field>
              <Form.Field style={{ display: 'flex', alignItems: 'center' }}>
                <Button onClick={joinRoom}>Unirse al Chat</Button>
              </Form.Field>
            </Form>
          </Card.Content>
          <Card.Content extra>
          </Card.Content>
        </Card>
      ) : (
        // Aquí pasamos setShowChat como prop al componente Chat
        <Chat socket={socket} username={username} room={room} setShowChat={setShowChat} />
      )}
    </Container>
  )
}

export default App




