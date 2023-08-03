package com.riskee.globalchat.repo

import com.riskee.globalchat.model.User
import org.springframework.data.repository.CrudRepository
import org.springframework.stereotype.Repository

@Repository
interface UserRepository: CrudRepository<User, String> {
}