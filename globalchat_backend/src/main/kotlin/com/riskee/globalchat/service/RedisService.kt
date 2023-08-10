//package com.riskee.globalchat.service
//
//import org.springframework.beans.factory.annotation.Qualifier
//import org.springframework.data.redis.core.RedisTemplate
//import org.springframework.stereotype.Service
//
//@Service
//class RedisService(
//    private val redisTemplate: RedisTemplate<String, String>
//) {
//
//    fun addOnlineUser(key: String, username: String) {
//        redisTemplate.opsForValue().set(key, username)
//    }
//
//    fun getOnlineUsers() {
//
//    }
//
//}