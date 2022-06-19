package at.fhjoanneum.myusi.Controller

import at.fhjoanneum.myusi.Entity.Course
import at.fhjoanneum.myusi.Entity.Location
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
class LocationController(val locationRepository: LocationRepository) {

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
    @RequestMapping("/deleteLocation", method = [RequestMethod.GET])
    fun deleteLocation(model: Model, @RequestParam id: Int): String {

        if (locationRepository.findById(id).isPresent) {
            var location = Location(id)
            model["location"] = if (id != null) {
                "Location having Id ${location.id} deleted"
            } else return ""

            locationRepository.deleteById(id)
        }
        return "createCourse"
    }

    @Secured("ROLE_INSTRUCTOR")
    @RequestMapping(path = ["/editLocation"], method = [RequestMethod.GET])
    fun editLocation(id: Int?, model: Model): String {
/*
        if (id != null) {
            if (courseRepository.findById(id)
                    .get().instructor?.username != SecurityContextHolder.getContext().authentication.name
            ) {
                return "redirect:listCourses"
            }
        }
 */
        model["location"] = if (id == null) Location()
        else locationRepository.findById(id).orElse(Location())

        return "editLocation"
    }



    @Secured("ROLE_INSTRUCTOR")
    @RequestMapping("/saveLocation", method = [RequestMethod.POST])
    fun saveLocation(
        @ModelAttribute @Valid location: Location, bindingResult: BindingResult, model: Model,
        @RequestParam(required = false) file: String? = null
    ): String {

        return "create Course"
    }
}