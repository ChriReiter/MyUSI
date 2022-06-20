<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<layout:page-container title="Courses" activePage="listUserCourses">

    <div class="form-check form-switch mb-3" style="justify-content: right">
        <label for="flexSwitchCheckDefault">Toggle Design</label>
        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
    </div>
    <div class="row" id="layoutCard">
        <c:forEach items="${courses}" var="course">
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="card mb-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
<%--                                <div class="container-sm" id="courseNumber">--%>
<%--                                    #${course.id}--%>
<%--                                </div>--%>
                                <div class="rounded-pill" id="courseNumber">
                                    <p class="align-middle text-center"> #${course.id} </p>
                                </div>
                            </div>
                            <c:if test="${course.numSpaces - course.participants.size() > 0}">
<%--                                <div class="col" >--%>
<%--                                    <div class="container-sm" id="freeSpaces">--%>
<%--                                            ${course.participants.size()} / ${course.numSpaces}--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                            <div class="col" >
                                <div class="progress rounded-pill" style="height:30px">
                                    <div class="progress-bar progress-bar-lightGreen" style="width:${100*(course.numSpaces - course.participants.size())/course.numSpaces}%">
                                        <c:if test="${((course.numSpaces - course.participants.size())/course.numSpaces) > 0.5}">Free spots: </c:if>${course.numSpaces - course.participants.size()}/${course.numSpaces}
                                    </div>
                                </div></div>
                            </c:if>
                            <c:if test="${course.numSpaces - course.participants.size() <= 0}">
