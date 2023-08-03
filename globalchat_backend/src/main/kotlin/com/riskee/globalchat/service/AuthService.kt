package com.riskee.globalchat.service

import com.riskee.globalchat.datasource.UserRepository
import com.riskee.globalchat.model.dto.User
import com.riskee.globalchat.model.request.RegisterRequest
import com.riskee.globalchat.utill.ApiExceptions
import com.riskee.globalchat.utill.Validators
import org.springframework.stereotype.Service

@Service
class AuthService(
    private val userRepository: UserRepository
) {
    fun register(body: RegisterRequest): User {
        val username = body.username
        val email = body.email
        val password = body.password
        val confirmationPassword = body.confirmationPassword
        val avatarId = body.avatarId

        val isEmailValid = Validators.validateEmail(email)
        if(!isEmailValid) throw ApiExceptions.EmailInvalidException()

        val isPasswordValid = Validators.validatePassword(password)
        if(!isPasswordValid) throw ApiExceptions.PasswordInvalidException()

        if(password != confirmationPassword) throw ApiExceptions.PasswordNotMatchedException()

        if(userRepository.existsById(username)) throw ApiExceptions.UsernameAlreadyExistException()

        val newUser = User(
            username = username,
            email = email,
            password = password,
            avatarId = avatarId
        )

        return userRepository.save(newUser)
    }
}