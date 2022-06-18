package at.fhjoanneum.myusi.Service

import at.fhjoanneum.myusi.Entity.CourseCategory
import at.fhjoanneum.myusi.Entity.File
import at.fhjoanneum.myusi.Repository.CourseCategoryRepository
import at.fhjoanneum.myusi.Repository.FileRepository
import org.springframework.stereotype.Service
import org.springframework.web.multipart.MultipartFile
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths
import java.nio.file.StandardOpenOption
import javax.transaction.Transactional
import kotlin.io.path.deleteIfExists

@Service
class FileService(val fileRepository: FileRepository, val courseCategoryRepository: CourseCategoryRepository) {
    fun save(file: File) = fileRepository.save(file)
    @Transactional
    fun createFile(dto: MultipartFile): File {
        val file = convertMultipartFileToFile(dto)
        this.save(file)
        val path = this.retrievePath(file.id!!).toAbsolutePath()
        if (!Files.exists(path)) { Files.createFile(path) }
        Files.write(path, dto.bytes, StandardOpenOption.WRITE)
        return file
    }
    fun convertMultipartFileToFile(dto: MultipartFile) =
        File(contentType = dto.contentType, size = dto.size,
            originalFileName = dto.originalFilename)
    fun retrievePath(id: Int): Path = Paths.get("src/main/resources/static/files/$id")
    fun findById(id: Int) = fileRepository.findById(id).get()
    fun delete(id: Int) {
        fileRepository.delete(findById(id))
        Paths.get("src/main/resources/static/files/$id").deleteIfExists()
    }
}