package com.riskee.globalchat.service

import org.springframework.messaging.simp.SimpMessagingTemplate
import org.springframework.stereotype.Service


@Service
class MessageService(private val messagingTemplate: SimpMessagingTemplate) {
    fun pingUsers(message: String?) {
        messagingTemplate.convertAndSend("/ping", message!!)
    }
}