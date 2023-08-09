package com.riskee.globalchat.controller

import com.riskee.globalchat.model.socket.Message
import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.SendTo
import org.springframework.stereotype.Controller
import java.util.*


@Controller
class WebSocketController {

    @MessageMapping("/hello")
    @SendTo("/topic/greetings")
    fun greeting(message: Message): Message? {
        Thread.sleep(1000)
        return Message("Hello, " + message.username + "!")
    }

    @MessageMapping("/chat")
    @SendTo("/topic/chat")
    fun greeting2(msg: String): String? {
        println(msg)
//        Thread.sleep(1000)
        return msg;
    }

}