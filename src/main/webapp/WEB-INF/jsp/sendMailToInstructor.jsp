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




        <h2>Send Mail to all enrolled Users</h2>

        <form action="/action_page.php">
            <label for="email">Enter your email:</label>
            <div>
                <input type="text" id="email" path="emailToInstructor" style= height:300px;width:400px;>
            </div>
            <div class="mb-3">
                <a href="submitMailToInstructor" class="btn btn-lightGreen m-2" data-bs-toggle="modal" data-bs-target="#confirmSend" >Send Mail</a>
            </div>
        </form>

    <!-- Modal -->
    <div class="modal fade" id="confirmSend" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">

                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Email sent succesfully!
                </div>

            </div>
        </div>
    </div>

</layout:page-container>