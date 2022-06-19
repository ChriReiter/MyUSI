package at.fhjoanneum.myusi.Controller

import at.fhjoanneum.myusi.Entity.*
import at.fhjoanneum.myusi.Repository.CourseCategoryRepository
import at.fhjoanneum.myusi.Repository.CourseRepository
import at.fhjoanneum.myusi.Repository.UserRepository
import at.fhjoanneum.myusi.Service.MailSenderService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.access.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@Controller
class MailController(val userRepository: UserRepository, val courseRepository: CourseRepository, val categoryRepository: CourseCategoryRepository) {

    @Autowired
    val mailSender: MailSenderService? = null

    @Secured("ROLE_INSTRUCTOR")
    @RequestMapping(path = ["/sendMailtoEnrolledUsers"], method = [RequestMethod.GET])
    fun sendMailToEnrolledUsers(): String {
        //model["User"] = userRepository.findAll()
        return "sendMailtoEnrolledUsers"
    }

    @Secured("ROLE_INSTRUCTOR")
    @RequestMapping(path = ["/submitMailToUsers"], method = [RequestMethod.GET])
    fun submitMailToUsers(id: Int?): String {

        val messageToUsers = ""

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

