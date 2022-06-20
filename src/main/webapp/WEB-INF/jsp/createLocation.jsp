<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="Create a new Location" activePage="createLocation">
    <c:set var="errors" value="${requestScope['org.springframework.validation.BindingResult.location']}" />
    <%--@elvariable id="course" type="at.fhjoanneum.myusi.Entity.Location"--%>
    <form:form modelAttribute="course" method="post" action="newLocation">
        <form:hidden path="id" />

        <legend>Create a new course</legend>
        <div class="container border border-dark rounded-4 border-2 p-3 mb-4 row">
            <div class="col-md-12 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="name" type="text" class="form-control" id="inputName" placeholder="Location Name" name="inputName"/>
                    <form:errors path="name" cssClass="invalid-feedback" />
                    <label for="inputName" class="form-label${errors.hasFieldErrors('name') ? 'is-invalid' : ''}">Name</label>
                </div>
            </div>
            <div class="col-md-6 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="street" type="text" class="form-control" id="inputStreet" placeholder="Street" name="inputStreet"/>
                    <form:errors path="street" cssClass="invalid-feedback" />
                    <label for="inputStreet" class="form-label${errors.hasFieldErrors('street') ? 'is-invalid' : ''}">Street</label>
                </div>
            </div>
            <div class="col-md-6 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="housenum" type="number" step="1" class="form-control" id="inputHousenum" placeholder="House Number" name="inputHousenum"/>
                    <form:errors path="housenum" cssClass="invalid-feedback" />
                    <label for="inputHousenum" class="form-label${errors.hasFieldErrors('housenum') ? 'is-invalid' : ''}">Number</label>
                </div>
            </div>
            <div class="col-md-4 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="zip" type="number" step="1" class="form-control" id="zip" placeholder="Zip" name="inputZip"/>
                    <form:errors path="zip" cssClass="invalid-feedback" />
                    <label for="inputZip" class="form-label${errors.hasFieldErrors('zip') ? 'is-invalid' : ''}">Zip Code</label>
                </div>
            </div>
            <div class="col-md-4 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="city" type="text" class="form-control" id="inputCity" placeholder="City" name="inputCity"/>
                    <form:errors path="city" cssClass="invalid-feedback" />
                    <label for="inputCity" class="form-label${errors.hasFieldErrors('city') ? 'is-invalid' : ''}">City</label>
                </div>
            </div>
            <div class="col-md-4 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="country" type="text" class="form-control" id="inputCountry" placeholder="Country" name="inputCountry"/>
                    <form:errors path="country" cssClass="invalid-feedback" />
                    <label for="inputCity" class="form-label${errors.hasFieldErrors('country') ? 'is-invalid' : ''}">Country</label>
                </div>
            </div>

            <div class="mb-3">
                <button type="submit" class="btn btn-lightGreen">Submit</button>
                <a href="createCourse" class="btn btn-default">Cancel</a>
            </div>
        </div>

    </form:form>
</layout:page-container>

