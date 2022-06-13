package at.fhjoanneum.myusi.Repository

import at.fhjoanneum.myusi.Entity.User
import at.fhjoanneum.myusi.Entity.UserRole
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
    fun findByRole(role: UserRole): List<User>
}