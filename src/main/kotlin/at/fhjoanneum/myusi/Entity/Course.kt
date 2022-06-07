package at.fhjoanneum.myusi.Entity

import jdk.jfr.Timestamp
import org.springframework.format.annotation.DateTimeFormat
import java.sql.Time
import java.time.LocalDate
import java.time.LocalDateTime
import javax.persistence.*

@Entity
class Course (
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    var courseName: String? = null,
    var numSpaces: Int? = null,
    var description: String? = null,
    var price: Float? = null,
    @DateTimeFormat
    var date: LocalDate? = null,
    var timeStart: String? = null,
    var timeEnd: String? = null,
    @ManyToOne
    var instructor: User? = null,
    @ManyToMany
    var participants: List<User>? = null,
    @ManyToOne
    var locations: Location? = null,
    //@OneToMany
    //var dates: List<CourseDate>? =  null
        ){

}