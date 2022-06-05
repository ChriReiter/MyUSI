package at.fhjoanneum.myusi.Controller

import at.fhjoanneum.myusi.Entity.Gender
import at.fhjoanneum.myusi.Entity.User
import at.fhjoanneum.myusi.Entity.UserRole
import at.fhjoanneum.myusi.Repository.UserRepository
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import java.time.LocalDate
import javax.validation.Valid

@Controller
class UsiController(val userRepository: UserRepository) {
    @RequestMapping(path=["/","/listCourses"], method = [RequestMethod.GET])
    fun listCourses(model: Model): String {
        return "listCourses"
    }

    @RequestMapping(path=["/register"], method = [RequestMethod.GET])
    fun register(model: Model): String {
        model["user"] = User(username = "", password = "", role = UserRole.ROLE_USER, dayOfBirth = LocalDate.now(), gender = Gender.GENDER_MALE)
        return "register"
    }

    @RequestMapping("/newUser", method = [RequestMethod.POST])
    fun newUser(@ModelAttribute @Valid user: User, bindingResult: BindingResult, model: Model): String {//@Valid @ModelAttribute user: User, bindingResult: BindingResult, model: Model): String {
        val originalPassword = user.password
        if (bindingResult.hasErrors()) {
            return "register"
        }
        try {
            user.password = BCryptPasswordEncoder().encode(originalPassword)
            userRepository.save(user)
        }  catch (e: DataIntegrityViolationException) {
            user.password = originalPassword
            return "register"
        } catch (e: Exception) {
            user.password = originalPassword
            return "register"
        }


        return  "redirect:listCourses"//"redirect:/editEmployee?id=" + employee.id
    }
}

