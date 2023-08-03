package com.riskee.globalchat.utill

import java.util.regex.Pattern

object Validators {
    fun validateEmail(email: String): Boolean {
        val regexPattern =
            "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$"
        return matchPattern(email, regexPattern)
    }

    private fun matchPattern(data: String, regex: String): Boolean {
        return Pattern.compile(regex)
            .matcher(data)
            .matches();
    }
}