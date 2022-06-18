<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<layout:page-container title="Courses" activePage="listCourses">

    <div class="row">
        <div class="col-md-12 mt-4">
            <form id="searchform">
                <div class="container-startscreen">
                    <div class="row">
                        <div class="col">
                            <input id="inputSearch" name="search" class="form-control" style="width: 100%" value="${param.search}"/>
                        </div>
                        <div class="col-sm-1">
                            <button id="searchButton" type="submit"><i class="bi bi-search"></i></button>
                        </div>
                        <div class="col-sm-1">
                            <a id="toggleDropdown" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                               data-bs-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                            </a>
                            <div id="searchDropdown" class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <div class="row">
                                    <div class="col">
                                        <label for="dateSearch" class="form-label">Date</label>
                                        <input id="dateSearch" name="date" class="form-control" type="date" value="${param.date}"/>
                                    </div>
                                    <div class="col">
                                        <label for="timeStartSearch" class="form-label">Start</label>
                                        <input id="timeStartSearch" name="timeStart" class="form-control" type="time" value="${param.timeStart}"/>
                                    </div>
                                    <div class="col">
                                        <label for="timeEndSearch" class="form-label">End</label>
                                        <input id="timeEndSearch" name="timeEnd" class="form-control" type="time" value="${param.timeEnd}"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="col">
                                            <label for="instructorSearch" class="form-label">Instructor</label>
                                            <select id="instructorSearch" name="instructor" class="form-control" value="${param.instructor}">
                                                <option value=""></option>
                                                <c:forEach var="instructor" items="${instructors}">
                                                    <option value="${instructor.id}"<c:if
                                                            test="${param.instructor == instructor.id}"> selected</c:if>>${instructor.firstName} ${instructor.lastName}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="col">
                                                <div class="col">
                                                    <label for="locationSearch" class="form-label">Location</label>
                                                    <select id="locationSearch" name="location" class="form-control" value="${param.location}">
                                                        <option value=""></option>
                                                        <c:forEach var="location" items="${locations}">
                                                            <option value="${location.id}"<c:if
                                                                    test="${param.location == location.id}"> selected</c:if>>${location.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="col">
                                                    <label for="categorySearch" class="form-label">Category</label>
                                                    <select id="categorySearch" name="category" class="form-control" value="${param.category}">
                                                        <option value=""></option>
                                                        <c:forEach var="category" items="${category}">
                                                            <option value="${category.id}"<c:if
                                                                test="${param.category == category.id}"> selected</c:if>>${category.categoryName}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="width: 30px; padding-top: 5%; margin-right: 5%; margin-left: auto;">
                                    <button type="submit"><i class="bi bi-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </form>



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
                                        <div class="container-sm" id="courseNumber">
                                            #${course.id}
                                        </div>
                                    </div>
                                    <c:if test="${course.numSpaces - course.participants.size() > 0}">
                                        <div class="col" >
                                            <div class="container-sm" id="freeSpaces">
                                                    Free spots: ${course.numSpaces - course.participants.size()} / ${course.numSpaces}
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${course.numSpaces - course.participants.size() <= 0}">
                                        <div class="col" >
                                            <div class="container-sm" id="courseFull">
                                                    Free spots: ${course.numSpaces - course.participants.size()} / ${course.numSpaces}
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                            <a href="/courseDetails?id=${course.id}">
                                <sec:csrfInput/>
                                <img class="card-img-top" src="img/Screenshot (4).png" type="submit" />
                            </a>
                            <div class="card-body">
                                <div class="card-title d-flex align-items-center justify-content-center">
                                    <h4>${course.courseName}</h4>
                                </div>
                                <table class="table table-borderless">
                                    <tbody>
                                    <tr>
                                        <th>Category:</th>
                                        <td>${course.category.categoryName}</td>
                                    </tr>
                                    <tr>
                                        <th>Instructor:</th>
                                        <td>${course.instructor.firstName} ${course.instructor.lastName}</td>
                                    </tr>
                                    <tr>
                                        <th>Date:</th>
                                        <td><fmt:parseDate value="${course.date}" pattern="yyyy-MM-dd" var="parsedDate"
                                                           type="date"/>
                                            <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/>, ${course.timeStart.substring(0, 5)} - ${course.timeEnd.substring(0, 5)}</td>
                                    </tr>
                                    <tr>
                                        <th>Location:</th>
                                        <td>${course.locations.name}</td>
                                    </tr>
                                    <tr>
                                        <th>Price:</th>
                                        <td><fmt:formatNumber value="${course.price}" type="currency" currencySymbol="€"/></td>
                                    </tr>
                                    </tbody>
                                </table>

                                <div class="card-body">
                                    <div class="row">
                                        <div class="col" style="align-content: center">
                                            <c:if test="${currentUser != ''}">
                                                <form method="post" class="col p-2" action="/courseRegistration?id=${course.id}">
                                                    <sec:csrfInput/>
                                                    <button id="bookCourseButton" type="submit" class="btn btn-lightGreen">Book</button>
                                                </form>
                                            </c:if>
                                        </div>
                                        <div class="col p-2" style="align-content: center">
                                            <c:if test="${currentUser == course.instructor.username}">
                                                <a href="/createCourse?id=${course.id}">
                                                    <sec:csrfInput/>
                                                    <button id="bookCourseButton" class="btn btn-warning">Modify</button>
                                                </a>
                                            </c:if>
                                        </div>
                                        <div class="col" style="align-content: center">
                                            <c:if test="${currentUser == course.instructor.username}">
                                                <a href="/sendMailtoEnrolledUsers?id=${course.id}">
                                                    <sec:csrfInput/>
                                                    <button id="mailToButton" class="btn btn-warning m-2">Mail Users</button>
                                                </a>
                                            </c:if>
                                        </div>
                                        <div class="col p-2" style="align-content: center">
                                            <sec:authorize access="hasRole('ROLE_INSTRUCTOR')">
                                                <c:if test="${currentUser == course.instructor.username}">
                                                    <form method="post" class="col" action="/deleteCourse?id=${course.id}">
                                                        <sec:csrfInput/>
                                                        <button id="deleteCourseButton" type="submit" class="btn btn-danger">Delete</button>
                                                    </form>
                                                </c:if>
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
                    <th data-sortable="true">ID</th>
                    <th data-sortable="true">Title</th>
                    <th data-sortable="true">Price</th>
                    <th data-sortable="true">Free Spots</th>
                    <th data-sortable="true">Date</th>
                    <th data-sortable="true">Location</th>
                    <th data-sortable="true">Instructor</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${courses}" var="course">

                    <tr>
                        <td>${course.id}</td>
                        <td>${course.courseName}</td>
                        <td><fmt:formatNumber value="${course.price}" minFractionDigits="2" maxFractionDigits="2"/> €</td>
                        <td>${course.participants.size()} / ${course.numSpaces}</td>
                        <td>
                            <fmt:parseDate value="${course.date}" pattern="yyyy-MM-dd" var="parsedDate"
                                           type="date"/>
                            <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/>, ${course.timeStart.substring(0, 5)} - ${course.timeEnd.substring(0, 5)}
                        </td>
                        <td>${course.locations.name}</td>
                        <td>${course.instructor.firstName} ${course.instructor.lastName}</td>
                        <td>
                            <a href="/courseDetails?id=${course.id}">
                                <sec:csrfInput/>
                                <button id="courseDetails" class="btn btn-secondary m-2">Details</button>
                            </a>
                            <c:if test="${currentUser != ''}">
                                <form method="post"  action="/courseRegistration?id=${course.id}">
                                    <sec:csrfInput/>
                                    <button id="bookCourseButton" type="submit" class="btn btn-lightGreen m-2">Book</button>
                                </form>
                            </c:if>
                            <c:if test="${currentUser == course.instructor.username}">
                                <a href="/createCourse?id=${course.id}">
                                    <sec:csrfInput/>
                                    <button id="bookCourseButton" class="btn btn-warning m-2">Modify</button>
                                </a>
                            </c:if>
                            <div class="col" style="align-content: center">
                                <c:if test="${currentUser == course.instructor.username}">
                                <a href="/sendMailtoEnrolledUsers?id=${course.id}">
                                    <sec:csrfInput/>
                                    <button id="mailToButton" class="btn btn-lightGreen m-2">Mail Users</button>
                                </a>
                                </c:if>
                        </td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</layout:page-container>

<script src="/js/switchLayout.js"></script>
