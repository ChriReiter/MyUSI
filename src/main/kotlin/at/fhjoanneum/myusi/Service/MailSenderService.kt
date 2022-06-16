package at.fhjoanneum.myusi.Service

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.mail.MailSender
import org.springframework.mail.SimpleMailMessage
import org.springframework.mail.javamail.JavaMailSender
import org.springframework.stereotype.Service

@Service
class MailSenderService {

    @Autowired
    val mailSender: MailSender? = null

    fun sendMail(toEmail: String?, subject: String, body: String) {
        val message: SimpleMailMessage = SimpleMailMessage()
        message.setFrom("myusi.wappdev@gmail.com")
        message.setTo(toEmail)
        message.setText(body)
        message.setSubject(subject)

        mailSender?.send(message)
    }
}