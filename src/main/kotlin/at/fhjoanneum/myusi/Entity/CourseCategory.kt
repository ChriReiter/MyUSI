package at.fhjoanneum.myusi.Entity

import java.io.Serializable
import java.util.Arrays
import javax.persistence.*
import javax.validation.constraints.NotNull
import javax.validation.constraints.Size
import at.fhjoanneum.myusi.Entity.File

@Entity
class CourseCategory(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id:Int? = null,
    @field:Size(min = 4, max = 240)
    var categoryName: String? = null,
    @OneToMany(fetch = FetchType.EAGER)
    var files: List<File>? = null
) : Comparable<CourseCategory>, Serializable {

    override fun compareTo(other: CourseCategory): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as CourseCategory
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
}