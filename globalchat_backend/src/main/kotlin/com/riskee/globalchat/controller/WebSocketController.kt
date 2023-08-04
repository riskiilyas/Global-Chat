//package com.riskee.globalchat.controller
//
//import com.riskee.globalchat.model.socket.Message
//import lombok.extern.log4j.Log4j2
//import org.springframework.messaging.handler.annotation.MessageMapping
//import org.springframework.messaging.handler.annotation.SendTo
//import org.springframework.stereotype.Component
//import org.springframework.stereotype.Controller
//import org.springframework.web.util.HtmlUtils
//import java.util.*
//
//
//@Controller
//class WebSocketController {
//
//    @MessageMapping("/message")
//    @SendTo("/receive/message")
//    fun getMessage(message: String): String {
//        println("recived message : $message")
//        return HtmlUtils.htmlEscape(message)
//    }
//
//}