package at.fhjoanneum.myusi.Controller

import at.fhjoanneum.myusi.Entity.*
import at.fhjoanneum.myusi.Repository.CourseCategoryRepository
import at.fhjoanneum.myusi.Repository.CourseRepository
import at.fhjoanneum.myusi.Repository.LocationRepository
import at.fhjoanneum.myusi.Repository.UserRepository
import at.fhjoanneum.myusi.Service.MailSenderService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import java.time.LocalDate
import java.time.format.DateTimeFormatter
import javax.validation.Valid

@Controller
class UsiController(val userRepository: UserRepository, val courseRepository: CourseRepository, val locationRepository: LocationRepository, val categoryRepository: CourseCategoryRepository) {

    @Autowired
    val mailSender: MailSenderService? = null

    @RequestMapping(path = ["/", "/listCourses"], method = [RequestMethod.GET])
    fun listCourses(
        model: Model,
        @RequestParam(required = false) search: String? = null,
        @RequestParam(required = false) date: String? = null,
        @RequestParam(required = false) timeStart: String? = null,
        @RequestParam(required = false) timeEnd: String? = null,
        @RequestParam(required = false) instructor: User? = null,
        @RequestParam(required = false) location: Location? = null,
        @RequestParam(required = false) category: CourseCategory? = null
    ): String {
        if (date != null && date != "") {
            val date2 = LocalDate.parse(date, DateTimeFormatter.ISO_LOCAL_DATE)
            model["courses"] = courseRepository.findByCourseName(
                search,
                date2,
                timeStart,
                timeEnd,
                instructor,
                location,
                category
            )//, date, instructor, location)
        } else {
            model["courses"] = courseRepository.findByCourseName(
                search,
                null,
                timeStart,
                timeEnd,
                instructor,
                location,
                category
            )//, date, instructor, location)
        }
        model["instructors"] = userRepository.findByRole(UserRole.ROLE_INSTRUCTOR)
        model["locations"] = locationRepository.findAll()
        model["category"] = categoryRepository.findAll()
        return "listCourses"
    }


    @Secured("ROLE_INSTRUCTOR")
    @RequestMapping(path = ["/createCourse"], method = [RequestMethod.GET])
    fun createCourse(@RequestParam(required = false) id: Int?, model: Model): String {

        if (id != null) {
            if (courseRepository.findById(id)
                    .get().instructor?.username != SecurityContextHolder.getContext().authentication.name
            ) {
                return "redirect:listCourses"
            }
        }
        model["course"] = if (id == null) Course()
        else courseRepository.findById(id).orElse(Course())

        return populateCreateCourseModel(model)
    }

    private fun populateCreateCourseModel(model: Model): String {
        model["locations"] = locationRepository.findAll()
        model["category"] = categoryRepository.findAll()
        return "createCourse"
    }

    @Secured("ROLE_INSTRUCTOR")
    @RequestMapping("/newCourse", method = [RequestMethod.POST])
    fun newCourse(
        @ModelAttribute @Valid course: Course, bindingResult: BindingResult, model: Model,
        @RequestParam(required = false) file: String? = null
    ): String {//@Valid @ModelAttribute user: User, bindingResult: BindingResult, model: Model): String {
        if (bindingResult.hasErrors()) {
            return populateCreateCourseModel(model)
        }
        try {
            val username = SecurityContextHolder.getContext().authentication.name
            course.instructor = userRepository.findByUsername(username)
            //course.instructor = SecurityContextHolder.getContext().authentication.name.
            courseRepository.save(course)
        } catch (e: DataIntegrityViolationException) {
            return populateCreateCourseModel(model)
        } catch (e: Exception) {
            return populateCreateCourseModel(model)
        }


        return "redirect:listCourses"//"redirect:/editEmployee?id=" + employee.id
    }

    @Secured("ROLE_INSTRUCTOR")
    @RequestMapping(path = ["/createLocation"], method = [RequestMethod.GET])
    fun createLocation(model: Model): String {
        model["course"] = Location()
        return "createLocation"
    }

    @Secured("ROLE_INSTRUCTOR")
    @RequestMapping("/newLocation", method = [RequestMethod.POST])
    fun newLocation(
        @ModelAttribute @Valid location: Location,
        bindingResult: BindingResult,
        model: Model
    ): String {//@Valid @ModelAttribute user: User, bindingResult: BindingResult, model: Model): String {
        try {
            locationRepository.save(location)
        } catch (e: DataIntegrityViolationException) {
            return "createLocation"
        } catch (e: Exception) {
            return "createLocation"
        }
        return "redirect:createCourse"
    }

    @Secured("ROLE_INSTRUCTOR")
    @RequestMapping(path = ["/createCategory"], method = [RequestMethod.GET])
    fun createCategory(model: Model): String {
        model["course"] = CourseCategory()
        return "createCategory"
    }

