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
            </form>

            <div class="row">
                <c:forEach items="${courses}" var="course">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card border-dark mb-5 shadow-sm text-center text-white">
                            <div class="card-header bg-black">
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
                            <div class="card-body bg-black">
                                <div class="card-title">
                                    <h4>${course.courseName}</h4>
                                </div>
                                <div class="card-text bg-secondary">
                                    <p>With ${course.instructor.firstName} ${course.instructor.lastName}</p>
                                    <div class="row">
                                        <div class="col">
                                            <p><fmt:parseDate value="${course.date}" pattern="yyyy-MM-dd" var="parsedDate"
                                                              type="date"/>
                                                <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/></p>
                                        </div>
                                        <div class="col">
                                                ${course.timeStart.substring(0, 5)} - ${course.timeEnd.substring(0, 5)}
                                        </div>
                                    </div>
                                    <p>${course.locations.name}</p>
                                    <div class="row">
                                        <div class="col">
                                            <p>${course.price}</p>
                                        </div>
                                        <div class="col">
                                            <a href="/listCourses" class="text-white">Book course</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

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
