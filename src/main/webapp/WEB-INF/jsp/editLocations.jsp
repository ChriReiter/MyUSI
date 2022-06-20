<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="Edit Locations" activePage="editLocations">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Street</th>
            <th scope="col">Number</th>
            <th scope="col">Zip</th>
            <th scope="col">City</th>
            <th scope="col">Country</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${locations}" var="location">
            <c:if test="${location.id != 0}">
            <tr>
                <th scope="row">${location.id}</th>
                <td>${location.name}</td>
                <td>${location.street}</td>
                <td>${location.housenum}</td>
                <td>${location.zip}</td>
                <td>${location.city}</td>
                <td>${location.country}</td>
                <td>
                    <a type="button" class="btn btn-danger" href="/deleteLocation?id=${location.id}">Delete</a>
                </td>
            </tr>
            </c:if>
        </c:forEach>

        </tbody>
    </table>

</layout:page-container>

