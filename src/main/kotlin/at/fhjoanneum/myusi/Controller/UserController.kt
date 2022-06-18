package at.fhjoanneum.myusi.Controller

import at.fhjoanneum.myusi.Converter.DateToStringConverter
import at.fhjoanneum.myusi.Entity.*
import at.fhjoanneum.myusi.Repository.CourseRepository
import at.fhjoanneum.myusi.Repository.LocationRepository
import at.fhjoanneum.myusi.Repository.UserRepository
import at.fhjoanneum.myusi.Service.MailSenderService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.data.repository.findByIdOrNull
import org.springframework.format.annotation.DateTimeFormat
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.core.context.SecurityContextHolder
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
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.util.*
import javax.validation.Valid

@Controller
class UserController(val userRepository: UserRepository) {

    @Autowired
    val mailSender: MailSenderService? = null

    @RequestMapping(path=["/login"], method = [RequestMethod.GET])
    fun login(model: Model): String {

        model["user"] = User(username = "", password = "", role = UserRole.ROLE_USER, dayOfBirth = LocalDate.now())
        return "login"
    }

    @RequestMapping(path=["/performLogout"], method = [RequestMethod.GET])
    fun logout(model: Model): String {
        return "performLogout"
    }
    @RequestMapping(path=["/register"], method = [RequestMethod.GET])
    fun register(model: Model): String {
        if(!model.containsAttribute("user")){
            model["user"] = User(username = "", password = "", role = UserRole.ROLE_USER, dayOfBirth = LocalDate.now())
            model["passwordCheck"] = ""
        }
        return "register"
    }

    @RequestMapping("/newUser", method = [RequestMethod.POST])
    fun newUser(@ModelAttribute @Valid user: User, bindingResult: BindingResult, model: Model): String {//@Valid @ModelAttribute user: User, bindingResult: BindingResult, model: Model): String {
        val originalPassword = user.password

        if (bindingResult.hasErrors()) {
            model["errorMessage"]="Please fill out all the required Fields"
            return register(model)
        }
        try {
            user.password = BCryptPasswordEncoder().encode(originalPassword)
            userRepository.save(user)
            val sender = "myusi.wappdev@gmail.com"
            mailSender?.sendMail(sender, user.email,
                "Successfully registered account for MyUSI",
                "You have successfully registered your account for MyUSI application. Start booking courses now!")
        }  catch (e: DataIntegrityViolationException) {
            user.password = originalPassword
            model["user"]=user
            model["errorMessage"]="An Error occurred"
            return register(model)
        } catch (e: Exception) {
            user.password = originalPassword
            model["user"]=user
            model["errorMessage"]="An Error occurred"
            return register(model)
        }


        return  "redirect:login"
    }
}