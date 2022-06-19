<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="Edit Location" activePage="editLocation">
    <c:set var="errors" value="${requestScope['org.springframework.validation.BindingResult.location']}" />
    <%--@elvariable id="course" type="at.fhjoanneum.myusi.Entity.Location"--%>
    <form:form modelAttribute="course" method="post" action="saveLocation">
        <form:hidden path="id" />
        <fieldset>
            <div class="mb-3">
                <label for="inputName" class="form-label${errors.hasFieldErrors('name') ? 'is-invalid' : ''}">Name</label>
                <form:input path="name" id="inputName"/>
                <form:errors path="name" cssClass="invalid-feedback" />
            </div>
            <div class="mb-3">
                <label for="inputStreet" class="form-label${errors.hasFieldErrors('street') ? 'is-invalid' : ''}">Street</label>
                <form:input path="street" id="inputStreet"/>
                <form:errors path="street" cssClass="invalid-feedback" />
            </div>
            <div class="mb-3">
                <label for="inputHousenum" class="form-label${errors.hasFieldErrors('housenum') ? 'is-invalid' : ''}">Number</label>
                <form:input path="housenum" id="inputHousenum"/>
                <form:errors path="housenum" cssClass="invalid-feedback" />
            </div>
            <div class="mb-3">
                <label for="inputZip" class="form-label${errors.hasFieldErrors('zip') ? 'is-invalid' : ''}">Zip</label>
                <form:input path="zip" id="inputZip"/>
                <form:errors path="zip" cssClass="invalid-feedback" />
            </div>
            <div class="mb-3">
                <label for="inputCity" class="form-label${errors.hasFieldErrors('city') ? 'is-invalid' : ''}">City</label>
                <form:input path="city" id="inputCity"/>
                <form:errors path="city" cssClass="invalid-feedback" />
            </div>
            <div class="mb-3">
                <label for="inputCountry" class="form-label${errors.hasFieldErrors('country') ? 'is-invalid' : ''}">Country</label>
                <form:input path="country" id="inputCountry"/>
                <form:errors path="country" cssClass="invalid-feedback" />
            </div>
            <div class="mb-3">
                <button type="submit" class="btn btn-primary">Change Location</button>
                <a href="saveLocation" class="btn btn-default">Cancel</a>
            </div>
        </fieldset>
    </form:form>

</layout:page-container>

