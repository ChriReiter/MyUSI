package at.fhjoanneum.myusi.Entity

import org.springframework.format.annotation.DateTimeFormat
import java.io.Serializable
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
) : Comparable<CourseDate>, Serializable {
    override fun compareTo(other: CourseDate): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as CourseDate
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
}