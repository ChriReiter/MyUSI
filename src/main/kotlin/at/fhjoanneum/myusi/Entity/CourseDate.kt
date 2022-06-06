package at.fhjoanneum.myusi.Entity

import org.springframework.format.annotation.DateTimeFormat
import java.sql.Time
import java.time.LocalDate
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id

@Entity
class CourseDate(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    var date: LocalDate? = null,
    var timeStart: Time? = null,
    var timeEnd: Time? = null,
    //var Location
    ) {
}