<%--                                <div class="col" >--%>
<%--                                    <div class="container-sm" id="courseFull">--%>
<%--                                            ${course.participants.size()} / ${course.numSpaces}--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                            <div class="col" >
                                <div class="progress rounded-pill" style="height:30px">
                                    <div class="progress-bar bg-danger" style="width:100%">
                                        Free spots: ${course.numSpaces - course.participants.size()}/${course.numSpaces}
                                    </div>
                                </div></div>
                            </c:if>

                        </div>

                    </div>
                    <a href="/courseDetails?id=${course.id}">
                        <sec:csrfInput/>
                        <img class="card-img-top img-fluid" style="width: 420px; height: 240px" src="files/${course.category.files.get(0).id}" type="submit" />
                    </a>
                    <div class="card-body">
                        <div class="card-title">
                            <h4>${course.courseName}</h4>
                        </div>
                        <div class="card-text">
                            <p>With: ${course.instructor.firstName} ${course.instructor.lastName}</p>
                            <div class="row">
                                <div class="col">
                                    <p>When: <fmt:parseDate value="${course.date}" pattern="yyyy-MM-dd" var="parsedDate"
                                                            type="date"/>
                                        <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/>, ${course.timeStart.substring(0, 5)} - ${course.timeEnd.substring(0, 5)}</p>
                                </div>
                            </div>
                            <p>Where: ${course.locations.name}</p>
                            <div class="row">
                                <div class="col">
                                    <p>
                                        Cost: <fmt:formatNumber value="${course.price}" minFractionDigits="2" maxFractionDigits="2"/> €
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="row">
                                <form method="post" class="col" action="/courseDeregistration?id=${course.id}">
                                    <sec:csrfInput/>
                                    <button id="notBookCourseButton" type="submit" class="btn btn-danger m-2">Cancel Booking</button>
                                </form>
                                <div class="col" style="align-content: center">
                                    <sec:authorize access="hasRole('ROLE_INSTRUCTOR') && !hasRole('ROLE_ADMIN')">
                                    <c:if test="${currentUser == course.instructor.username}">
                                        <a href="/sendMailtoEnrolledUsers?id=${course.id}">
                                            <sec:csrfInput/>
                                            <button id="mailToButton" class="btn btn-secondary m-2">Mail Users</button>
                                        </a>
                                    </c:if>
                                    </sec:authorize>
                                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                                        <a href="/sendMailtoEnrolledUsers?id=${course.id}">
                                            <sec:csrfInput/>
                                            <button id="mailToButton" class="btn btn-secondary m-2">Mail Users</button>
                                        </a>
                                    </sec:authorize>
                                </div>
                                <div class="col" style="align-content: center">
                                    <sec:authorize access="hasRole('ROLE_INSTRUCTOR') && !hasRole('ROLE_ADMIN')">
                                        <c:if test="${currentUser == course.instructor.username}">
                                            <form method="post" class="col" action="/deleteCourse?id=${course.id}">
                                                <sec:csrfInput/>
                                                <button id="deleteCourseButton" type="submit" class="btn btn-danger m-2">Delete Course</button>
                                            </form>
                                        </c:if>
                                    </sec:authorize>
                                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                                    <form method="post" class="col" action="/deleteCourse?id=${course.id}">
                                        <sec:csrfInput/>
                                        <button id="deleteCourseButton" type="submit" class="btn btn-danger m-2">Delete Course</button>
                                    </form>
                                    </sec:authorize>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <table data-toggle="table" class="table table-striped table-bordered" id="layoutTable" hidden>
        <thead class="thread-dark">
        <tr>
            <th data-sortable="true">No</th>
            <th data-sortable="true">Name</th>
            <th data-sortable="true">Price</th>
            <th data-sortable="true">Free Spaces</th>
            <th data-sortable="true">When</th>
            <th data-sortable="true">Where</th>
            <th data-sortable="true">Who</th>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <th>Actions</th>
            </sec:authorize>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${courses}" var="course">
            <tr>
                <td>${course.id}</td>
                <td>${course.courseName}</td>
                <td>${course.price}</td>
                <td>${course.numSpaces - course.participants.size()}</td>
                <td>
                    <fmt:parseDate value="${course.date}" pattern="yyyy-MM-dd" var="parsedDate"
                                   type="date"/>
                    <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/>, ${course.timeStart.substring(0, 5)} - ${course.timeEnd.substring(0, 5)}
                </td>
                <td>${course.locations.name}</td>
                <td>${course.instructor.firstName} ${course.instructor.lastName}</td>
                <td>
                    <form method="post" class="col" action="/courseDeregistration?id=${course.id}">
                        <sec:csrfInput/>
                        <button id="notBookCourseButton" type="submit" class="btn btn-danger m-2">Cancel Booking</button>
                    </form>
                    <div class="col" style="align-content: center">
                        <sec:authorize access="hasRole('ROLE_INSTRUCTOR')">
                            <c:if test="${currentUser == course.instructor.username}">
                                <form method="post" class="col" action="/deleteCourse?id=${course.id}">
                                    <sec:csrfInput/>
                                    <button id="deleteCourseButton" type="submit" class="btn btn-danger m-2">Delete Course</button>
                                </form>
                            </c:if>
                        </sec:authorize>

                    </div>
                    <div class="col" style="align-content: center">
                        <sec:authorize access="hasRole('ROLE_INSTRUCTOR') && !hasRole('ROLE_ADMIN')">
                       <c:if test="${course.participants.contains(currentUser)}">
                        <a href="/sendMailToInstructor?id=${course.id}">
                            <sec:csrfInput/>
                            <button id="mailToInstructor" class="btn btn-secondary m-2">Mail to Instructor</button>
                        </a>
                        </c:if>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <a href="/sendMailtoEnrolledUsers?id=${course.id}">
                                <sec:csrfInput/>
                                <button id="mailToButton" class="btn btn btn-lightGreen m-2">Mail Users</button>
                            </a>
                        </sec:authorize>
                    </div>
                    <div class="col" style="align-content: center">
                        <sec:authorize access="hasRole('ROLE_INSTRUCTOR') && !hasRole('ROLE_ADMIN')">
                        <c:if test="${currentUser == course.instructor.username}">
                            <a href="/createCourse?id=${course.id}">
                                <sec:csrfInput/>
                                <button id="bookCourseButton" class="btn btn-secondary m-2">Modify Course</button>
                            </a>
                        </c:if>
                        </sec:authorize>
                    </div>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    </div>
    </div>

</layout:page-container>

<script src="/js/switchLayout.js"></script>