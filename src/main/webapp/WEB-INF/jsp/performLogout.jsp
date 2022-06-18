<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<layout:page-container title="Are you sure you want to logout?" activePage="performLogout">
    <%--@elvariable id="user" type="at.fhjoanneum.myusi.Entity.User"--%>
    <form:form method="post" action="${logoutUrl}">
        <legend>Are you sure you want to logout?</legend>
        <fieldset>
            <div class="mb-3">
                <button type="submit" class="btn btn-lightGreen m-2">Submit</button>
                <a href="listCourses" class="btn btn-default m-2">Cancel</a>
            </div>
        </fieldset>
    </form:form>

</layout:page-container>



