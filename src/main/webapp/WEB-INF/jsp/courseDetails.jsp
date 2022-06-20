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
                    <td class="text-danger">${course.numSpaces - course.participants.size()}</td>
                </c:if>
            </tr>
            <tr>
                <th>Waiting Queue</th>
                <c:if test="${course.waitingQueue.size() == 0}">
                    <td class="text-success">0</td>
                </c:if>
                <c:if test="${course.waitingQueue.size() > 0}">
                    <td class="text-danger">${course.numSpaces - course.waitingQueue.size()}</td>
                </c:if>
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
            <th class="text-center align-middle" scope="col">Date</th>
            <th class="text-center align-middle" scope="col">Time</th>
            <th class="text-center align-middle" scope="col">Location</th>
        </thead>
        <tbody>
            <tr>
                <td class="text-center align-middle">
                    <fmt:parseDate value="${course.date}" pattern="yyyy-MM-dd" var="parsedDate" type="date"/>
                    <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/>
                </td>
                <td class="text-center align-middle"> ${course.timeStart.substring(0, 5)} - ${course.timeEnd.substring(0, 5)}</td>
                <td class="text-center align-middle"> ${course.locations.name} <br>
                     ${course.locations.street} ${course.locations.housenum} <br>
                     ${course.locations.zip} ${course.locations.city}
                </td>
            </tr>
        </tbody>
    </table>

    <h1 class="mt-4">Location</h1>
    <iframe
            style="border:0"
            loading="lazy"
            allowfullscreen
            referrerpolicy="no-referrer-when-downgrade"
            src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDcnOuYLhfXBemiw1of6LbiBGoJFtht66Q
    &q=${course.locations.name}, ${course.locations.city}+${course.locations.street}">
    </iframe>

</layout:page-container>
<script src="/js/phaser.js"></script>
<script src="/js/loadMap.js"></script>
<script src="/js/browserGame.js"></script>
