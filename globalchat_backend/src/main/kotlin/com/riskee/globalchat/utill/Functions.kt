package com.riskee.globalchat.utill

import java.lang.NumberFormatException
import java.lang.StringBuilder

object Functions {

    fun stringItemsToArrayInt(items: String): List<Int> {
        val listString = items.split(',')

        return try {
            val listInt = listString.map {
               Integer.parseInt(it)
            }
            listInt
        } catch (e: NumberFormatException) {
            emptyList()
        }
    }

    fun arrayItemsToString(items: List<Int>): String {
        val strBuilder = StringBuilder()

        items.forEach {
            strBuilder.append(",$it")
        }

        return strBuilder.toString()
    }

}