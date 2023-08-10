package com.riskee.globalchat.controller

import com.riskee.globalchat.service.UserDisconnectService
import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.SendTo
import org.springframework.messaging.simp.SimpMessageHeaderAccessor
import org.springframework.stereotype.Controller
import java.lang.StringBuilder

@Controller
class WebSocketController(
    userDisconnectService: UserDisconnectService
) {
    private val onlineUsers = mutableMapOf<String, String>()
    init {
        userDisconnectService.addCallback {
            onlineUsers.remove(it)
        }
    }

    @MessageMapping("/chat")
    @SendTo("/topic/chat")
    fun sendMsg(msg: String): String? {
        println(msg)
        return msg;
    }

    @MessageMapping("/join")
    @SendTo("/topic/join")
    fun userJoin(msg: String, headerAccessor: SimpMessageHeaderAccessor): String? {
        val sessionId = headerAccessor.sessionId
        sessionId?.apply {
            println("id: $sessionId | uname: $msg")
            onlineUsers[sessionId] = msg
            return msg;
        }
        return null
    }

    @MessageMapping("/online")
    @SendTo("/topic/online")
    fun usersOnline(msg: String): String? {
        val str = StringBuilder()
        onlineUsers.forEach { (key, uname) ->
            str.append("$uname|")
        }
        println(str)
        return str.toString()
    }
}