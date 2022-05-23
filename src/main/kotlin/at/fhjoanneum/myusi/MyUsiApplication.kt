package at.fhjoanneum.myusi

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class MyUsiApplication

fun main(args: Array<String>) {
    runApplication<MyUsiApplication>(*args)
}
