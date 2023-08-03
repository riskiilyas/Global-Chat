package com.riskee.globalchat.model

import com.fasterxml.jackson.annotation.JsonProperty

data class ResponseModelSingle<T>(
    @JsonProperty("status")
    val status: Int,
    @JsonProperty("message")
    val message: String,
    @JsonProperty("data")
    val data: T
)