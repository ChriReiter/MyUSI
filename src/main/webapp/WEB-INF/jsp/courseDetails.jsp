<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="Course Details" activePage="courseDetails">

    <h1 class="mt-4">Details</h1>
    <table class="table table-bordered border-secondary">
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
                <th>Category</th>
                <td>${course.category.categoryName}</td>
            </tr>
            <tr>
                <th>Instructor</th>
                <td>${course.instructor.firstName} ${course.instructor.lastName}</td>
            </tr>
            <tr>
                <th>Free spots</th>
                <c:if test="${course.numSpaces - course.participants.size() > 0}">
                    <td class="text-success">${course.numSpaces - course.participants.size()}</td>
                </c:if>
                <c:if test="${course.numSpaces - course.participants.size() <= 0}">
                    <td class="text-danger">${course.numSpaces - course.participants.size() > 0}</td>
                </c:if>
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
<%--                <td>${course.price}</td>--%>
                <td>
                    <fmt:formatNumber value="${course.price}" type="currency" currencySymbol="€"/>
                </td>
            </tr>
        </tbody>
    </table>

    <h1 class="mt-4">Dates</h1>
    <table class="table table-bordered border-secondary">
        <thead>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
            <th scope="col">Location</th>
        </thead>
        <tbody>
            <tr>
                <td>
                    <fmt:parseDate value="${course.date}" pattern="yyyy-MM-dd" var="parsedDate" type="date"/>
                    <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/>
                </td>
                <td> ${course.timeStart.substring(0, 5)} - ${course.timeEnd.substring(0, 5)}</td>
                <td>${course.locations.name}</td>
            </tr>
        </tbody>
    </table>
</layout:page-container>