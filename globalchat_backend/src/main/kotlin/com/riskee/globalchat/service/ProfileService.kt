package com.riskee.globalchat.service

import com.riskee.globalchat.datasource.UserRepository
import com.riskee.globalchat.model.dto.User
import com.riskee.globalchat.model.mapper.UserMapper
import com.riskee.globalchat.model.request.EditProfileRequest
import com.riskee.globalchat.model.response.UserResponse
import com.riskee.globalchat.utill.ApiExceptions
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

    fun editProfile(auth: Authentication, body: EditProfileRequest): UserResponse {
        val user = auth.principal as User
        if(body.username!=user.username) {
            if(userRepository.findById(body.username).isPresent) throw ApiExceptions.UsernameAlreadyExistException()
        }

        user.username = body.username
        user.avatarId = body.avatarId
        userRepository.save(user)

        return UserMapper.toUserResponse(user)
    }
}