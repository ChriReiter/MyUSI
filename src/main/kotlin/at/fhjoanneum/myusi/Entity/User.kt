package at.fhjoanneum.myusi.Entity

import java.time.LocalDate
import javax.persistence.*
import javax.validation.constraints.Email
import javax.validation.constraints.NotNull
import javax.validation.constraints.Past
import javax.validation.constraints.Size

enum class UserRole {
    ROLE_USER,
    ROLE_ADMIN,
    ROLE_INSTRUCTOR
}

enum class Gender {
    GENDER_MALE,
    GENDER_FEMALE,
    GENDER_UNDISCLOSED
}

@Entity
class User(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    @Column(nullable = false, unique =true)
    var username: String?,
    @Column(nullable = false, unique = true)
    var password: String?,
    @field:Size(min = 1, max = 240, message = "Field cannot be empty")
    var firstName: String? = null,
    @field:Size(min = 1, max = 240, message = "Field cannot be empty")
    var lastName: String? = null,
    @field:NotNull
    var university: String? = null,
    @field:Email
    var email: String? = null,
    @field:Past
    var dayOfBirth: LocalDate? = null,
    @Enumerated(EnumType.STRING)
    var gender: Gender? = null,
    @field:Size(min = 2, max = 240)
    var city: String? = null,
    @field:Size(min = 2, max = 240)
    var zip: String? = null,
    @field:Size(min = 2, max = 240)
    var street: String? = null,
    @field:NotNull()
    var housenum: String? = null,
    @field:Size(min = 2, max = 240)
    var telephone: String? = null,
    @Enumerated(EnumType.STRING)
    var role: UserRole? = null
)
