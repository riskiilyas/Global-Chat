package com.riskee.globalchat.model.socket

import com.fasterxml.jackson.annotation.JsonProperty

data class UserSession(
    @JsonProperty("username")
    val username: String,
    @JsonProperty("sessionId")
    val sessionId: String,
)