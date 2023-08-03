package com.riskee.globalchat.utill

import org.springframework.http.HttpStatus

sealed class ApiExceptions(val errorMessage: String, val status: HttpStatus) : Exception(errorMessage) {
    class EmailInvalidException : ApiExceptions("Email is Invalid!", HttpStatus.BAD_REQUEST)

    class PasswordInvalidException : ApiExceptions(
        "Password is Invalid! Make sure at least 8 Characters, 1 Uppercase, & 1 Numeric",
        HttpStatus.BAD_REQUEST
    )

    class PasswordNotMatchedException : ApiExceptions("Password Didn't Match!", HttpStatus.BAD_REQUEST)

    class UsernameAlreadyExistException : ApiExceptions("Username already Exist!", HttpStatus.BAD_REQUEST)

    class EmailAlreadyRegisteredException : ApiExceptions("Email already registered!", HttpStatus.BAD_REQUEST)

    class UserNotFoundException : ApiExceptions("User not found!", HttpStatus.NOT_FOUND)

    class InvalidLoginException : ApiExceptions("Invalid Login data!", HttpStatus.BAD_REQUEST)
}
