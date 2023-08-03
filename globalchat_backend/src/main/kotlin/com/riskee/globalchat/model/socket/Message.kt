package com.riskee.globalchat.model.socket

import com.fasterxml.jackson.annotation.JsonProperty

data class Message(
    @JsonProperty("username")
    val username: String,
    @JsonProperty("avatarId")
    val avatarId: Int,
    @JsonProperty("message")
    val message: String,
)