package at.fhjoanneum.myusi.Converter

import org.springframework.core.convert.converter.Converter
import org.springframework.stereotype.Component
import java.time.LocalDate
import java.time.format.DateTimeFormatter

@Component
class StringToDateConverter : Converter<String?, LocalDate?> {

    override fun convert(source: String): LocalDate? {
        if (source.isNullOrBlank()) {
            return null
        }
        return LocalDate.parse(source, DateTimeFormatter.ISO_LOCAL_DATE);
    }

}

@Component
class DateToStringConverter : Converter<LocalDate?,String?> {

    override fun convert(source: LocalDate): String? {
        return source?.format(DateTimeFormatter.ISO_LOCAL_DATE);
    }

}