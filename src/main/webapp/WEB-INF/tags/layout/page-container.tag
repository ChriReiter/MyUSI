<%@ attribute name="title" required="true" %>
<%@ attribute name="activePage" required="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <bootstrap:bootstrap-metadata/>
    <title>${title}</title>
    <bootstrap:bootstrap-css/>
    <link href="/css/custom.css" rel="stylesheet"/>
</head>
<body>
<div class="text-end me-2">
    <img src="/img/logo.png" class="img-fluid">
</div>

<nav class="navbar navbar-expand-lg mb-4">
    <div class="container">
        <a class="navbar-brand" href="/">MyUSI</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
<%--            <span class="navbar-toggler-icon"></span>--%>
            <i class="bi bi-list darkgreen"></i>

        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="navbar-nav">
                <sec:authorize access="hasAuthority('ROLE_INSTRUCTOR')">
                    <a class="nav-item nav-link" href="/createCourse" >Create Course</a>
                </sec:authorize>
                <sec:authorize access="hasAuthority('ROLE_INSTRUCTOR')">
                    <a class="nav-item nav-link" href="/listInstructorCourses" >Show my Courses</a>
                </sec:authorize>
                <sec:authorize access="hasAuthority('ROLE_USER')">
                    <a class="nav-item nav-link" href="/listUserCourses" >My booked Courses</a>
                </sec:authorize>
                </div>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <span class="nav-link"><i class="bi bi-person"></i><c:out value="${currentUser}" /></span>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-bs-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                    </a>

                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <sec:authorize access="hasAuthority('ROLE_USER')">
                            <a class="dropdown-item" href="/performLogout" class="nav-link">Logout</a>
                        </sec:authorize>
                        <c:if test="${currentUser == ''}">
                            <a class="dropdown-item" href="/login" class="nav-link">Login</a>
                        </c:if>

                    </div>
                </li>

            </ul>
        </div>
    </div>
</nav>


<div class="container" role="main">



    <!-- Messages ----------------------------------------------------------- -->

    <!-- Error message ----------------------------------------------------------- -->
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger" role="alert">${errorMessage}</div>
    </c:if>
    <!-- Error message ----------------------------------------------------------- -->

    <!-- Warning message ----------------------------------------------------------- -->
    <c:if test="${not empty warningMessage}">
        <div class="alert alert-warning" role="warning">${warningMessage}</div>
    </c:if>
    <!-- Warning message ----------------------------------------------------------- -->

    <!-- successful message ----------------------------------------------------------- -->
    <c:if test="${not empty message}">
        <div class="alert alert-success" role="warning">${message}</div>
    </c:if>
    <!-- successful message ----------------------------------------------------------- -->

    <!-- Messages ----------------------------------------------------------- -->
    <jsp:doBody/>
</div>
<bootstrap:bootstrap-js/>
<script src="/js/custom.js"></script>
</body>
</html>
