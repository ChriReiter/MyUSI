package at.fhjoanneum.myusi.Entity

import at.fhjoanneum.myusi.Service.MailSenderService
import jdk.jfr.Timestamp
import org.apache.commons.logging.Log
import org.springframework.format.annotation.DateTimeFormat
import java.sql.Date
import java.io.Serializable
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
    @ManyToMany
    var waitingQueue: MutableList<User>? = null,
    @ManyToOne
    var locations: Location? = null,
    @ManyToOne
    var category: CourseCategory? = null
//    @OneToOne
//    var file: File? = null
    //@OneToMany
    //var dates: List<CourseDate>? =  null
) : Comparable<Course>, Serializable {
    fun AddParticipant(user: User):Boolean {
        if(participants != null && numSpaces != null && numSpaces!! > participants!!.size){
            participants?.add(user)
            return true
        }else if(waitingQueue != null && participants != null &&numSpaces != null && (!waitingQueue!!.contains(user) || !participants!!.contains(user))){
            waitingQueue?.add(user)
            return false
        }else{
            return false
        }
    }

    fun RemoveParticipant(user: User, mailSender: MailSenderService?,sender:String):Boolean {
        if(participants != null && participants!!.contains(user)){
            participants?.remove(user)




            mailSender?.sendMail(
                sender, user.email,
                "Registration cancelled for course $courseName",
                "You have successfully cancelled your registration for the course number ${id}, ${courseName}, with ${instructor?.firstName} ${instructor?.lastName} on ${date}, $timeStart - $timeEnd"
            )
        }else if(waitingQueue != null && waitingQueue!!.contains(user)){
            waitingQueue?.remove(user)
            ReorderQueue()
        } else{
            return false
        }
        return true
    }
    private fun ReorderQueue(){
        try {
            if(participants != null && numSpaces != null && numSpaces!! > participants!!.size){
                participants?.add(waitingQueue!![0])
                waitingQueue?.removeAt(0)
            }
        }catch(e: Exception){
        }

    }
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Course
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
    override fun compareTo(other: Course): Int {
        return compareValues(id, other.id)
    }
}