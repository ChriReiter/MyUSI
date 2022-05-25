package at.fhjoanneum.myusi.Controller

import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

@Controller
class UsiController {
    @RequestMapping(path=["/","/listCourses"], method = [RequestMethod.GET])
    fun listEmployees(model: Model): String {
        return "listCourses"
    }
}