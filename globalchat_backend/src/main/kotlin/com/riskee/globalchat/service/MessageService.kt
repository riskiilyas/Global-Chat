package com.riskee.globalchat.service

import org.springframework.messaging.simp.SimpMessagingTemplate
import org.springframework.stereotype.Service


@Service
class MessageService(private val messagingTemplate: SimpMessagingTemplate) {
    fun sendRandomQuestion(message: String?) {
        messagingTemplate.convertAndSend("topic/ping", message!!)
    }
}