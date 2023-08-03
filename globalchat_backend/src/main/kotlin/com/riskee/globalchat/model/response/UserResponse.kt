package com.riskee.globalchat.model.response

import com.fasterxml.jackson.annotation.JsonProperty
import com.riskee.globalchat.model.dto.User

data class UserResponse(
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