package at.fhjoanneum.myusi.Repository

import at.fhjoanneum.myusi.Entity.Course
import at.fhjoanneum.myusi.Entity.User
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@Repository
interface CourseRepository : JpaRepository<Course, Int> {
    //@Query("SELECT c FROM Course AS c WHERE LOWER(CONCAT(c.firstName, ' ', e.lastName)) LIKE CONCAT('%', LOWER(COALESCE(:search, '')), '%') AND (:department IS NULL OR e.department = :department) ")
    //fun findBySearchText(@Param("search") search: String?, @Param("department") department: Department?): List<Employee>
}