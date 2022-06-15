package at.fhjoanneum.myusi.Security

import at.fhjoanneum.myusi.Entity.User
import at.fhjoanneum.myusi.Entity.UserRole
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.userdetails.UserDetails

class UsiManagerPrincipal(val user: User) : UserDetails {
    override fun getAuthorities(): MutableCollection<out GrantedAuthority> {
        if (user.role == UserRole.ROLE_ADMIN) {
            return mutableListOf(
                SimpleGrantedAuthority(user.role.toString()),
                SimpleGrantedAuthority(UserRole.ROLE_INSTRUCTOR.toString()),
                SimpleGrantedAuthority(UserRole.ROLE_USER.toString())
            )
        } else if (user.role == UserRole.ROLE_INSTRUCTOR) {
            return mutableListOf(
                SimpleGrantedAuthority(user.role.toString()),
                SimpleGrantedAuthority(UserRole.ROLE_USER.toString())
            )
        } else {
            return mutableListOf(SimpleGrantedAuthority(user.role.toString()))
        }
        //return setOf(UserRole.ROLE_USER, user.role).map { SimpleGrantedAuthority(it.toString()) }
    }

    override fun getPassword(): String? {
        return user.password
    }

    override fun getUsername(): String? {
        return user.username
    }

    override fun isAccountNonExpired(): Boolean {
        return true
    }

    override fun isAccountNonLocked(): Boolean {
        return true
    }

    override fun isCredentialsNonExpired(): Boolean {
        return true
    }

    override fun isEnabled(): Boolean {
        return true
    }

}

