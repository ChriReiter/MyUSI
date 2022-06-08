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
        <div class="col-md-12">

            <form id="searchform">
                <div class="row">
                    <div class="col">
                        <label for="inputSearch" class="form-label">Search</label>
                        <input id="inputSearch" name="search" class="form-control" value="${param.search}"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <label for="dateSearch" class="form-label">Select Date</label>
                        <input id="dateSearch" name="date" class="form-control" type="date" value="${param.date}"/>
                    </div>
                    <div class="col">
                        <label for="timeStartSearch" class="form-label">Select Start Time</label>
                        <input id="timeStartSearch" name="timeStart" class="form-control" type="time" value="${param.timeStart}"/>
                    </div>
                    <div class="col">
                        <label for="timeEndSearch" class="form-label">Select End Time</label>
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
                        </div>
                    </div>
                </div>

            </form>

            <h2>Design 1</h2>

            <div class="row">
                <c:forEach items="${courses}" var="course">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card border-dark mb-5 shadow-sm text-center text-black">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col">
                                        #${course.id}
                                    </div>
                                    <div class="col">
                                        Free spaces: ${course.numSpaces - course.participants.size()}
                                    </div>
                                </div>

                            </div>
                            <img class="card-img-top" src="img/Screenshot (4).png"/>
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>${course.courseName}</h4>
                                </div>
                                <div class="card-text">
                                    <p>With ${course.instructor.firstName} ${course.instructor.lastName}</p>
                                    <div class="row">
                                        <div class="col">
                                            <p><fmt:parseDate value="${course.date}" pattern="yyyy-MM-dd" var="parsedDate"
                                                              type="date"/>
                                                <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/>, ${course.timeStart.substring(0, 5)} - ${course.timeEnd.substring(0, 5)}</p>
                                        </div>
                                    </div>
                                    <p>${course.locations.name}</p>
                                    <div class="row">
                                        <div class="col">
                                            <p>
                                                <fmt:formatNumber value="${course.price}" minFractionDigits="2" maxFractionDigits="2"/> €
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="col">
                                        <a href="/listCourses" class="btn btn-outline-primary">Book course</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <h2>Design 2</h2>

            <table data-toggle="table" class="table table-striped table-bordered">
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
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <td>Admin Actions</td>
                        </sec:authorize>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</layout:page-container>
