package com.riskee.globalchat.service

import org.springframework.context.ApplicationListener
import org.springframework.messaging.simp.stomp.StompHeaderAccessor
import org.springframework.stereotype.Service
import org.springframework.web.socket.messaging.SessionDisconnectEvent

@Service
class UserDisconnectService : ApplicationListener<SessionDisconnectEvent> {
    private var callback: (String) -> Unit = {}


    override fun onApplicationEvent(event: SessionDisconnectEvent) {
        val accessor = StompHeaderAccessor.wrap(event.message)
        val sessionId = accessor.sessionId
        sessionId?.apply {
            println("User Left: $sessionId")
            callback.invoke(sessionId)
        }
    }

    fun addCallback(mCalback: (String) -> Unit) {
        callback = mCalback
    }
}