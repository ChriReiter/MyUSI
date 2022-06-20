package at.fhjoanneum.myusi.Controller

import at.fhjoanneum.myusi.Entity.CourseCategory
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@Controller
class FooterController {

    @RequestMapping(path = ["/termsAndConditions"], method = [RequestMethod.GET])
    fun termsAndConditions(): String {
        return "termsAndConditions"
    }

    @RequestMapping(path = ["/imprint"], method = [RequestMethod.GET])
    fun imprint(): String {
        return "imprint"
    }

    @RequestMapping(path = ["/privacyPolicy"], method = [RequestMethod.GET])
    fun privacyPolicy(): String {
        return "privacyPolicy"
    }
}