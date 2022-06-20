package at.fhjoanneum.myusi.Repository

import at.fhjoanneum.myusi.Entity.Course
import at.fhjoanneum.myusi.Entity.CourseCategory
import at.fhjoanneum.myusi.Entity.Location
import at.fhjoanneum.myusi.Entity.User
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.format.annotation.DateTimeFormat
import org.springframework.stereotype.Repository
import java.time.LocalDate
import java.time.LocalDateTime

@Repository
interface CourseRepository : JpaRepository<Course, Int> {
    @Query("SELECT c FROM Course AS c WHERE :search IS NULL OR LOWER(c.courseName) LIKE CONCAT('%', COALESCE(LOWER(:search), ''), '%') " +
            "AND (:date IS NULL OR c.date = :date) " +
            "AND (:timeStart IS NULL OR :timeStart = '' OR c.timeStart >= :timeStart) " +
            "AND (:timeEnd IS NULL OR :timeEnd = '' OR c.timeEnd <= :timeEnd) " +
            "AND (:instructor IS NULL OR c.instructor = :instructor) " +
            "AND (:location IS NULL OR c.locations = :location) " +
            "AND (:category IS NULL OR c.category = :category)")
    //AND (:date IS NULL OR c.date = :date) AND (:timeStart IS NULL OR c.timeStart = :timeStart) AND (:instructor IS NULL OR c.instructor = :instructor) AND (:location IS NULL OR c.locations = :location)
    fun findByCourseName(@Param("search") search: String?, @Param("date") date: LocalDate?
    , @Param("timeStart") timeStart: String?, @Param("timeEnd") timeEnd: String?
    , @Param("instructor") instructor: User?, @Param("location") location: Location?
    , @Param("category") category: CourseCategory?
    ): List<Course>

    fun findCourseById(@Param("id") id: Int?): Course

    fun findCoursesByInstructor(@Param("instructor")instructor: User?): List<Course>?

    fun findCoursesByParticipantsContains(@Param("user")user :User?): List<Course>?

    fun findCoursesByLocationsId(@Param("locationsId")locationsId: Int?): List<Course>?
}