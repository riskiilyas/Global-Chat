package com.riskee.globalchat.controller

import com.riskee.globalchat.datasource.UserRepository
import com.riskee.globalchat.model.dto.User
import com.riskee.globalchat.model.request.RegisterRequest
import com.riskee.globalchat.model.response.ResponseModelSingle
import com.riskee.globalchat.service.AuthService
import com.riskee.globalchat.utill.ApiExceptions
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/auth")
class AuthController(
    private val authService: AuthService
) {

    @PostMapping("/register")
    fun register(
        @RequestBody body: RegisterRequest
    ) = ResponseModelSingle(200, "success", authService.register(body))

    @ExceptionHandler(ApiExceptions::class)
    fun handleBadRequest(e: ApiExceptions): ResponseEntity<ResponseModelSingle<User?>> {
        return ResponseEntity(
            ResponseModelSingle(e.status.value(), e.errorMessage, null),
            e.status
        )
    }
}