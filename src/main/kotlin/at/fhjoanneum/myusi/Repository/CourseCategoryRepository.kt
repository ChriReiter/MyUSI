package at.fhjoanneum.myusi.Repository

import at.fhjoanneum.myusi.Entity.Course
import at.fhjoanneum.myusi.Entity.CourseCategory
import jdk.jfr.Category
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface CourseCategoryRepository : JpaRepository<CourseCategory, Int> {

}