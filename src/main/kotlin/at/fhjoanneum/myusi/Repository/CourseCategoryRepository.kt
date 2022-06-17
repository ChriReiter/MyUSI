package at.fhjoanneum.myusi.Repository

import at.fhjoanneum.myusi.Entity.Course
import at.fhjoanneum.myusi.Entity.CourseCategory
import jdk.jfr.Category
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@Repository
interface CourseCategoryRepository : JpaRepository<CourseCategory, Int> {

    @Query("SELECT c FROM CourseCategory c ORDER BY c.categoryName")
    override fun findAll(): MutableList<CourseCategory>

}