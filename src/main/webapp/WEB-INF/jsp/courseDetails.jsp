<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<layout:page-container title="Course Details" activePage="courseDetails">
    <table class="table table-bordered">
        <tbody>
            <tr>
                <th>Title</th>
                <td>${course.courseName}</td>
            </tr>
            <tr>
                <th>ID</th>
                <td>${course.id}</td>
            </tr>
            <tr>
                <th>Instructor</th>
                <td>${course.instructor.firstName} ${course.instructor.lastName}</td>
            </tr>
            <tr>
                <th>Free spots</th>
                <td>${course.numSpaces - course.participants.size()}</td>
            </tr>
            <tr>
                <th>Waiting Queue</th>
                <td>----placeholder----</td>
            </tr>
            <tr>
                <th>Description</th>
                <td>${course.description}</td>
            </tr>
            <tr>
                <th>Price</th>
                <td>${course.price}</td>
            </tr>
        </tbody>
    </table>
</layout:page-container>