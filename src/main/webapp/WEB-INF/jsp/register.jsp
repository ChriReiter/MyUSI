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

    <section class="vh-100 gradient-custom">
        <div class="container border border-2 border-dark rounded-4 py-5 col-12 col-lg-11 col-xl-10">
            <div class="row justify-content-center align-items-center ">
                    <div class=" shadow-2-strong card-registration" style="border-radius: 15px;">
                        <div class="card-body p-4 p-md-5">
                            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Register new User</h3>
                            <form>
                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <div class="form-floating mb-3 mt-3">
                                            <input type="text" id="firstName" class="form-control" placeholder="First Name"/>
                                            <label for="firstName">First Name</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <div class="form-floating mb-3 mt-3">
                                            <input type="text" id="lastName" class="form-control form-control-lg" placeholder="Last Name"/>
                                            <label for="lastName">Last Name</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-4 d-flex align-items-center">

                                        <div class="form-floating mb-3 mt-3 datepicker w-100">
                                            <input type="text" class="form-control form-control-lg" id="birthdayDate" placeholder="Birthday"/>
                                            <label for="birthdayDate" class="form-label">Birthday</label>
                                        </div>

                                    </div>
                                    <div class="col-md-6 mb-4">

                                        <h6 class="mb-2 pb-1">Gender: </h6>

                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="femaleGender"
                                                   value="option1" checked />
                                            <label class="form-check-label" for="femaleGender">Female</label>
                                        </div>

                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="maleGender"
                                                   value="option2" />
                                            <label class="form-check-label" for="maleGender">Male</label>
                                        </div>

                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="otherGender"
                                                   value="option3" />
                                            <label class="form-check-label" for="otherGender">Other</label>
                                        </div>

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-4 pb-2">

                                        <div class="form-outline">
                                            <input type="email" id="emailAddress" class="form-control form-control-lg" />
                                            <label class="form-label" for="emailAddress">Email</label>
                                        </div>

                                    </div>
                                    <div class="col-md-6 mb-4 pb-2">

                                        <div class="form-outline">
                                            <input type="tel" id="phoneNumber" class="form-control form-control-lg" />
                                            <label class="form-label" for="phoneNumber">Phone Number</label>
                                        </div>

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12">

                                        <select class="select form-control-lg">
                                            <option value="1" disabled>Choose option</option>
                                            <option value="2">Subject 1</option>
                                            <option value="3">Subject 2</option>
                                            <option value="4">Subject 3</option>
                                        </select>
                                        <label class="form-label select-label">Choose option</label>

                                    </div>
                                </div>

                                <div class="mt-4 pt-2">
                                    <input class="btn btn-primary btn-lg" type="submit" value="Submit" />
                                </div>

                            </form>
                        </div>
                    </div>
            </div>
        </div>
    </section>

    <fieldset>
        <legend>Register</legend>
        <div class="d-md-flex">
            <div class="p-2">
                <label for="inputFirstName" class="form-label ${errors.hasFieldErrors('firstName') ? 'is-invalid' : ''}">First Name</label>
                <form:input path="firstName" id="inputFirstName" type="text" class="form-control"/>
                <form:errors path="firstName" cssClass="invalid-feedback" />
            </div>
            <div class="p-2">
                <label for="inputLastName" class="form-label ${errors.hasFieldErrors('lastName') ? 'is-invalid' : ''}">Last Name</label>
                <form:input path="lastName" id="inputLastName" type="text" class="form-control"/>
                <form:errors path="lastName" cssClass="invalid-feedback" />
            </div>
            <div class="p-2">
                <label for="inputEmail" class="form-label ${errors.hasFieldErrors('email') ? 'is-invalid' : ''}">Email</label>
                <form:input path="email" id="inputEmail" type="email" class="form-control"/>
                <form:errors path="email" cssClass="invalid-feedback" />
            </div>
        </div>
        <div class="d-md-flex">
            <div class="p-2">
                <label for="inputTelephone" class="form-label ${errors.hasFieldErrors('lastName') ? 'is-invalid' : ''}">Telephone</label>
                <form:input path="telephone" id="inputTelephone" type="tel" class="form-control"/>
                <form:errors path="email" cssClass="invalid-feedback" />
            </div>
            <div class="p-2">
                <label for="inputDate" class="form-label">Birthday</label>
                <form:input path="dayOfBirth" class="form-control ${errors.hasFieldErrors('dayOfBirth') ? 'is-invalid' : ''}"
                            id="inputDate" placeholder="Date" type="date"
                />
                <form:errors path="dayOfBirth" cssClass="invalid-feedback" />
            </div>

            <div class="p-2">
                <label for="inputGender" class="form-label">Gender</label>
                <form:select id="inputGender" path="gender" cssClass="form-control ${errors.hasFieldErrors('department') ? 'is-invalid' : ''}">
                    <form:option value="" label="">  </form:option>
                    <form:option value="GENDER_MALE" label="male"> male </form:option>
                    <form:option value="GENDER_FEMALE" label="female">female </form:option>
                    <form:option value="GENDER_UNDISCLOSED" label="undisclosed">undisclosed</form:option>
                </form:select>
            </div>
        </div>
        <div class="p-2">
            <label for="inputUniversity" class="form-label ${errors.hasFieldErrors('university') ? 'is-invalid' : ''}">University</label>
            <form:input path="university" id="inputUniversity" type="text" class="form-control" />
            <form:errors path="university" cssClass="invalid-feedback" />
        </div>
        <div class="d-md-flex">
            <div class="p-2">
                <label for="inputStreet" class="form-label ${errors.hasFieldErrors('street') ? 'is-invalid' : ''}">Street</label>
                <form:input path="street" id="inputStreet" type="text" class="form-control"/>
                <form:errors path="street" cssClass="invalid-feedback" />
            </div>
            <div class="p-2">
                <label for="inputHousenum" class="form-label ${errors.hasFieldErrors('housenum') ? 'is-invalid' : ''}">Number</label>
                <form:input path="housenum" id="inputHousenum" type="num" class="form-control"/>
                <form:errors path="housenum" cssClass="invalid-feedback" />
            </div>
        </div>
        <div class="d-md-flex">
            <div class="p-2">
                <label for="inputZip" class="form-label ${errors.hasFieldErrors('zip') ? 'is-invalid' : ''}">Zip</label>
                <form:input path="zip" id="inputZip" type="text" class="form-control"/>
                <form:errors path="zip" cssClass="invalid-feedback" />
            </div>
            <div class="p-2">
                <label for="inputCity" class="form-label ${errors.hasFieldErrors('city') ? 'is-invalid' : ''}">City</label>
                <form:input path="city" id="inputCity" type="text" class="form-control"/>
                <form:errors path="city" cssClass="invalid-feedback" />
            </div>
            <div class="p-2">
                <label for="inputCountry" class="form-label ${errors.hasFieldErrors('country') ? 'is-invalid' : ''}">Country</label>
                <form:input path="country" id="inputCountry" type="text" class="form-control"/>
                <form:errors path="country" cssClass="invalid-feedback" />
            </div>
        </div>



        <div class="p-2">
            <label for="inputUsername" class="form-label ${errors.hasFieldErrors('username') ? 'is-invalid' : ''}">Username</label>
            <form:input path="username" id="inputUsername" type="text" class="form-control"/>
        </div>
        <div class="d-md-flex">
            <div class="p-2">
                <label for="inputPassword" class="form-label ${errors.hasFieldErrors('password') ? 'is-invalid' : ''}">Password</label>
                <form:input path="password" id="inputPassword" type="password" class="form-control"/>
            </div>
            <div class="p-2">
                <label for="inputPassword" class="form-label ${errors.hasFieldErrors('password') ? 'is-invalid' : ''}">Confirm Password</label>
                <form:input path="password" id="inputPassword" type="password" class="form-control"/>
            </div>
        </div>
            <div class="p-2">
                <button type="submit" class="btn btn-success">Register</button>
                <a href="listCourses" class="btn btn-default">Cancel</a>
            </div>

    </fieldset>
</form:form>

</layout:page-container>



