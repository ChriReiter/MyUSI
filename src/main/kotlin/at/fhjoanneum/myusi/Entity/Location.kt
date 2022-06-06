package at.fhjoanneum.myusi.Entity

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
    @field:NotNull
    var country: String? = null,
    @field:Size(min = 2, max = 240)
    var city: String? = null,
    @field:Size(min = 2, max = 240)
    var zip: String? = null,
    @field:Size(min = 2, max = 240)
    var street: String? = null,
    @field:NotNull()
    var housenum: String? = null,

    //var latitude
    //var longitude
    //var altitude
) {
}