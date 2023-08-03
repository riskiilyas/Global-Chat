package com.riskee.globalchat.model.response

import com.fasterxml.jackson.annotation.JsonProperty
import com.riskee.globalchat.model.dto.User
import com.riskee.globalchat.utill.Constants


data class LoginResponse(
    @JsonProperty(Constants.TOKEN)
    val token: String,

    @JsonProperty(User.USERNAME)
    val username: String,

    @JsonProperty(User.EMAIL)
    val email: String,

    @JsonProperty(User.AVATAR_ID)
    val avatarId: Int = 2,

    @JsonProperty(User.LEVEL)
    val level: Int = 1,

    @JsonProperty(User.EXP)
    val exp: Int = 0,

    @JsonProperty(User.COINS)
    val coins: Int = 0,

    @JsonProperty(User.AVATARS)
    val avatars: String = "",

    @JsonProperty(User.ITEMS)
    val items: String = "",
)