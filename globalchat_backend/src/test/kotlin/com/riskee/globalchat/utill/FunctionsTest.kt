package com.riskee.globalchat.utill

import org.junit.jupiter.api.Test

import org.junit.jupiter.api.Assertions.*

internal class FunctionsTest {

    @Test
    fun `should return expected array of int`() {
        val expectedList = listOf(1, 3, 4, 5, 10)
        val listString = ",1,3,4,5,10"

        val actualLIst = Functions.stringItemsToArrayInt(listString)

        assertTrue(expectedList.containsAll(actualLIst))
    }

    @Test
    fun `should return expected string format`() {
        val expectedString = ",1,3,4,5,10"
        val listItem = listOf(1, 3, 4, 5, 10)

        val actualString = Functions.arrayItemsToString(listItem)

        assertEquals(expectedString, actualString)
    }
}