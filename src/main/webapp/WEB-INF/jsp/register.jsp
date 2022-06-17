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

    <fieldset class="mb-5">
    <legend>Register</legend>
        <h2>Personal Information</h2>
        <div class="container border border-dark rounded-4 border-2 p-3 mb-4 row">
            <div class="col-md-6 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="firstName" type="text" class="form-control" id="inputFirstName" placeholder="First Name" name="inputFirstName"/>
                    <form:errors path="firstName" class="error"/>
                    <label for="inputFirstName" class="form-label ${errors.hasFieldErrors('firstName') ? 'is-invalid' : ''}">First Name</label>
                </div>
            </div>
            <div class="col-md-6 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="lastName" type="text" class="form-control" id="inputLastName" placeholder="Last Name" name="inputLastName"/>
                    <form:errors path="lastName" class="invalid-feedback" cssClass="error"/>
                    <label for="inputLastName" class="form-label ${errors.hasFieldErrors('lastName') ? 'is-invalid' : ''}">Last Name</label>
                </div>
            </div>
            <div class="col-md-6 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="email" type="email" class="form-control" id="inputEmail" placeholder="email" name="inputEmail"/>
                    <form:errors path="email" class="invalid-feedback" cssClass="error"/>
                    <label for="inputEmail" class="form-label ${errors.hasFieldErrors('inputEmail') ? 'is-invalid' : ''}">Email</label>
                </div>
            </div>
            <div class="col-md-6 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="telephone" type="tel" class="form-control" id="inputTelephone" placeholder="Telephone" name="inputTelephone"/>
                    <form:errors path="telephone" class="invalid-feedback" cssClass="error" />
                    <label for="inputTelephone" class="form-label${errors.hasFieldErrors('telephone') ? 'is-invalid' : ''}">Telephone</label>
                </div>
            </div>
            <div class="col-md-6 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="dayOfBirth" type="date" class="form-control" id="inputdayOfBirth" placeholder="Birthday" name="inputdayOfBirth"/>
                    <form:errors path="dayOfBirth" class="invalid-feedback" cssClass="error" />
                    <label for="inputdayOfBirth" class="form-label${errors.hasFieldErrors('dayOfBirth') ? 'is-invalid' : ''}">Birthday</label>
                </div>
            </div>

            <! ---------------- gender ------------------>
            <div class="col-md-6 mb-4">
<%--                <label for="genderRadio" class="form-label">Gender</label>--%>
    <label for="genderRadio" class="form-label${errors.hasFieldErrors('genderRadio') ? 'is-invalid' : ''}">Gender</label>
                <div id="genderRadio">
                    <form:radiobutton class="form-check-input p-2" path = "gender" value = "GENDER_MALE" label = "Male" />
                    <form:radiobutton class="form-check-input p-2" path = "gender" value = "GENDER_FEMALE" label = "Female" />
                    <form:radiobutton class="form-check-input p-2" path = "gender" value = "GENDER_UNDISCLOSED" label = "Undisclosed" />
                </div>

                <form:errors path="gender" class="invalid-feedback" cssClass="error" />

            </div>

            <div class="col-md-12 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="university" type="text" class="form-control" id="inputUniversity" placeholder="university" name="inputUniversity"/>
                    <form:errors path="university" class="invalid-feedback" cssClass="error" />
                    <label for="inputUniversity" class="form-label${errors.hasFieldErrors('inputUniversity') ? 'is-invalid' : ''}">University</label>
                </div>
            </div>
        </div>

        <h2>Address</h2>
        <div class="container border border-dark rounded-4 border-2 p-3 mb-4 row">
            <div class="col-md-6 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="street" type="text" class="form-control" id="inputStreet" placeholder="First Name" name="inputStreet"/>
                    <form:errors path="street" class="invalid-feedback" cssClass="error" />
                    <label for="inputStreet" class="form-label${errors.hasFieldErrors('street') ? 'is-invalid' : ''}">Street</label>
                </div>
            </div>
            <div class="col-md-6 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="housenum" type="text" class="form-control" id="inputHousenum" placeholder="housenum" name="housenum"/>
                    <form:errors path="housenum" class="invalid-feedback" cssClass="error" />
                    <label for="inputHousenum" class="form-label${errors.hasFieldErrors('housenum') ? 'is-invalid' : ''}">Street Number</label>
                </div>
            </div>
            <div class="col-md-6 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="zip" type="text" class="form-control" id="inputZip" placeholder="email" name="inputZip"/>
                    <form:errors path="zip" class="invalid-feedback" cssClass="error" />
                    <label for="inputZip" class="form-label${errors.hasFieldErrors('zip') ? 'is-invalid' : ''}">Zip</label>
                </div>
            </div>
            <div class="col-md-6 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="city" type="text" class="form-control" id="inputCity" placeholder="City" name="inputCity"/>
                    <form:errors path="city" class="invalid-feedback" cssClass="error" />
                    <label for="inputCity" class="form-label${errors.hasFieldErrors('city') ? 'is-invalid' : ''}">City</label>
                </div>
            </div>
        </div>

        <h2>Account</h2>
        <div class="container border border-dark rounded-4 border-2 p-3 mb-4 row">
            <div class="col-md-6 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="username" type="text" class="form-control" id="inputUsername" placeholder="First Name" name="inputUsername"/>
                    <form:errors path="username" class="invalid-feedback" cssClass="error" />
                    <label for="inputUsername" class="form-label${errors.hasFieldErrors('username') ? 'is-invalid' : ''}">Username</label>
                </div>
            </div>
            <div class="col-md-6 col-12">
                <div class="form-floating mb-3 mt-3">
                    <form:input path="password" type="password" class="form-control" id="inputPassword" placeholder="Password" name="inputPassword"/>
                    <form:errors path="password" class="invalid-feedback" cssClass="error" />
                    <label for="inputPassword" class="form-label${errors.hasFieldErrors('password') ? 'is-invalid' : ''}">Password</label>
                </div>
            </div>
        </div>
        <div class="p-2">
            <button type="submit" class="btn btn-success">Register</button>
            <a href="listCourses" class="btn btn-default">Cancel</a>
        </div>
    </fieldset>
</form:form>

</layout:page-container>



