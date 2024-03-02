import React, { useState, useEffect, useRef } from "react";
import ScrollToBottom from 'react-scroll-to-bottom'
import { Card, Form, Input, CardContent, Container, Message, Button } from 'semantic-ui-react';

const Chat = ({ socket, username, room, setShowChat }) => {
    const [currentMessage, setCurrentMessage] = useState("");
    const [messageList, setMessageList] = useState([]);
    const inputRef = useRef(null);
    const messagesContainerRef = useRef(null);
    const messagesEndRef = useRef(null);

    const sendMessage = async () => {
        if (username && currentMessage) {
            const now = new Date();
            const hours = now.getHours();
            const minutes = String(now.getMinutes()).padStart(2, '0');

            const info = {
                message: currentMessage,
                room,
                author: username,
                time: `${hours}:${minutes}`,
            };

            await socket.emit("send_message", info);
            setMessageList((list) => [...list, info]);
            setCurrentMessage("");
        }
    };

    useEffect(() => {
        if (!socket) return;

        const receiveMessageHandler = (data) => {
            setMessageList((list) => [...list, data]);
            scrollToBottom();
        };

        socket.on("receive_message", receiveMessageHandler);

        return () => {
            socket.off("receive_message", receiveMessageHandler);
        };
    }, [socket]);

    const handleInputChange = (e) => {
        setCurrentMessage(e.target.value);
        // Autoajustar la altura del cuadro de texto al contenido
        inputRef.current.style.height = "auto";
        inputRef.current.style.height = inputRef.current.scrollHeight + "px";
    };

    const scrollToBottom = () => {
        messagesEndRef.current.scrollIntoView({ behavior: "smooth" });
    };

    // Función para volver a la pantalla de selección de sala de grupo
    const returnToRoomSelection = () => {
        setShowChat(false);
    };

    return (
        <Container>
            <Card fluid>
                <Card.Content style={{ backgroundColor: "green" }}>
                    <h2 style={{ textAlign: "center" }}>Chat | Sala: {room}</h2>
                </Card.Content>
                <ScrollToBottom>
                    <Card.Content style={{ height: "800px", overflowY: "auto", padding: "5px" }} ref={messagesContainerRef}>
                        {messageList.map((item, index) => (
                            <Message
                                success={item.author === username}
                                content={
                                    <>
                                        <div style={{ fontSize: "0.8em", textAlign: "left" }}>
                                            {item.author === username ? "Tú" : item.author} - {item.time}
                                        </div>
                                        <div style={{ wordWrap: 'break-word' }}>{item.message}</div>
                                    </>
                                }
                                key={index}
                                style={{ float: item.author === username ? 'right' : 'left', clear: "both", maxWidth: "70%" }}
                                size="tiny"
                            />
                        ))}
                        <div ref={messagesEndRef} />
                    </Card.Content>
                </ScrollToBottom>
                <Card.Content extra>
                    <Form>
                        <Form.Field style={{ display: 'flex', alignItems: 'center' }}>
                            <Input
                                action={{
                                    icon: 'send',
                                    content: 'Enviar',
                                    onClick: sendMessage
                                }}
                                type="text"
                                placeholder="Mensaje..."
                                value={currentMessage}
                                onChange={handleInputChange}
                                style={{ width: "calc(100% - 100px)", maxWidth: "calc(100% - 100px)" }}
                                ref={inputRef}
                            />
                            <Button onClick={returnToRoomSelection} color='red'>Regresar</Button>
                        </Form.Field>
                    </Form>
                </Card.Content>
            </Card>
        </Container>
    );
};

export default Chat;
























