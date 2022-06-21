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
<a href="/">
    <div class="text-end me-2">
        <img src="/img/logo.png" class="img-fluid">
    </div>
</a>

<nav class="navbar navbar-expand-lg mb-4">
    <div class="container">
        <a class="navbar-brand" href="/">MyUSI</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="bi bi-list darkgreen"></i>

        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="navbar-nav">
                <sec:authorize access="hasAuthority('ROLE_INSTRUCTOR')">
                    <a class="nav-item nav-link" href="/createCourse">Create Course</a>
                </sec:authorize>
                <sec:authorize access="hasAuthority('ROLE_INSTRUCTOR')">
                    <a class="nav-item nav-link" href="/listInstructorCourses">Show my Courses</a>
                </sec:authorize>
                <sec:authorize access="hasAuthority('ROLE_USER')">
                    <a class="nav-item nav-link" href="/listUserCourses">My booked Courses</a>
                </sec:authorize>
            </div>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <span class="nav-link"><i class="bi bi-person"></i><c:out value="${currentUser}"/></span>
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

<!-- Footer -->
<footer class="text-center text-lg-start text-muted" style="background-color: #1D1E2C;">
    <!-- Section: Social media -->
    <section
            class="d-flex justify-content-center justify-content-lg-between p-4"
            style="background-color: #1D1E2C"
    >
    </section>
    <!-- Section: Social media -->

    <!-- Section: Links  -->
    <section class="" style="background-color: #1D1E2C">
        <div class="container text-center text-md-start mt-5">
            <!-- Grid row -->
            <div class="row mt-3" style="background-color: #1D1E2C">
                <!-- Grid column -->
                <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                    <!-- Content -->
                    <h6 class="text-uppercase fw-bold mb-4" style="color: #4FB286">
                        <i class="fas fa-gem me-3"></i>MyUSI
                    </h6>
                    <p style="color: #50FFB1">
                        An amazing web application to book your favorite USI courses,
                        just create an account and start your journey!
                    </p>
                </div>
                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4" style="color: #4FB286">
                        Courses
                    </h6>
                    <p style="color: #50FFB1">
                        <a href="/listCourses" class="text-reset">All courses</a>
                    </p>
                    <p style="color: #50FFB1">
                        <a href="/listUserCourses" class="text-reset">My booked courses</a>
                    </p>
                    <sec:authorize access="hasAuthority('ROLE_INSTRUCTOR')">
                        <p style="color: #50FFB1">
                            <a href="/listInstructorCourses" class="text-reset">My courses</a>
                        </p>
                        <p style="color: #50FFB1">
                            <a href="/createCourse" class="text-reset">Create Course</a>
                        </p>
                        <p style="color: #50FFB1">
                            <a href="/createLocation" class="text-reset">Create Location</a>
                        </p>
                        <p style="color: #50FFB1">
                            <a href="/createCategory" class="text-reset">Create Category</a>
                        </p>
                    </sec:authorize>

                </div>
                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->

                    <h6 class="text-uppercase fw-bold mb-4" style="color: #4FB286">
                        Legal Documents
                    </h6>
                    <p style="color: #50FFB1">
                        <a href="/termsAndConditions" class="text-reset">Terms and Conditions</a>
                    </p>
                    <p style="color: #50FFB1">
                        <a href="/imprint" class="text-reset">Imprint</a>
                    </p>
                    <p style="color: #50FFB1">
                        <a href="/privacyPolicy" class="text-reset">Privacy Policy</a>
                    </p>
                </div>

                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                    <h6 class="text-uppercase fw-bold mb-4" style="color: #4FB286">
                        Contact
                    </h6>
                    <p style="color: #50FFB1"><i class="bi bi-house"></i> Eckertstrasse 30i, 8020 Graz, Austria</p>
                    <p style="color: #50FFB1">
                        <i class="bi bi-envelope"></i>
                        myusi.wappdev@gmail.com
                    </p>
                    <p style="color: #50FFB1"><i class="bi bi-phone-fill"></i> +43 664 1234567</p>
                </div>
                <!-- Grid column -->
            </div>
            <!-- Grid row -->
        </div>
    </section>

    <div class="text-center p-4" style="background-color: #1D1E2C;">

    </div>
    <!-- Copyright -->
</footer>
<!-- Footer -->
<bootstrap:bootstrap-js/>
<script src="/js/custom.js"></script>
</body>
</html>
