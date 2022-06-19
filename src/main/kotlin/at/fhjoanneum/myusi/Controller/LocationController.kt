package at.fhjoanneum.myusi.Controller

import at.fhjoanneum.myusi.Entity.Location
import at.fhjoanneum.myusi.Repository.LocationRepository
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
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

}