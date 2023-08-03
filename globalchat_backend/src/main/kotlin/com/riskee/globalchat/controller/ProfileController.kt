package com.riskee.globalchat.controller

import com.riskee.globalchat.model.ResponseModelSingle
import com.riskee.globalchat.model.dto.User
import com.riskee.globalchat.model.request.LoginRequest
import com.riskee.globalchat.model.request.RegisterRequest
import com.riskee.globalchat.service.AuthService
import com.riskee.globalchat.service.ProfileService
import com.riskee.globalchat.utill.ApiExceptions
import org.springframework.http.ResponseEntity
import org.springframework.security.core.Authentication
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/me")
class ProfileController(
    private val profileService: ProfileService
) {

    @GetMapping
    fun getUserProfile(authentication: Authentication) =
        ResponseModelSingle(200, "success", profileService.getProfile(authentication))

    @ExceptionHandler(ApiExceptions::class)
    fun handleBadRequest(e: ApiExceptions): ResponseEntity<ResponseModelSingle<User?>> {
        return ResponseEntity(
            ResponseModelSingle(e.status.value(), e.errorMessage, null),
            e.status
        )
    }
}