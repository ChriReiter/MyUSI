package at.fhjoanneum.myusi.Repository

import at.fhjoanneum.myusi.Entity.User
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository
/*
@Repository
interface UserRepository : JpaRepository<User, Int> {
    fun findByUsername(username: String): User
}

 */
@Repository
interface UserRepository : JpaRepository<User, Int> {
    fun findByUsername(username: String): User
}