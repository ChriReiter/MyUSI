package at.fhjoanneum.myusi.Entity

import java.io.Serializable
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.validation.constraints.NotNull
import javax.validation.constraints.Size

@Entity
class Location(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    var name: String? = null,
    @field:Size(min = 2, max = 240)
    var city: String? = null,
    @field:Size(min = 2, max = 240)
    var zip: String? = null,
    @field:Size(min = 2, max = 240)
    var street: String? = null,
    @field:NotNull()
    var housenum: String? = null,
) : Comparable<Location>, Serializable {
    override fun compareTo(other: Location): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Location
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
}