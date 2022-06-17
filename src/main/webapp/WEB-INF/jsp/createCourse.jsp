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
        <form:hidden path="instructor"/>


        <legend>Create a new course</legend>
        <div class="container border border-dark rounded-4 border-2 p-3 mb-4">
            <h4>General Information</h4>
            <div class="form-floating">
                <form:select path="category" id="selectCategory" cssClass="form-select mb-3 ${errors.hasFieldErrors('category') ? 'is-invalid' : ''}">
                    <form:option value=""></form:option>
                    <form:options items="${category}" itemValue="id" itemLabel="categoryName"/>
                </form:select>
                <form:errors path="category" cssClass="invalid-feedback"/>
                <label for="selectCategory" class="form-label">Select category:</label>
            </div>
            <div class="mb-3">
                <a href="createCategory" class="btn btn-primary">Create a new category</a>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input path="courseName" type="text" class="form-control" id="inputCourseName" placeholder="Course Name" name="inputCourseName"/>
                <form:errors path="courseName" cssClass="invalid-feedback" />
                <label for="inputCourseName" class="form-label${errors.hasFieldErrors('courseName') ? 'is-invalid' : ''}">Course Name</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input path="description" type="text" class="form-control" id="inputDescription" placeholder="Description" name="inputDescription"/>
                <form:errors path="description" cssClass="invalid-feedback" />
                <label for="inputDescription" class="form-label${errors.hasFieldErrors('description') ? 'is-invalid' : ''}">Description</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input path="numSpaces" type="number" step="1" class="form-control" id="inputNumSpaces" placeholder="Number of free spots" name="inputNumSpaces"/>
                <form:errors path="numSpaces" cssClass="invalid-feedback" />
                <label for="inputNumSpaces" class="form-label${errors.hasFieldErrors('numSpaces') ? 'is-invalid' : ''}">Number of Participants</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input path="price" type="number" step="0.01" class="form-control" id="price" placeholder="Price" name="inputPrice"/>
                <form:errors path="price" cssClass="invalid-feedback" />
                <label for="inputPrice" class="form-label${errors.hasFieldErrors('price') ? 'is-invalid' : ''}">Price (in €)</label>
            </div>
        </div>

        <div class="container border border-dark rounded-4 border-2 p-3 mb-4">
            <h4>Location</h4>
            <div class="form-floating">
                <form:select id="inputLocation" path="locations" cssClass="form-select mb-3 ${errors.hasFieldErrors('department') ? 'is-invalid' : ''}">
                    <form:option value=""> </form:option>
                    <form:options items="${locations}" itemValue="id" itemLabel="name" />
                </form:select>
                <form:errors path="locations" cssClass="invalid-feedback" />
                <label for="inputLocation" class="form-label">Select location:</label>
            </div>
            <div class="mb-3">
                <a href="createLocation" class="btn btn-primary">Create a new location</a>
            </div>
        </div>

        <div class="container border border-dark rounded-4 border-2 p-3 mb-4">
            <h4>Date</h4>
            <div class="form-floating mb-3">
                <form:input path="date" class="form-control ${errors.hasFieldErrors('date') ? 'is-invalid' : ''}"
                            id="inputDate" placeholder="Date" type="date"/>
                <form:errors path="date" cssClass="invalid-feedback" />
                <label for="inputDate" class="form-label">Date</label>
            </div>
            <div class="form-floating mb-3">
                <form:input path="timeStart" id="inputStartTime" type="time" class="form-control"/>
                <form:errors path="timeStart" cssClass="invalid-feedback" />
                <label for="inputStartTime" class="form-label">Start Time</label>
            </div>
            <div class="form-floating mb-3">
                <form:input path="timeEnd" id="inputEndTime" type="time" class="form-control"/>
                <form:errors path="timeEnd" cssClass="invalid-feedback" />
                <label for="inputEndTime" class="form-label">End Time</label>
            </div>
        </div>

        <div class="container border border-dark rounded-4 border-2 p-3 mb-4">
            <h4>Upload Image</h4>
            <div class="chooseImage">
                <form:input path="" type="file" name="inputFile" id="inputFile"/>
                <div class="image-preview" id="imagePreview">
                    <img src="" alt="Image Preview" class="image-preview-image">
                    <span class="image-preview-text">Image Preview</span>
                </div>
            </div>
        </div>

        <div></div>
        <div class="mb-3">
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="listCourses" class="btn btn-default">Cancel</a>
        </div>
    </form:form>

</layout:page-container>

<script src="webjars/dropzone/5.9.3/dist/dropzone.js"></script>
<script src="/js/imageUpload.js"></script>
