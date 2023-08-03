package com.riskee.globalchat.service

import com.riskee.globalchat.datasource.UserRepository
import com.riskee.globalchat.model.dto.User
import com.riskee.globalchat.model.mapper.UserMapper
import com.riskee.globalchat.model.request.LoginRequest
import com.riskee.globalchat.model.request.RegisterRequest
import com.riskee.globalchat.model.response.LoginResponse
import com.riskee.globalchat.model.response.RegisterResponse
import com.riskee.globalchat.utill.ApiExceptions
import com.riskee.globalchat.utill.Validators
import org.springframework.stereotype.Service

@Service
class AuthService(
    private val userRepository: UserRepository,
    private val tokenService: TokenService
) {
    fun register(body: RegisterRequest): RegisterResponse {
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

        if(userRepository.findByEmail(email).isNotEmpty()) throw ApiExceptions.EmailAlreadyRegisteredException()

        val newUser = User(
            username = username,
            email = email,
            password = password,
            avatarId = avatarId
        )

        return UserMapper.toRegisterResponse(userRepository.save(newUser))
    }

    fun login(body: LoginRequest): LoginResponse {
        val isEmail = Validators.validateEmail(body.usernameOrEmail)

        val user: User? = if(isEmail) {
            val users = userRepository.findByEmail(body.usernameOrEmail)
            if(users.isEmpty()) throw ApiExceptions.UserNotFoundException()
            userRepository.findById(users.elementAt(0).username).orElseThrow {
                ApiExceptions.UserNotFoundException()
            }
        } else {
            if(!userRepository.existsById(body.usernameOrEmail)) throw ApiExceptions.UserNotFoundException()
            userRepository.findById(body.usernameOrEmail).orElseThrow {
                ApiExceptions.UserNotFoundException()
            }
        }

        if(body.password != user!!.password) throw ApiExceptions.InvalidLoginException()

        return UserMapper.toLoginResponse(user, tokenService.createToken(user))
    }
}