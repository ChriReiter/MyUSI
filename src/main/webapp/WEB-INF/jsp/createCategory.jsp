<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="file" tagdir="/WEB-INF/tags/file" %>

<layout:page-container title="Create a new Category" activePage="createCategory">
    <c:set var="errors" value="${requestScope['org.springframework.validation.BindingResult.category']}" />
    <%--@elvariable id="course" type="at.fhjoanneum.myusi.Entity.CourseCategory"--%>
    <form:form modelAttribute="course" method="post" action="newCategory">
        <form:hidden path="id" />

        <div class="container border border-dark rounded-4 border-2 p-3 mb-4">

            <div class="form-floating">
                <form:input path="categoryName" type="text" class="form-control mb-3" id="inputCategoryName" placeholder="Category Name" name="inputCategoryName"/>
                <form:errors path="categoryName" cssClass="invalid-feedback" />
                <label for="inputCategoryName" class="form-label${errors.hasFieldErrors('categoryName') ? 'is-invalid' : ''}">Category Name</label>
            </div>
            <fieldset>
                <h4>Upload Image</h4>
                <div class="mb-3">
                    <file:file id="file" value="${category.files}" />
                </div

                <div class="mb-3 mt-3">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <a href="createCourse" class="btn btn-default">Cancel</a>
                </div>
            </fieldset>
        </div>
    </form:form>
</layout:page-container>

<script src="webjars/dropzone/5.9.3/dist/dropzone.js"></script>
<script src="/js/custom-dropzone.js"></script>
