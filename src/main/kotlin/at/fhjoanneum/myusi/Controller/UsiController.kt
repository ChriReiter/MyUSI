package at.fhjoanneum.myusi.Controller

import at.fhjoanneum.myusi.Converter.DateToStringConverter
import at.fhjoanneum.myusi.Entity.*
import at.fhjoanneum.myusi.Repository.CourseRepository
import at.fhjoanneum.myusi.Repository.LocationRepository
import at.fhjoanneum.myusi.Repository.UserRepository
import org.springframework.dao.DataIntegrityViolationException
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
class UsiController(val userRepository: UserRepository, val courseRepository: CourseRepository, val locationRepository: LocationRepository) {

    @RequestMapping(path=["/","/listCourses"], method = [RequestMethod.GET])
    fun listCourses(model: Model, @RequestParam(required = false) search: String? = null, @RequestParam(required = false) date: String? = null
                      , @RequestParam(required = false) timeStart: String? = null, @RequestParam(required = false) timeEnd: String? = null
                      , @RequestParam(required = false) instructor: User? = null, @RequestParam(required = false) location: Location? = null
    ): String {
        //val timeStart2: String? = timeStart.plus(":00")
        if (date != null && date != "") {
            val date2 = LocalDate.parse(date, DateTimeFormatter.ISO_LOCAL_DATE)
            model["courses"] = courseRepository.findByCourseName(search, date2, timeStart, timeEnd, instructor, location)//, date, instructor, location)
        } else {
            model["courses"] = courseRepository.findByCourseName(search, null, timeStart, timeEnd, instructor, location)//, date, instructor, location)
        }

        //model["courses"] = courseRepository.findByCourseName(search, date2, instructor, location)//, date, instructor, location)
        model["instructors"] = userRepository.findAll()
        model["locations"] = locationRepository.findAll()
        return "listCourses"
    }

    @RequestMapping(path=["/register"], method = [RequestMethod.GET])
    fun register(model: Model): String {
        model["user"] = User(username = "", password = "", role = UserRole.ROLE_USER, dayOfBirth = LocalDate.now())
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


        return  "redirect:listCourses"
    }

    @RequestMapping(path=["/createCourse"], method = [RequestMethod.GET])
    fun createCourse(model: Model): String {
        return populateCreateCourseModel(model)
    }

    private fun populateCreateCourseModel(model: Model): String {
        model["locations"] = locationRepository.findAll()
        model["course"] = Course()
        return "createCourse"
    }

    @RequestMapping("/newCourse", method = [RequestMethod.POST])
    fun newCourse(@ModelAttribute @Valid course: Course, bindingResult: BindingResult, model: Model): String {//@Valid @ModelAttribute user: User, bindingResult: BindingResult, model: Model): String {
        if (bindingResult.hasErrors()) {
            return populateCreateCourseModel(model)
        }
        try {
            val username = SecurityContextHolder.getContext().authentication.name
            course.instructor = userRepository.findByUsername(username)
            //course.instructor = SecurityContextHolder.getContext().authentication.name.
            courseRepository.save(course)
        }  catch (e: DataIntegrityViolationException) {
            return populateCreateCourseModel(model)
        } catch (e: Exception) {
            return populateCreateCourseModel(model)
        }


        return  "redirect:listCourses"//"redirect:/editEmployee?id=" + employee.id
    }

    @RequestMapping(path=["/createLocation"], method = [RequestMethod.GET])
    fun createLocation(model: Model): String {
        model["course"] = Location()
        return "createLocation"
    }

    @RequestMapping("/newLocation", method = [RequestMethod.POST])
    fun newLocation(@ModelAttribute @Valid location: Location, bindingResult: BindingResult, model: Model): String {//@Valid @ModelAttribute user: User, bindingResult: BindingResult, model: Model): String {
        try {
            locationRepository.save(location)
        }  catch (e: DataIntegrityViolationException) {
            return "createLocation"
        } catch (e: Exception) {
            return "createLocation"
        }


        return  "redirect:createCourse"//"redirect:/editEmployee?id=" + employee.id
    }

    @RequestMapping(path=["/login"], method = [RequestMethod.GET])
    fun login(model: Model): String {
        model["user"] = User(username = "", password = "", role = UserRole.ROLE_USER, dayOfBirth = LocalDate.now())
        return "login"
    }

    @RequestMapping(path=["/performLogout"], method = [RequestMethod.GET])
    fun logout(model: Model): String {
        return "performLogout"
    }
}

