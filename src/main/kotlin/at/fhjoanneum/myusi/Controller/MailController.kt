package at.fhjoanneum.myusi.Controller

import at.fhjoanneum.myusi.Entity.*
import at.fhjoanneum.myusi.Repository.CourseCategoryRepository
import at.fhjoanneum.myusi.Repository.CourseRepository
import at.fhjoanneum.myusi.Repository.UserRepository
import at.fhjoanneum.myusi.Service.MailSenderService
import at.fhjoanneum.myusi.classes.MessageClass
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.access.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import javax.validation.Valid

@Controller
class MailController(val userRepository: UserRepository, val courseRepository: CourseRepository, val categoryRepository: CourseCategoryRepository) {

    @Autowired
    val mailSender: MailSenderService? = null

    @Secured("ROLE_INSTRUCTOR")
    @RequestMapping(path = ["sendMailToEnrolledUsers"], method = [RequestMethod.GET])
    fun sendMailToEnrolledUsers(model : Model): String {
        model["messageClass"] = MessageClass(messageTo = "")
        return "sendMailtoEnrolledUsers"
    }

    @Secured("ROLE_INSTRUCTOR")
    @RequestMapping(path = ["/submitMailToUsers"], method = [RequestMethod.POST])
    fun submitMailToUsers(@ModelAttribute @Valid messageClass: MessageClass, model: Model, id: Int?): String {

        val messageToUsers = messageClass.messageTo


        if (id != null) {
            val instructor: User? =
                userRepository.findByUsername(SecurityContextHolder.getContext().authentication.name)
            val instructorsCourse: Course? = courseRepository.findCourseById(id)

            for (user in instructorsCourse!!.participants!!) {
                mailSender?.sendMail(
                    instructor!!.email!!,
                    user.email,
                    "Information to course:  ${instructorsCourse.courseName}",
                    messageToUsers
                )
            }
            return "redirect:listCourses"
        } else {
            return "redirect:listCourses"
        }
    }
}

