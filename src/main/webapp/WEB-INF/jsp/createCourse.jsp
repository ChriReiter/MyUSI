<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<layout:page-container title="Create a new Course" activePage="createCourse">
    <c:set var="errors" value="${requestScope['org.springframework.validation.BindingResult.course']}" />
    <%--@elvariable id="course" type="at.fhjoanneum.myusi.Entity.Course"--%>
    <form:form modelAttribute="course" method="post" action="newCourse">
        <form:hidden path="id" />
        <form:hidden path="participants"/>
        <form:hidden path = "instructor"/>


        <fieldset>
            <legend>Create a new course</legend>
            <h2>General Information</h2>
            <div class="container-xl">
                <div class="mb-3">
                    <label for="inputCourseName" class="form-label${errors.hasFieldErrors('courseName') ? 'is-invalid' : ''}">Course Name</label>
                    <form:input path="courseName" id="inputCourseName" cssStyle="width: 100%" type="text" class="form-control"/>
                    <form:errors path="courseName" cssClass="invalid-feedback" />
                </div>
                <div class="mb-3">
                    <label for="inputDescription" class="form-label${errors.hasFieldErrors('description') ? 'is-invalid' : ''}">Description</label>
                    <form:input path="description" id="inputDescription" cssStyle="width: 100%" type="text" class="form-control"/>
                    <form:errors path="description" cssClass="invalid-feedback" />
                </div>
                <div class="mb-3">
                    <label for="inputNumSpaces" class="form-label${errors.hasFieldErrors('numSpaces') ? 'is-invalid' : ''}">Number of Participants</label>
                    <form:input path="numSpaces" id="inputNumSpaces" type="number" step="1" cssStyle="width: 100%" class="form-control"/>
                    <form:errors path="numSpaces" cssClass="invalid-feedback" />
                </div>
                <div class="mb-3">
                    <label for="inputPrice" class="form-label${errors.hasFieldErrors('price') ? 'is-invalid' : ''}">Price (in €)</label>
                    <form:input path="price" id="inputPrice" type="number" step="0.01" cssStyle="width: 100%" class="form-control"/>
                    <form:errors path="price" cssClass="invalid-feedback" />
                </div>
            </div>
            <h2>Location</h2>
            <div class="container-xl">
                <div class="mb-3">
                    <label for="inputLocation" class="form-label">Location</label>
                    <form:select id="inputLocation" path="locations" cssClass="form-control ${errors.hasFieldErrors('department') ? 'is-invalid' : ''}">
                        <form:option value=""> </form:option>
                        <form:options items="${locations}" itemValue="id" itemLabel="name" />
                    </form:select>
                    <form:errors path="locations" cssClass="invalid-feedback" />
                </div>
                <div class="mb-3">
                    <a href="createLocation" class="btn btn-primary">Create a new location</a>
                </div>
            </div>
            <h2>Time</h2>
            <div class="container-xl">
                <div class="mb-3">
                    <label for="inputDate" class="form-label">Date</label>
                    <form:input path="date" class="form-control ${errors.hasFieldErrors('date') ? 'is-invalid' : ''}"
                                id="inputDate" placeholder="Date" type="date"
                    />
                    <form:errors path="date" cssClass="invalid-feedback" />
                </div>
                <div class="mb-3">
                    <label for="inputStartTime" class="form-label">Start Time</label>
                    <form:input path="timeStart" id="inputStartTime" type="time" cssStyle="width: 100%" class="form-control"/>
                    <form:errors path="timeStart" cssClass="invalid-feedback" />
                </div>
                <div class="mb-3">
                    <label for="inputEndTime" class="form-label">End Time</label>
                    <form:input path="timeEnd" id="inputEndTime" type="time" cssStyle="width: 100%" class="form-control"/>
                    <form:errors path="timeEnd" cssClass="invalid-feedback" />
                </div>
            </div>

            <div></div>
            <div class="mb-3">
                <button type="submit" class="btn btn-primary">Submit</button>
                <a href="listCourses" class="btn btn-default">Cancel</a>
            </div>
        </fieldset>
    </form:form>

</layout:page-container>



