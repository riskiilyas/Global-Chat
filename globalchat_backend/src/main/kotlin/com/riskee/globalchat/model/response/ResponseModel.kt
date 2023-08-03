package com.riskee.globalchat.model.response

import com.fasterxml.jackson.annotation.JsonProperty

data class ResponseModel<T>(
    @JsonProperty("status")
    val status: Int,
    @JsonProperty("message")
    val message: String,
    @JsonProperty("data")
    val data: Collection<T>
)