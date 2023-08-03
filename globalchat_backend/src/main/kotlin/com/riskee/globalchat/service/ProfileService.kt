package com.riskee.globalchat.service

import com.riskee.globalchat.datasource.UserRepository
import com.riskee.globalchat.model.dto.User
import com.riskee.globalchat.model.mapper.UserMapper
import com.riskee.globalchat.model.response.UserResponse
import org.springframework.security.core.Authentication
import org.springframework.stereotype.Service


@Service
class ProfileService(
    private val userRepository: UserRepository
) {
    fun getProfile(auth: Authentication): UserResponse {
        val user = auth.principal as User

        return UserMapper.toUserResponse(user)
    }
}