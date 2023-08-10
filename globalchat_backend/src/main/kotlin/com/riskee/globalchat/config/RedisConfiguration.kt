//package com.riskee.globalchat.config
//
//import org.springframework.beans.factory.annotation.Value
//import org.springframework.cache.annotation.EnableCaching
//import org.springframework.context.annotation.Bean
//import org.springframework.context.annotation.Configuration
//import org.springframework.data.redis.connection.RedisStandaloneConfiguration
//import org.springframework.data.redis.connection.jedis.JedisClientConfiguration
//import org.springframework.data.redis.connection.jedis.JedisConnectionFactory
//import org.springframework.data.redis.core.RedisTemplate
//import org.springframework.data.redis.serializer.GenericToStringSerializer
//import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer
//import org.springframework.data.redis.serializer.StringRedisSerializer
//
//@Configuration
//@EnableCaching
//class RedisConfiguration(
//    @Value("\${spring.data.redis.host}")
//    private val REDIS_HOSTNAME: String,
//    @Value("\${spring.data.redis.port}")
//    private val REDIS_PORT: Int
//) {
//
//    @Bean
//    fun redisTemplate(): RedisTemplate<String, String> {
//        val redisTemplate = RedisTemplate<String, String>()
//        redisTemplate.keySerializer = StringRedisSerializer()
//        redisTemplate.hashKeySerializer = GenericToStringSerializer(String::class.java)
//        redisTemplate.hashValueSerializer = JdkSerializationRedisSerializer()
//        redisTemplate.valueSerializer = JdkSerializationRedisSerializer()
//        val configuration = RedisStandaloneConfiguration(REDIS_HOSTNAME, REDIS_PORT)
//        val jedisClientConfiguration = JedisClientConfiguration.builder().build()
//        val factory = JedisConnectionFactory(configuration, jedisClientConfiguration)
//        factory.afterPropertiesSet()
//        redisTemplate.connectionFactory = factory
//        return redisTemplate
//    }
//
//
//}