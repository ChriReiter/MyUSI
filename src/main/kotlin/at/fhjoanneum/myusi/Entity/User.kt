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
    var username: String,
    @Column(nullable = false, unique = true)
    var password: String,
    @field:NotNull(message = "Field cannot be empty")
    var firstName: String? = null,
    @field:NotNull(message = "Field cannot be empty")
    var lastName: String? = null,
    @field:NotNull
    var university: String? = null,
    @field:Email
    var email: String? = null,
    @field:Past
    var dayOfBirth: LocalDate? = null,
    @Enumerated(EnumType.STRING)
    var gender: Gender? = null,
    @field:NotNull(message = "Field cannot be empty")
    var country: String? = null,
    @field:NotNull(message = "Field cannot be empty")
    var city: String? = null,
    @field:NotNull(message = "Field cannot be empty")
    var zip: String? = null,
    @field:NotNull(message = "Field cannot be empty")
    var street: String? = null,
    @field:NotNull(message = "Field cannot be empty")
    var housenum: String? = null,
    @field:NotNull(message = "Field cannot be empty")
    var telephone: String? = null,
    @Enumerated(EnumType.STRING)
    var role: UserRole? = null
)