    @Secured("ROLE_INSTRUCTOR")
    @RequestMapping("/newCategory", method = [RequestMethod.POST])
    fun newCategory(
        @ModelAttribute @Valid category: CourseCategory,
        bindingResult: BindingResult,
        model: Model
    ): String {
        try {
            categoryRepository.save(category)
        } catch (e: DataIntegrityViolationException) {
            return "createCategory"
        } catch (e: Exception) {
            return "createCategory"
        }
        return "redirect:createCourse"
    }

    @RequestMapping(path = ["/courseRegistration"], method = [RequestMethod.POST])
    fun courseRegistration(model: Model, @RequestParam id: Int): String {
        val course: Course = courseRepository.findById(id).get()
        val username = SecurityContextHolder.getContext().authentication.name
        val sender = "myusi.wappdev@gmail.com"
        if (username != "anonymousUser") {
            val user = userRepository.findByUsername(username)

            course.participants?.add(user)
            courseRepository.save(course)

            mailSender?.sendMail(
                sender, user.email,
                "Registration for course ${course.courseName} succeeded",
                "You have booked the course number ${course.id}, ${course.courseName}, with ${course.instructor?.firstName} ${course.instructor?.lastName} on ${course.date}, ${course.timeStart} - ${course.timeEnd}"
            )
        }
        return "redirect:listCourses"
    }

    @RequestMapping(path = ["/courseDeregistration"], method = [RequestMethod.POST])
    fun courseRDeregistration(model: Model, @RequestParam id: Int): String {
        val course: Course = courseRepository.findById(id).get()
        val sender = "myusi.wappdev@gmail.com"
        val username = SecurityContextHolder.getContext().authentication.name
        if (username != "anonymousUser") {
            val user = userRepository.findByUsername(username)
            if (course.participants?.contains(user) == true) {
                course.participants?.remove(user)
            }

            mailSender?.sendMail(
                sender, user.email,
                "Registration cancelled for course ${course.courseName}",
                "You have successfully cancelled your registration for the course number ${course.id}, ${course.courseName}, with ${course.instructor?.firstName} ${course.instructor?.lastName} on ${course.date}, ${course.timeStart} - ${course.timeEnd}"
            )

            courseRepository.save(course)
        }

        return "redirect:listCourses"
    }

    @RequestMapping(path = ["/courseDetails"], method = [RequestMethod.GET])
    fun courseDetails(model: Model, @RequestParam id: Int): String {
        val course = courseRepository.findCourseById(id)
        model["course"] = course

        return "courseDetails"
    }

    @RequestMapping(path = ["/listInstructorCourses"], method = [RequestMethod.GET])
    fun listInstructorCourses(
        model: Model, instructor: User?
    ): String? {
        val loggedUser = SecurityContextHolder.getContext().authentication.name
        val instructorCourses = courseRepository.findCoursesByInstructor(userRepository.findByUsername(loggedUser))
        if (instructorCourses != null) {
            model["courses"] = instructorCourses
        }
        model["locations"] = locationRepository.findAll()
        return "listInstructorCourses"
    }

    @Secured("ROLE_INSTRUCTOR")
    @RequestMapping(path = ["/deleteCourse"], method = [RequestMethod.POST])
    fun deleteCourse(@RequestParam(required = false) id: Int?, model: Model): String {
        if (id != null) {
            val courseToDelete: Course = courseRepository.findById(id).get()
            val instructor: User = userRepository.findByUsername(SecurityContextHolder.getContext().authentication.name)
            if (courseToDelete.instructor?.username == instructor.username || instructor.role == UserRole.ROLE_ADMIN) {
                if (courseToDelete.participants != null) {
                    for (user in courseToDelete.participants!!) {
                        mailSender?.sendMail(
                            instructor.email!!, user.email,
                            "Registration cancelled for course ${courseToDelete.courseName}",
                            "The course number ${courseToDelete.id}, ${courseToDelete.courseName}, with ${courseToDelete.instructor?.firstName} ${courseToDelete.instructor?.lastName} on ${courseToDelete.date}, ${courseToDelete.timeStart} - ${courseToDelete.timeEnd} was deleted. Therefore you registration has been cancelled."
                        )
                    }
                }
                courseRepository.delete(courseToDelete)
            }
        }
        return "redirect:listCourses"
    }


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

    @RequestMapping(path = ["/listUserCourses"], method = [RequestMethod.GET])
    fun listUserCourses(
        model: Model, id: Int?
    ): String? {
        val loggedUserName = userRepository.findByUsername(SecurityContextHolder.getContext().authentication.name)
        val userCourses = courseRepository.findCoursesByParticipantsContains(loggedUserName)
        if (userCourses != null) {
            model["courses"] = userCourses
        }
        model["locations"] = locationRepository.findAll()
        return "listUserCourses"
    }
}

