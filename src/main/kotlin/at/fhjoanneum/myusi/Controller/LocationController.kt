package at.fhjoanneum.myusi.Controller

import at.fhjoanneum.myusi.Entity.Course
import at.fhjoanneum.myusi.Entity.Location
import at.fhjoanneum.myusi.Repository.CourseRepository
import at.fhjoanneum.myusi.Repository.LocationRepository
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
import javax.validation.Valid

@Controller
class LocationController(val locationRepository: LocationRepository, val courseRepository: CourseRepository) {

    @Secured("ROLE_INSTRUCTOR")
    @RequestMapping(path = ["/createLocation"], method = [RequestMethod.GET])
    fun createLocation(model: Model): String {
        model["course"] = Location()
        return "createLocation"
    }
    @Secured("ROLE_INSTRUCTOR")
    @RequestMapping(path = ["/editLocations"], method = [RequestMethod.GET])
    fun editLocations(model: Model): String {
        model["locations"] = locationRepository.findAll()
        return "editLocations"
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
    @RequestMapping("/deleteLocation", method = [RequestMethod.GET])
    fun deleteLocation(model: Model, @RequestParam id: Int): String {

        if (locationRepository.findById(id).isPresent) {
            if(id == 0){
                model["errorMessage"] = "Cannot delete Location 0"
                return editLocations(model)
            }
            var location = Location(id)

            if (id != null) {
                model["location"] =  "Location having Id ${location.id} deleted"
                model["locations"] = locationRepository.findAll()
            }
            else {
                return ""
            }

            val courses = courseRepository.findCoursesByLocationsId(id)?.toList()
            if (courses != null) {
                for (course in courses){
                    course.locations = locationRepository.findById(0).get()
                    courseRepository.save(course)
                }
            }
            try{
                locationRepository.deleteById(id)
            }catch(e:Exception){
                model["errorMessage"] = "Error while deleting"
            }
        }
        return "redirect:editLocations"
    }
}