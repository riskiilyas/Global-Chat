package com.riskee.globalchat.controller

import com.corundumstudio.socketio.AckRequest
import com.corundumstudio.socketio.SocketIOClient
import com.corundumstudio.socketio.SocketIOServer
import com.corundumstudio.socketio.listener.ConnectListener
import com.corundumstudio.socketio.listener.DataListener
import com.corundumstudio.socketio.listener.DisconnectListener
import com.fasterxml.jackson.databind.ObjectMapper
import com.riskee.globalchat.model.socket.Message
import com.riskee.globalchat.utill.Constants
import lombok.extern.log4j.Log4j2
import org.springframework.stereotype.Component

@Component
@Log4j2
class SocketIOController(
    private var socketIOServer: SocketIOServer
) : ConnectListener, DisconnectListener {

    init {
        socketIOServer.addConnectListener(::onConnect)
        socketIOServer.addDisconnectListener(::onDisconnect)
        socketIOServer.addEventListener(Constants.MESSAGE_EVENT, String::class.java, ::onSend)
        socketIOServer.addEventListener(Constants.JOIN_EVENT, String::class.java, ::onJoin)
    }

    override fun onConnect(client: SocketIOClient?) {
        if (client != null) {
            socketIOServer.broadcastOperations.sendEvent(
                Constants.JOIN_EVENT,
                client,
                client.get("user_join") ?: client.sessionId.toString()
            )
        }
        client!!.sendEvent(Constants.SUCCESS_EVENT)
    }

    override fun onDisconnect(client: SocketIOClient?) {
        socketIOServer.broadcastOperations.sendEvent(
            Constants.JOIN_EVENT,
            client,
            "DC: " + client?.sessionId.toString()
        )
    }

    fun onJoin(client: SocketIOClient, data: String, ackSender: AckRequest) {
        socketIOServer.broadcastOperations.sendEvent(
            Constants.JOIN_EVENT,
            client,
            data
        )
        ackSender.sendAckData("Message Sent!")
    }

    fun onSend(client: SocketIOClient, data: String, ackSender: AckRequest) {
        val mapper = ObjectMapper()
        socketIOServer.broadcastOperations.sendEvent(
            Constants.MESSAGE_EVENT,
            client,
            mapper.readValue(data, Message::class.java)
        )
        ackSender.sendAckData("Message Sent!")
    }
}