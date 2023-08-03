package com.riskee.globalchat.model

import com.fasterxml.jackson.annotation.JsonProperty
import jakarta.persistence.*

@Entity
@Table(name = User.TABLE_NAME)
data class User(
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = USERNAME)
    @JsonProperty(USERNAME)
    val username: String,

    @Column(name = EMAIL)
    @JsonProperty(EMAIL)
    val email: String,

    @Column(name = PASSWORD)
    @JsonProperty(PASSWORD)
    val password: String,

    @Column(name = LEVEL)
    @JsonProperty(LEVEL)
    val level: Int = 1,

    @Column(name = EXP)
    @JsonProperty(EXP)
    val exp: Int = 0,

    @Column(name = COINS)
    @JsonProperty(COINS)
    val coins: Int = 0,

    @Column(name = AVATARS)
    @JsonProperty(AVATARS)
    val avatars: String = "",

    @Column(name = ITEMS)
    @JsonProperty(ITEMS)
    val items: String = "",
) {
    constructor() : this("null", "null", "null")

    companion object {
        const val TABLE_NAME = "users"
        const val USERNAME = "username"
        const val EMAIL = "email"
        const val PASSWORD = "password"
        const val LEVEL = "level"
        const val EXP = "exp"
        const val COINS = "coins"
        const val AVATARS = "avatars"
        const val ITEMS = "items"
    }
}
