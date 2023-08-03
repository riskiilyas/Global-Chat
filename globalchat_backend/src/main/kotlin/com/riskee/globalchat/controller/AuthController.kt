package com.riskee.globalchat.controller

import com.riskee.globalchat.repo.UserRepository
import com.riskee.globalchat.utill.Validators
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/auth")
class AuthController {

    @Autowired
    lateinit var repository: UserRepository

    @PostMapping("/register")
    fun register(
        @RequestBody username: String,
        @RequestBody email: String,
        @RequestBody password: String,
        @RequestBody confirmationPassword: String,
        ) {

        val isEmailValid = Validators.validateEmail(email)
        if (!isEmailValid) {

        }

        val isPasswordValid = Validators

    }
}