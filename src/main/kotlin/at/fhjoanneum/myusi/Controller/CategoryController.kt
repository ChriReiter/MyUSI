package at.fhjoanneum.myusi.Controller

import at.fhjoanneum.myusi.Entity.Course
import at.fhjoanneum.myusi.Entity.CourseCategory
import at.fhjoanneum.myusi.Repository.CourseCategoryRepository
import at.fhjoanneum.myusi.Repository.CourseRepository
import at.fhjoanneum.myusi.Repository.FileRepository
import at.fhjoanneum.myusi.Service.FileService
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
class CategoryController(val categoryRepository: CourseCategoryRepository) {

    @Secured("ROLE_INSTRUCTOR")
    @RequestMapping(path = ["/createCategory"], method = [RequestMethod.GET])
    fun createCategory(model: Model): String {
        model["course"] = CourseCategory()
        model["category"] = CourseCategory()
        return "createCategory"
    }

    @Secured("ROLE_INSTRUCTOR")
    @RequestMapping("/newCategory", method = [RequestMethod.POST])
    fun newCategory(@ModelAttribute @Valid category: CourseCategory, bindingResult: BindingResult, model: Model): String {
        if (bindingResult.hasErrors()) {
            model["errorMessage"]="Category must have a name!"
            return createCategory(model)
        }

        try {
            categoryRepository.save(category)
        } catch (e: DataIntegrityViolationException) {
            return "createCategory"
        } catch (e: Exception) {
            return "createCategory"
        }

        return "redirect:createCourse"
    }
}