package at.fhjoanneum.myusi.Service

import at.fhjoanneum.myusi.Entity.User
import at.fhjoanneum.myusi.Repository.CourseDateRepository
import at.fhjoanneum.myusi.Repository.CourseRepository
import at.fhjoanneum.myusi.Repository.UserRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.mail.MailSender
import org.springframework.mail.SimpleMailMessage
import org.springframework.security.core.context.SecurityContextHolder

class EmailSendeToUsersService {
    @Autowired
    val mailSender: MailSender? = null

    val instructor: User = userRepository.findByUsername(SecurityContextHolder.getContext().authentication.name)
    val enrolledUsers :List<User>  =


    fun sendMail(toEmail: String?, subject: String, body: String) {
        val message: SimpleMailMessage = SimpleMailMessage()
        message.setFrom(instructor.email)
        message.setTo(toEmail)
        message.setText(body)
        message.setSubject(subject)

        mailSender?.send(message)
    }
}
}