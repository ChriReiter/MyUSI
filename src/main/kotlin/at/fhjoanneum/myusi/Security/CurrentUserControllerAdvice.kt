package at.fhjoanneum.myusi.Security
/*
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ModelAttribute

@ControllerAdvice
class CurrentUserControllerAdvice {
    @ModelAttribute
    fun addCurrentUser(model: Model) {
        val auth = SecurityContextHolder.getContext().authentication
        model.addAttribute("currentUser", auth.name)
    }
}

 */

import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ModelAttribute

@ControllerAdvice
class CurrentUserControllerAdvice {
    @ModelAttribute
    fun addCurrentUser(model: Model) {
        val auth = SecurityContextHolder.getContext().authentication
        model.addAttribute("currentUser", auth.name)
    }
}
