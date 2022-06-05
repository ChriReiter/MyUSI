<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<layout:page-container title="Register" activePage="register">
    <c:set var="errors" value="${requestScope['org.springframework.validation.BindingResult.user']}" />
    <%--@elvariable id="user" type="at.fhjoanneum.myusi.Entity.User"--%>
<form:form modelAttribute="user" method="post" action="newUser">
    <form:hidden path="id" />
    <form:hidden path="role"/>
    <fieldset>
        <legend>Register</legend>

        <div class="mb-3">
            <label for="inputFirstName" class="form-label${errors.hasFieldErrors('firstName') ? 'is-invalid' : ''}">First Name</label>
            <form:input path="firstName" id="inputFirstName"/>
            <form:errors path="firstName" cssClass="invalid-feedback" />
        </div>
        <div class="mb-3">
            <label for="inputLastName" class="form-label${errors.hasFieldErrors('lastName') ? 'is-invalid' : ''}">Last Name</label>
            <form:input path="lastName" id="inputLastName"/>
            <form:errors path="lastName" cssClass="invalid-feedback" />
        </div>
        <div class="mb-3">
            <label for="inputEmail" class="form-label${errors.hasFieldErrors('email') ? 'is-invalid' : ''}">Email</label>
            <form:input path="email" id="inputEmail"/>
            <form:errors path="email" cssClass="invalid-feedback" />
        </div>
        <div class="mb-3">
            <label for="inputTelephone" class="form-label${errors.hasFieldErrors('lastName') ? 'is-invalid' : ''}">Telephone</label>
            <form:input path="telephone" id="inputTelephone"/>
            <form:errors path="email" cssClass="invalid-feedback" />
        </div>
        <div class="mb-3">
            <label for="inputDate" class="form-label">Birthday</label>
            <form:input path="dayOfBirth" class="form-control ${errors.hasFieldErrors('dayOfBirth') ? 'is-invalid' : ''}"
                        id="inputDate" placeholder="Date" type="date"
            />
            <form:errors path="dayOfBirth" cssClass="invalid-feedback" />
        </div>

        <div class="mb-3">
            <label for="inputGender" class="form-label">Gender</label>
            <form:select id="inputGender" path="gender" cssClass="form-control ${errors.hasFieldErrors('department') ? 'is-invalid' : ''}">
                <form:option value="" label="">  </form:option>
                <form:option value="GENDER_MALE" label="male"> male </form:option>
                <form:option value="GENDER_FEMALE" label="female">female </form:option>
                <form:option value="GENDER_UNDISCLOSED" label="undisclosed">undisclosed</form:option>
            </form:select>
        </div>
        <div class="mb-3">
            <label for="inputUniversity" class="form-label${errors.hasFieldErrors('university') ? 'is-invalid' : ''}">University</label>
            <form:input path="university" id="inputUniversity"/>
            <form:errors path="university" cssClass="invalid-feedback" />
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
            <label for="inputUsername" class="form-label${errors.hasFieldErrors('username') ? 'is-invalid' : ''}">Username</label>
            <form:input path="username" id="inputUsername"/>
        </div>
        <div class="mb-3">
            <label for="inputPassword" class="form-label${errors.hasFieldErrors('password') ? 'is-invalid' : ''}">Password</label>
            <form:input path="password" id="inputPassword"/>
        </div>


        <div class="mb-3">
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="listCourses" class="btn btn-default">Cancel</a>
        </div>
    </fieldset>
</form:form>

</layout:page-container>



