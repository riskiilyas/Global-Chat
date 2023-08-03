package com.riskee.globalchat.model.request

data class RegisterRequest(
    val username: String,
    val email: String,
    val password: String,
    val confirmationPassword: String,
    val avatarId: Int
)
