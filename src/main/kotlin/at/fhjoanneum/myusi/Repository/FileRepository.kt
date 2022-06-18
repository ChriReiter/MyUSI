package at.fhjoanneum.myusi.Repository

import at.fhjoanneum.myusi.Entity.File
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface FileRepository : JpaRepository<File, Int> {
}