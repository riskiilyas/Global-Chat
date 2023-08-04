package com.riskee.globalchat.controller

import com.riskee.globalchat.model.ResponseErrorModel
import com.riskee.globalchat.model.dto.User
import com.riskee.globalchat.model.request.LoginRequest
import com.riskee.globalchat.model.request.RegisterRequest
import com.riskee.globalchat.model.ResponseModelSingle
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

    @PostMapping("/login")
    fun login(
        @RequestBody body: LoginRequest
    ) = ResponseModelSingle(200, "success", authService.login(body))

    @ExceptionHandler(ApiExceptions::class)
    fun handleBadRequest(e: ApiExceptions): ResponseEntity<ResponseErrorModel> {
        return ResponseEntity(
            ResponseErrorModel(e.status.value(), e.errorMessage),
            e.status
        )
    }
}