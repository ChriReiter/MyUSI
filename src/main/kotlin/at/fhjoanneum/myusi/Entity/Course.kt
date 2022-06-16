package at.fhjoanneum.myusi.Entity

import jdk.jfr.Timestamp
import org.springframework.format.annotation.DateTimeFormat
import java.sql.Time
import java.time.LocalDate
import java.time.LocalDateTime
import javax.persistence.*
import javax.validation.constraints.NotNull

@Entity
class Course (
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    @field:NotNull
    var courseName: String? = null,
    @field:NotNull
    var numSpaces: Int? = null,
    @field:NotNull
    var description: String? = null,
    @field:NotNull
    var price: Float? = null,
    @DateTimeFormat
    var date: LocalDate? = null,
    @field:NotNull
    var timeStart: String? = null,
    @field:NotNull
    var timeEnd: String? = null,
    @ManyToOne
    var instructor: User? = null,
    @ManyToMany
    var participants: MutableSet<User>? = null,
    @ManyToOne
    var locations: Location? = null,
    @ManyToOne
    var category: CourseCategory? = null
//    @OneToOne
//    var file: File? = null
    //@OneToMany
    //var dates: List<CourseDate>? =  null
){

}