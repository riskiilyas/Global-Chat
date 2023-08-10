package com.riskee.globalchat.model.dto

import jakarta.persistence.*

@Entity
@Table(name = User.TABLE_NAME)
data class User(
    @Id
    @Column(name = USERNAME)
    var username: String,

    @Column(name = EMAIL)
    val email: String,

    @Column(name = PASSWORD)
    val password: String,

    @Column(name = AVATAR_ID)
    var avatarId: Int = 2,

    @Column(name = LEVEL)
    val level: Int = 1,

    @Column(name = EXP)
    val exp: Int = 0,

    @Column(name = COINS)
    val coins: Int = 0,

    @Column(name = AVATARS)
    val avatars: String = "",

    @Column(name = ITEMS)
    val items: String = "",
) {
    constructor() : this("null", "null", "null")

    companion object {
        const val TABLE_NAME = "users"
        const val USERNAME = "username"
        const val EMAIL = "email"
        const val PASSWORD = "password"
        const val AVATAR_ID = "avatar_id"
        const val LEVEL = "level"
        const val EXP = "exp"
        const val COINS = "coins"
        const val AVATARS = "avatars"
        const val ITEMS = "items"
    }
}
