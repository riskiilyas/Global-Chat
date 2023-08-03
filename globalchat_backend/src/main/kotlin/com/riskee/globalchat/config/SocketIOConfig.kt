package com.riskee.globalchat.config

import com.corundumstudio.socketio.Configuration
import com.corundumstudio.socketio.SocketIOServer
import lombok.extern.log4j.Log4j2
import org.springframework.beans.factory.annotation.Value
import org.springframework.context.annotation.Bean
import org.springframework.stereotype.Component
import org.springframework.web.bind.annotation.CrossOrigin


@CrossOrigin
@Component
@Log4j2
class SocketIOConfig {
    @Value("\${socket.host}")
    private val SOCKETHOST: String? = null

    @Value("\${socket.port}")
    private val SOCKETPORT = 0
    private lateinit var server: SocketIOServer

    @Bean
    fun socketIOServer(): SocketIOServer {
        val config = Configuration()
        config.hostname = SOCKETHOST
        config.port = SOCKETPORT
        server = SocketIOServer(config)
        server.start()
        server.addConnectListener {
            println("new user connected with socket " + it.sessionId);
        }

        server.addDisconnectListener {
            it.namespace.allClients.stream().forEach { client ->
                println("user disconnected " + client.sessionId.toString());
            }
        }

        return server
    }
}