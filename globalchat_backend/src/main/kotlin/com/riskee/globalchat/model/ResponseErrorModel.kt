package com.riskee.globalchat.model

import com.fasterxml.jackson.annotation.JsonProperty

data class ResponseErrorModel(
    @JsonProperty("status")
    val status: Int,
    @JsonProperty("message")
    val message: String
)