<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<layout:page-container title="Login" activePage="login">
    <c:set var="errors" value="${requestScope['org.springframework.validation.BindingResult.user']}" />
    <%--@elvariable id="user" type="at.fhjoanneum.myusi.Entity.User"--%>
    <form:form modelAttribute="user" method="post" action="${loginUrl}">
        <form:hidden path="id" />
        <form:hidden path="role"/>
        <fieldset>
            <div class="mb-3">
                <c:if test="${param.containsKey('error')}">
                    <div class="alert alert-danger" role="alert">

                        <c:out value="Username or password is wrong!"></c:out>
                    </div>

                </c:if>

            </div>
            <legend>Login</legend>
            <div class="mb-3">
                <label for="inputUsername" class="form-label ${errors.hasFieldErrors('username') ? 'is-invalid' : ''}">Username</label>
                <form:input path="username" id="inputUsername" type="text" class="form-control"/>
            </div>
            <div class="mb-3">
                <label for="inputPassword" class="form-label ${errors.hasFieldErrors('password') ? 'is-invalid' : ''}">Password</label>
                <form:input path="password" id="inputPassword" type="password" class="form-control"/>
            </div>
            <div class="mb-3">
                <label for="rememberMe" class="form-label ${errors.hasFieldErrors('password') ? 'is-invalid' : ''}">Remember Me</label>
                <input id="rememberMe" class="form-check-input" path="rememberMe" name="rememberMe" type="checkbox"/>
            </div>


            <div class="mb-3">
                <button type="submit" class="btn btn-lightGreen m-2">Login</button>
                <%--<a href="listCourses" class="btn btn-default">Cancel</a>--%>
            </div>

            <div class="mb-3">
                <p>You don't have an account? Register <a href="register">here</a> </p>
            </div>
        </fieldset>
    </form:form>

</layout:page-container>



