package com.riskee.globalchat.model.mapper

import com.riskee.globalchat.model.dto.User
import com.riskee.globalchat.model.response.LoginResponse
import com.riskee.globalchat.model.response.RegisterResponse
import com.riskee.globalchat.model.response.UserResponse

class UserMapper {
    companion object {
        fun toRegisterResponse(user: User) = RegisterResponse(
            username = user.username,
            email = user.email,
            avatarId = user.avatarId,
            level = user.level,
            coins = user.coins,
            exp = user.exp,
            avatars = user.avatars,
            items = user.items
        )

        fun toLoginResponse(user: User, token: String) = LoginResponse(
            token = token,
            username = user.username,
            email = user.email,
            avatarId = user.avatarId,
            level = user.level,
            coins = user.coins,
            exp = user.exp,
            avatars = user.avatars,
            items = user.items
        )

        fun toUserResponse(user: User) = UserResponse(
            username = user.username,
            email = user.email,
            avatarId = user.avatarId,
            level = user.level,
            coins = user.coins,
            exp = user.exp,
            avatars = user.avatars,
            items = user.items
        )
    }
}