<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="Send Mail to the Course Instructor" activePage="sendMailtoInstructor">
    <c:set var="errors" value="${requestScope['org.springframework.validation.BindingResult.User']}" />

    <%--@elvariable id="messageClass" type="at.fhjoanneum.myusi.classes.MessageClass"--%>
    <form:form method="post" action="submitMailToInstructor" modelAttribute="messageClass">



        <h2>Send Mail to all enrolled Users</h2>

        <form action="/action_page.php">
            <label for="email">Enter your email:</label>
            <div>
                <input type="email" id="email" path="emailToIntructor" style= height:420px;width:200px;>
            </div>
            <div class="mb-3">
                <a href="submitMailToInstructor" class="btn btn-lightGreen m-2">Send Mail</a>
            </div>
        </form>
    </form:form>

</layout:page-container>