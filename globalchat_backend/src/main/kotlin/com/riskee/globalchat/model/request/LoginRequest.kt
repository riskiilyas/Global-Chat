package com.riskee.globalchat.model.request

data class LoginRequest(
    val usernameOrEmail: String,
    val password: String
)
