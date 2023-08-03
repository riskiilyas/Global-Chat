package com.riskee.globalchat.datasource

import com.riskee.globalchat.model.dto.User
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface UserRepository: JpaRepository<User, String> {
}