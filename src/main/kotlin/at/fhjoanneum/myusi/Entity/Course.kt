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
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    //var courseNumber: Int? = null,
    var numSpaces: Int? = null,
    var description: String? = null,
    var price: Float? = null,
    @DateTimeFormat
    var date: LocalDate? = null,
    //@DateTimeFormat(pattern="hh:mm")
    var timeStart: String? = null,
    //@DateTimeFormat(pattern="hh:mm")
    var timeEnd: String? = null,
    //var prerequesites: List<String>? = MutableList(),
    @ManyToMany
    var users: List<User>? = null,
    @ManyToOne
    var locations: Location? = null,
    //@OneToMany
    //var dates: List<CourseDate>? =  null
        ){

}