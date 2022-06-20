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
                        <div class="col-12 col-sm-10">
                            <input id="inputSearch" name="search" class="form-control" style="width: 100%"
                                   value="${param.search}"/>
                        </div>
                        <div class="col-3 col-sm-1">
                            <button id="searchButton" type="submit"><i class="bi bi-search"></i></button>
                        </div>
                        <div class="col-2 col-sm-1">
                            <a id="toggleDropdown" class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                               role="button"
                               data-bs-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                            </a>
                            <div id="searchDropdown" class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <div class="row">
                                    <div class="col">
                                        <label for="dateSearch" class="form-label">Date</label>
                                        <input id="dateSearch" name="date" class="form-control" type="date"
                                               value="${param.date}"/>
                                    </div>
                                    <div class="col">
                                        <label for="timeStartSearch" class="form-label">Start</label>
                                        <input id="timeStartSearch" name="timeStart" class="form-control" type="time"
                                               value="${param.timeStart}"/>
                                    </div>
                                    <div class="col">
                                        <label for="timeEndSearch" class="form-label">End</label>
                                        <input id="timeEndSearch" name="timeEnd" class="form-control" type="time"
                                               value="${param.timeEnd}"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="col">
                                            <label for="instructorSearch" class="form-label">Instructor</label>
                                            <select id="instructorSearch" name="instructor" class="form-control"
                                                    value="${param.instructor}">
                                                <option value=""></option>
                                                <c:forEach var="instructor" items="${instructors}">
                                                    <option value="${instructor.id}"
                                                            <c:if test="${param.instructor == instructor.id}">
                                                                selected
                                                            </c:if>
                                                    >${instructor.firstName} ${instructor.lastName}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="col">
                                                <div class="col">
                                                    <label for="locationSearch" class="form-label">Location</label>
                                                    <select id="locationSearch" name="location" class="form-control"
                                                            value="${param.location}">
                                                        <option value=""></option>
                                                        <c:forEach var="location" items="${locations}">
                                                            <option value="${location.id}"
                                                                    <c:if test="${param.location == location.id}">
                                                                        selected
                                                                    </c:if>
                                                            >${location.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="col">
                                                    <label for="categorySearch" class="form-label">Category</label>
                                                    <select id="categorySearch" name="category" class="form-control"
                                                            value="${param.category}">
                                                        <option value=""></option>
                                                        <c:forEach var="category" items="${category}">
                                                            <option value="${category.id}"
                                                                    <c:if test="${param.category == category.id}">
                                                                        selected
                                                                    </c:if>
                                                            >${category.categoryName}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1"
                                     style="width: 30px; padding-top: 5%; margin-right: 5%; margin-left: auto;">
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
                                            <%--                                        <div class="container-sm" id="courseNumber">--%>
                                            <%--                                            <p class="align-middle"> #${course.id} </p>--%>
                                            <%--                                        </div>--%>
                                        <div class="rounded-pill" id="courseNumber">
                                            <p class="align-middle text-center"> #${course.id} </p>
                                        </div>
                                    </div>
                                    <c:if test="${course.numSpaces - course.participants.size() > 0}">
                                        <div class="col">
                                                <%--                                            <div class="container-sm" id="freeSpaces">--%>
                                                <%--                                                    Free spots: ${course.numSpaces - course.participants.size()}/${course.numSpaces}--%>
                                                <%--                                            </div>--%>
                                            <div class="progress rounded-pill" style="height:30px">
                                                <div class="progress-bar progress-bar-lightGreen"
                                                     style="width:${100*(course.numSpaces - course.participants.size())/course.numSpaces}%">
                                                    <c:if test="${((course.numSpaces - course.participants.size())/course.numSpaces) > 0.5}">Free spots: </c:if>${course.numSpaces - course.participants.size()}
                                                    /${course.numSpaces}
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${course.numSpaces - course.participants.size() <= 0}">
                                        <div class="col">
                                                <%--                                            <div class="container-sm" id="courseFull">--%>
                                                <%--                                                    Free spots: ${course.numSpaces - course.participants.size()}/${course.numSpaces}--%>
                                                <%--                                            </div>--%>

                                            <div class="progress rounded-pill" style="height:30px">
                                                <div class="progress-bar bg-danger" style="width:100%">
                                                    Free
                                                    spots: ${course.numSpaces - course.participants.size()}/${course.numSpaces}
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                            <a href="/courseDetails?id=${course.id}">
                                <sec:csrfInput/>
                                <img class="card-img-top img-fluid" style="width: 420px; height: 240px"
                                     src="files/${course.category.files.get(0).id}" type="submit"/>
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
                                            <fmt:formatDate value="${parsedDate}" type="date"
                                                            pattern="dd.MM.yyyy"/>, ${course.timeStart.substring(0, 5)}
                                            - ${course.timeEnd.substring(0, 5)}</td>
                                    </tr>
                                    <tr>
                                        <th>Location:</th>
                                        <td>${course.locations.name}</td>
                                    </tr>
                                    <tr>
                                        <th>Price:</th>
                                        <td><fmt:formatNumber value="${course.price}" type="currency"
                                                              currencySymbol="€"/></td>
                                    </tr>
                                    </tbody>
                                </table>

                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <c:if test="${currentUser != ''}">
                                                <form method="post" class="col"
                                                      action="/courseRegistration?id=${course.id}">
                                                    <sec:csrfInput/>
                                                    <button id="bookCourseButton${course.id}" type="submit"
                                                            class="btn btn-lightGreen">
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
                                        <div class="col">
                                            <c:forEach items="${course.participants}" var="participant">
                                                <c:if test="${participant.username == currentUser}">
                                                    <script>document.getElementById("bookCourseButton${course.id}").hidden = true</script>
                                                    <form method="post" class="col"
                                                          action="/courseDeregistration?id=${course.id}">
                                                        <sec:csrfInput/>
                                                        <button id="notBookCourseButton" type="submit"
                                                                class="btn btn-danger">Cancel Booking
                                                        </button>
                                                    </form>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <sec:authorize access="hasRole('ROLE_INSTRUCTOR') || hasRole('ROLE_ADMIN') || hasRole('ROLE_USER')">
                                            <a href="/sendMailToInstructor?id=${course.id}">
                                                <sec:csrfInput/>
                                                <button id="mailToInstructorButton" class="btn btn-lightGreen m-2">Mail Instructor</button>
                                            </a>
                                        </sec:authorize>

                                        <sec:authorize access="hasRole('ROLE_INSTRUCTOR') && !hasRole('ROLE_ADMIN')">
                                            <c:if test="${currentUser == course.instructor.username }">

                                                <hr class="mt-3">
                                                <div class="col col-4 w-auto">
                                                    <a href="/createCourse?id=${course.id}">
                                                        <sec:csrfInput/>
                                                        <button id="bookCourseButton" class="btn btn-outline-secondary">
                                                            Modify
                                                        </button>
                                                    </a>
                                                </div>
                                                <div class="col col-4 w-auto">
                                                    <a href="/sendMailToEnrolledUsers?id=${course.id}">
                                                        <sec:csrfInput/>
                                                        <button id="mailToButton" class="btn btn-outline-secondary">Mail
                                                            Users
                                                        </button>
                                                    </a>
                                                </div>
                                                <div class="col col-4 w-auto">
                                                    <form method="post" class="col"
                                                          action="/deleteCourse?id=${course.id}">
                                                        <sec:csrfInput/>
                                                        <button id="deleteCourseButton" type="submit"
                                                                class="btn btn-outline-danger">Delete
                                                        </button>
                                                    </form>
                                                </div>
                                            </c:if>
                                        </sec:authorize>
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <hr class="mt-3">
                                             <div class="col col-4 w-auto">
                                                <a href="/createCourse?id=${course.id}">
                                                    <sec:csrfInput/>
                                                    <button id="bookCourseButton" class="btn btn-outline-secondary">
                                                        Modify
                                                    </button>
                                                </a>
                                            </div>
                                            <div class="col col-4 w-auto">
                                                <a href="/sendMailToEnrolledUsers?id=${course.id}">
                                                    <sec:csrfInput/>
                                                    <button id="mailToButton" class="btn btn-outline-secondary">Mail
                                                        Users
                                                    </button>
                                                </a>
                                            </div>
                                            <div class="col col-4 w-auto">
                                                <form method="post" class="col" action="/deleteCourse?id=${course.id}">
                                                    <sec:csrfInput/>
                                                    <button id="deleteCourseButton" type="submit"
                                                            class="btn btn-outline-danger">Delete
                                                    </button>
                                                </form>
                                            </div>
                                        </sec:authorize>
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
                        <fmt:formatDate value="${parsedDate}" type="date"
                                        pattern="dd.MM.yyyy"/>, ${course.timeStart.substring(0, 5)}
                        - ${course.timeEnd.substring(0, 5)}
                    </td>
                    <td>${course.locations.name}</td>
                    <td>${course.instructor.firstName} ${course.instructor.lastName}</td>
                    <td>
                        <a href="/courseDetails?id=${course.id}">
                            <sec:csrfInput/>
                            <button id="courseDetails" class="btn btn-secondary m-2">Details</button>
                        </a>
                        <c:if test="${currentUser != ''}">
                        <form method="post" class="col" action="/courseRegistration?id=${course.id}">
                            <sec:csrfInput/>
                            <button id="bookCourseButton${course.id}" type="submit" class="btn btn-lightGreen m-2">
                                <c:if test="${course.numSpaces > course.participants.size()}">
                                    Book
                                </c:if>
                                <c:if test="${course.numSpaces <= course.participants.size()}">
                                    Add Queue
                                </c:if>
                            </button>
                        </form>
                        <script>document.getElementById("bookCourseButton${course.id}").hidden = false</script>
                        </c:if>
                        <c:forEach items="${course.participants}" var="participant">
                        <c:if test="${participant.username == currentUser}">
                        <script>document.getElementById("bookCourseButton${course.id}").hidden = true</script>
                        <form method="post" class="col" action="/courseDeregistration?id=${course.id}">
                            <sec:csrfInput/>
                            <button id="notBookCourseButton" type="submit" class="btn btn-danger m-2">Cancel Booking
                            </button>
                        </form>
                        </c:if>
                        </c:forEach>
        </div>
        <sec:authorize access="hasRole('ROLE_INSTRUCTOR') && !hasRole('ROLE_ADMIN')">
        <c:if test="${currentUser == course.instructor.username}">
            <a href="/createCourse?id=${course.id}">
                <sec:csrfInput/>
                <button id="bookCourseButton" class="btn btn-outline-secondary m-2">Modify</button>
            </a>
        </c:if>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
        <a href="/createCourse?id=${course.id}">
            <sec:csrfInput/>
            <button id="bookCourseButton" class="btn btn-outline-secondary m-2">Modify</button>
        </a>
        </sec:authorize>

        <c:if test="${currentUser == course.participants.contains(currentUser)}">
            <a href="/sendMailToInstructor?id=${course.id}">
                <sec:csrfInput/>
                <button id="mailToInstructorButton" class="btn btn-lightGreen m-2">Mail Instructor</button>
            </a>
        </c:if>
        <c:if test="${currentUser == course.instructor.username}">
            <a href="/sendMailToEnrolledUsers?id=${course.id}">
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
<script src="/js/browserGame.js"></script>
