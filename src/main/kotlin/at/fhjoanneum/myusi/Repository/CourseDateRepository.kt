package at.fhjoanneum.myusi.Repository

import at.fhjoanneum.myusi.Entity.Course
import at.fhjoanneum.myusi.Entity.CourseDate
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface CourseDateRepository : JpaRepository<CourseDate, Int> {

}