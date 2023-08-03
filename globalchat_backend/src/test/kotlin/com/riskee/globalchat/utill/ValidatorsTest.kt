package com.riskee.globalchat.utill

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class ValidatorsTest{
    @Test
    fun `should match email format`() {
        val email1 = "username@domain.com"
        val email2 = "user.name@domain.com"
        val email3 = "user-name@domain.com"
        val email4 = "username@domain.co.in"
        val email5 = "user_name@domain.com"

        val result1 = Validators.validateEmail(email1)
        val result2 = Validators.validateEmail(email2)
        val result3 = Validators.validateEmail(email3)
        val result4 = Validators.validateEmail(email4)
        val result5 = Validators.validateEmail(email5)

        assertTrue(result1)
        assertTrue(result2)
        assertTrue(result3)
        assertTrue(result4)
        assertTrue(result5)
    }

    @Test
    fun `should NOT match email format`() {
        val email1 = "username.@domain.com"
        val email2 = ".user.name@domain.com"
        val email3 = "user-name@domain.com."
        val email4 = "username@.com"

        val result1 = Validators.validateEmail(email1)
        val result2 = Validators.validateEmail(email2)
        val result3 = Validators.validateEmail(email3)
        val result4 = Validators.validateEmail(email4)

        assertFalse(result1)
        assertFalse(result2)
        assertFalse(result3)
        assertFalse(result4)
    }
}