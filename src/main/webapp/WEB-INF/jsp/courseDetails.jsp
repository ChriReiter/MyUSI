<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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

    <h1 class="mt-4">Date</h1>
    <table class="table table-bordered border-secondary">
        <thead>
            <th class="text-center align-middle" scope="col">Date</th>
            <th class="text-center align-middle" scope="col">Time</th>
            <th class="text-center align-middle" scope="col">Location</th>
            <th class="text-center align-middle" scope="col">Actions</th>
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
                     ${course.locations.zip} ${course.locations.city}, ${course.locations.country}
                </td>
                <td>
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <c:if test="${currentUser != ''}">
                                    <form method="post" class="col" action="/courseRegistration?id=${course.id}">
                                        <sec:csrfInput/>
                                        <button id="bookCourseButton${course.id}" type="submit" class="btn btn-lightGreen">
                                            <c:if test="${course.numSpaces > course.participants.size()}">
                                            Book
                                            </c:if>
                                            <c:if test="${course.numSpaces <= course.participants.size()}">
                                            Add Queue
                                            </c:if>
                                    </form>
                                    <script>document.getElementById("bookCourseButton${course.id}").hidden = false</script>
                                </c:if>
                            </div>
                            <c:forEach items="${course.participants}" var="participant">
                                <c:if test="${participant.username == currentUser}">
                                    <script>document.getElementById("bookCourseButton${course.id}").hidden = true</script>
                                    <form method="post" class="col" action="/courseDeregistration?id=${course.id}">
                                        <sec:csrfInput/>
                                        <button id="notBookCourseButton" type="submit" class="btn btn-danger">Cancel Booking</button>
                                    </form>
                                </c:if>
                            </c:forEach>
                            <sec:authorize access="hasRole('ROLE_INSTRUCTOR') || hasRole('ROLE_ADMIN')">
                                <c:if test="${currentUser == course.instructor.username}">

                                    <hr class="mt-3">
                                    <div class="col col-4 w-auto">
                                        <a href="/createCourse?id=${course.id}">
                                            <sec:csrfInput/>
                                            <button id="bookCourseButton" class="btn btn-outline-secondary">Modify</button>
                                        </a>
                                    </div>
                                    <div class="col col-4 w-auto">
                                        <a href="/sendMailToEnrolledUsers?id=${course.id}">
                                            <sec:csrfInput/>
                                            <button id="mailToButton" class="btn btn-outline-secondary">Mail Users</button>
                                        </a>
                                    </div>
                                    <div class="col col-4 w-auto">
                                        <form method="post" class="col" action="/deleteCourse?id=${course.id}">
                                            <sec:csrfInput/>
                                            <button id="deleteCourseButton" type="submit" class="btn btn-outline-danger">Delete</button>
                                        </form>
                                    </div>
                                </c:if>
                            </sec:authorize>
                        </div>
                    </div>
                    </div>
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
