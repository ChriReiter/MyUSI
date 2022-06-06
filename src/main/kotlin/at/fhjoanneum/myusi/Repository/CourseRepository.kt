package at.fhjoanneum.myusi.Repository

import at.fhjoanneum.myusi.Entity.Course
import at.fhjoanneum.myusi.Entity.User
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface CourseRepository : JpaRepository<Course, Int> {

}