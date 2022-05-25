package at.fhjoanneum.myusi.Security

import at.fhjoanneum.myusi.Repository.UserRepository
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.stereotype.Service

@Service
class UsiManagerUserDetailsService(val userRepository: UserRepository) : UserDetailsService {
    override fun loadUserByUsername(username: String): UserDetails {
        try {
            return UsiManagerPrincipal(userRepository.findByUsername(username))
        } catch (e: Exception) {
            throw UsernameNotFoundException(username)
        }
    }
}

