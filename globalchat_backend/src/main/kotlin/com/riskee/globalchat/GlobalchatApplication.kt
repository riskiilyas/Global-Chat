package com.riskee.globalchat

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class GlobalchatApplication {

    fun main(args: Array<String>) {
        runApplication<GlobalchatApplication>(*args)
    }
}
