<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<layout:page-container title="Courses" activePage="listInstructorCourses">

    <div class="form-check form-switch mb-3" style="justify-content: right">
        <label for="flexSwitchCheckDefault">Toggle Design</label>
        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
    </div>
            <div class="row" id="layoutCard">
                <c:forEach items="${courses}" var="course">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card mb-5">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <div class="rounded-pill" id="courseNumber">
                                            <p class="align-middle text-center"> #${course.id} </p>
                                        </div>

                                    </div>
                                    <c:if test="${course.numSpaces - course.participants.size() > 0}">
                                        <div class="col" >
<%--                                            <div class="container-sm" id="freeSpaces">--%>
<%--                                                    ${course.participants.size()} / ${course.numSpaces}--%>
<%--                                            </div>--%>
                                            <div class="progress rounded-pill" style="height:30px">
                                                <div class="progress-bar progress-bar-lightGreen" style="width:${100*(course.numSpaces - course.participants.size())/course.numSpaces}%">
                                                    <c:if test="${((course.numSpaces - course.participants.size())/course.numSpaces) > 0.5}">Free spots: </c:if>${course.numSpaces - course.participants.size()}/${course.numSpaces}
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${course.numSpaces - course.participants.size() <= 0}">
                                        <div class="col" >
<%--                                            <div class="container-sm" id="courseFull">--%>
<%--                                                    ${course.participants.size()} / ${course.numSpaces}--%>
<%--                                            </div>--%>
                                            <div class="progress rounded-pill" style="height:30px">
                                                <div class="progress-bar bg-danger" style="width:100%">
                                                    Free spots: ${course.numSpaces - course.participants.size()}/${course.numSpaces}
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>

                                </div>

                            </div>
                            <a href="/courseDetails?id=${course.id}">
                                <sec:csrfInput/>
                                <img class="card-img-top img-fluid" style="width: 420px; height: 240px" src="files/${course.category.files.get(0).id}" type="submit" />
                            </a>
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>${course.courseName}</h4>
                                </div>
                                <div class="card-text">
                                    <p>With: ${course.instructor.firstName} ${course.instructor.lastName}</p>
                                    <div class="row">
                                        <div class="col">
                                            <p>When: <fmt:parseDate value="${course.date}" pattern="yyyy-MM-dd" var="parsedDate"
                                                                    type="date"/>
                                                <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/>, ${course.timeStart.substring(0, 5)} - ${course.timeEnd.substring(0, 5)}</p>
                                        </div>
                                    </div>
                                    <p>Where: ${course.locations.name}</p>
                                    <div class="row">
                                        <div class="col">
                                            <p>
                                                Cost: <fmt:formatNumber value="${course.price}" minFractionDigits="2" maxFractionDigits="2"/> €
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col" style="align-content: center">
                                            <c:if test="${currentUser == course.instructor.username}">
                                                <a href="/createCourse?id=${course.id}">
                                                    <sec:csrfInput/>
                                                    <button id="bookCourseButton" class="btn btn-secondary m-2">Modify Course</button>
                                                </a>
                                            </c:if>
                                        </div>
                                        <div class="col" style="align-content: center">
                                            <c:if test="${currentUser == course.instructor.username}">
                                                <a href="/sendMailToEnrolledUsers?id=${course.id}">
                                                    <sec:csrfInput/>
                                                    <button id="mailToButton" class="btn btn-secondary m-2">Mail Users</button>
                                                </a>
                                            </c:if>
                                        </div>
                                            <div class="col" style="align-content: center">
                                                <sec:authorize access="hasRole('ROLE_INSTRUCTOR')">
                                                    <c:if test="${currentUser == course.instructor.username}">
                                                        <form method="post" class="col" action="/deleteCourse?id=${course.id}">
                                                            <sec:csrfInput/>
                                                            <button id="deleteCourseButton" type="submit" class="btn btn-danger m-2">Delete Course</button>
                                                        </form>
                                                    </c:if>
                                                </sec:authorize>

                                            </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <table data-toggle="table" class="table table-striped table-bordered" id="layoutTable" hidden>
                <thead class="thread-dark">
                <tr>
                    <th data-sortable="true">No</th>
                    <th data-sortable="true">Name</th>
                    <th data-sortable="true">Price</th>
                    <th data-sortable="true">Free Spaces</th>
                    <th data-sortable="true">When</th>
                    <th data-sortable="true">Where</th>
                    <th data-sortable="true">Who</th>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <th>Actions</th>
                    </sec:authorize>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${courses}" var="course">
                    <tr>
                        <td>${course.id}</td>
                        <td>${course.courseName}</td>
                        <td>${course.price}</td>
                        <td>${course.numSpaces - course.participants.size()}</td>
                        <td>
                            <fmt:parseDate value="${course.date}" pattern="yyyy-MM-dd" var="parsedDate"
                                           type="date"/>
                            <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/>, ${course.timeStart.substring(0, 5)} - ${course.timeEnd.substring(0, 5)}
                        </td>
                        <td>${course.locations.name}</td>
                        <td>${course.instructor.firstName} ${course.instructor.lastName}</td>
                        <td>
                            <div class="col" style="align-content: center">
                                <sec:authorize access="hasRole('ROLE_INSTRUCTOR')">
                                    <c:if test="${currentUser == course.instructor.username}">
                                        <form method="post" class="col" action="/deleteCourse?id=${course.id}">
                                            <sec:csrfInput/>
                                            <button id="deleteCourseButton" type="submit" class="btn btn-danger m-2">Delete Course</button>
                                        </form>
                                    </c:if>
                                </sec:authorize>

                            </div>
                            <div class="col" style="align-content: center">
                                <c:if test="${currentUser == course.instructor.username}">
                                    <a href="/sendMailToEnrolledUsers?id=${course.id}">
                                        <sec:csrfInput/>
                                        <button id="mailToButton" class="btn btn-lightGreen m-2">Mail Users</button>
                                    </a>
                                </c:if>
                            </div>
                            <div class="col" style="align-content: center">
                                <c:if test="${currentUser == course.instructor.username}">
                                    <a href="/createCourse?id=${course.id}">
                                        <sec:csrfInput/>
                                        <button id="bookCourseButton" class="btn btn-secondary m-2">Modify Course</button>
                                    </a>
                                </c:if>
                            </div>
                        </td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <h1>Statistics</h1>
    <body>
    <div class="row" style="padding: 10px">
        <div class="col" style="padding: 10px">
            <div id="topCategories" style="width: 100%; height: 300px; border: 2px solid #1D1E2C;"></div>
        </div>
        <div class="col" style="padding: 10px">
            <div id="averageAge" style="width: 100%; height: 300px; border: 2px solid #1D1E2C;"></div>
        </div>
    </div>
    <div class="row">
        <div class="col" style="padding-left: 2%;padding-right: 2%">
            <div id="topTimes" style="max-width: 100%; height: 300px; border: 2px solid #1D1E2C;"></div>
        </div>

    </div>


    </body>

</layout:page-container>

<script src="/js/switchLayout.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script src="/js/switchLayout.js"></script>
<script src="js/statistics.js">const courseList = "${courses}"</script>
<script>
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);

    var categoryList = [];
    <c:forEach items="${courses}" var="course">
    if (categoryList["${course.category.categoryName}"] == null) {
        categoryList["${course.category.categoryName}"] = 1;
    } else {
        categoryList["${course.category.categoryName}"]++;
    }
    </c:forEach>

    <c:forEach items="${courses}" var="course">
    if (categoryList["${course.category.categoryName}"] == null) {
        categoryList["${course.category.categoryName}"] = 1;
    } else {
        categoryList["${course.category.categoryName}"]++;
    }
    </c:forEach>
    function drawChart() {

        var data = new google.visualization.DataTable();

        data.addColumn('string', 'Category');
        data.addColumn('number', 'Quantity');
        for (var cat in categoryList) {
            data.addRow([cat, categoryList[cat]])
        }
        var options = {
            title: 'Top Categories',
            is3D: false,
        };

        var chart = new google.visualization.PieChart(document.getElementById('topCategories'));
        chart.draw(data, options);
    }
</script>

<script>
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawBoxPlot);

    var weekdayTimesStart = [
        ['MondayStart'],
        ['MondayEnd'],
        ['TuesdayStart'],
        ['TuesdayEnd'],
        ['WednesdayStart'],
        ['WednesdayEnd'],
        ['ThursdayStart'],
        ['ThursdayEnd'],
        ['FridayStart'],
        ['FridayEnd'],
        ['SaturdayStart'],
        ['SaturdayEnd'],
        ['SundayStart'],
        ['SundayEnd'],
        /*
        ['MondayStartUser'],
        ['MondayEndUser'],
        ['TuesdayStartUser'],
        ['TuesdayEndUser'],
        ['WednesdayStartUser'],
        ['WednesdayEndUser'],
        ['ThursdayStartUser'],
        ['ThursdayEndUser'],
        ['FridayStartUser'],
        ['FridayEndUser'],
        ['SaturdayStartUser'],
        ['SaturdayEndUser'],
        ['SundayStartUser'],
        ['SundayEndUser'],

         */
    ]


    <c:forEach items="${courses}" var="course">

    if ("${course.date.dayOfWeek}" == "MONDAY") {
        weekdayTimesStart[0].push(parseInt("${course.timeStart.substring(0,2)*60 + course.timeStart.substring(3,5)}"))
        weekdayTimesStart[1].push(parseInt("${course.timeEnd.substring(0,2)*60 + course.timeEnd.substring(3,5)}"))
    } else if ("${course.date.dayOfWeek}" == "TUESDAY") {
        weekdayTimesStart[2].push(parseInt(${course.timeStart.substring(0,2)*60 + course.timeStart.substring(3,5)}))
        weekdayTimesStart[3].push(parseInt("${course.timeEnd.substring(0,2)*60 + course.timeEnd.substring(3,5)}"))
    } else if ("${course.date.dayOfWeek}" == "WEDNESDAY") {
        weekdayTimesStart[4].push(parseInt("${course.timeStart.substring(0,2)*60 + course.timeStart.substring(3,5)}"))
        weekdayTimesStart[5].push(parseInt("${course.timeEnd.substring(0,2)*60 + course.timeEnd.substring(3,5)}"))
    } else if ("${course.date.dayOfWeek}" == "THURSDAY") {
        weekdayTimesStart[6].push(parseInt("${course.timeStart.substring(0,2)*60 + course.timeStart.substring(3,5)}"))
        weekdayTimesStart[7].push(parseInt("${course.timeEnd.substring(0,2)*60 + course.timeEnd.substring(3,5)}"))
    } else if ("${course.date.dayOfWeek}" == "FRIDAY") {
        weekdayTimesStart[8].push(parseInt("${course.timeStart.substring(0,2)*60 + course.timeStart.substring(3,5)}"))
        weekdayTimesStart[9].push(parseInt("${course.timeEnd.substring(0,2)*60 + course.timeEnd.substring(3,5)}"))
    } else if ("${course.date.dayOfWeek}" == "SATURDAY") {
        weekdayTimesStart[10].push(parseInt(${course.timeStart.substring(0,2)*60 + course.timeStart.substring(3,5)}))
        weekdayTimesStart[11].push(parseInt("${course.timeEnd.substring(0,2)*60 + course.timeEnd.substring(3,5)}"))
    } else {
        weekdayTimesStart[12].push(parseInt("${course.timeStart.substring(0,2)*60 + course.timeStart.substring(3,5)}"))
        weekdayTimesStart[13].push(parseInt("${course.timeEnd.substring(0,2)*60 + course.timeEnd.substring(3,5)}"))
    }
    </c:forEach>
    /*
<c:forEach items="${allCourses}" var ="course">
    console.log("ja")
    if ("${course.date.dayOfWeek}" == "MONDAY") {
        for (i=0; i<${course.participants.size()}; i++) {
            weekdayTimesStart[14].push(parseInt("${course.timeStart.substring(0,2)*60 + course.timeStart.substring(3,5)}"))
            weekdayTimesStart[15].push(parseInt("${course.timeEnd.substring(0,2)*60 + course.timeEnd.substring(3,5)}"))
        }

    } else if ("${course.date.dayOfWeek}" == "TUESDAY") {
        for (i=0; i<${course.participants.size()}; i++) {
            weekdayTimesStart[16].push(parseInt(${course.timeStart.substring(0,2)*60 + course.timeStart.substring(3,5)}))
            weekdayTimesStart[17].push(parseInt("${course.timeEnd.substring(0,2)*60 + course.timeEnd.substring(3,5)}"))
        }

    } else if ("${course.date.dayOfWeek}" == "WEDNESDAY") {
        for (i=0; i<${course.participants.size()}; i++) {
            weekdayTimesStart[18].push(parseInt("${course.timeStart.substring(0,2)*60 + course.timeStart.substring(3,5)}"))
            weekdayTimesStart[19].push(parseInt("${course.timeEnd.substring(0,2)*60 + course.timeEnd.substring(3,5)}"))
        }

    } else if ("${course.date.dayOfWeek}" == "THURSDAY") {
        for (i=0; i<${course.participants.size()}; i++) {
            weekdayTimesStart[20].push(parseInt("${course.timeStart.substring(0,2)*60 + course.timeStart.substring(3,5)}"))
            weekdayTimesStart[21].push(parseInt("${course.timeEnd.substring(0,2)*60 + course.timeEnd.substring(3,5)}"))
        }
    } else if ("${course.date.dayOfWeek}" == "FRIDAY") {
        for (i=0; i<${course.participants.size()}; i++) {
            weekdayTimesStart[22].push(parseInt("${course.timeStart.substring(0,2)*60 + course.timeStart.substring(3,5)}"))
            weekdayTimesStart[23].push(parseInt("${course.timeEnd.substring(0,2)*60 + course.timeEnd.substring(3,5)}"))
        }

    } else if ("${course.date.dayOfWeek}" == "SATURDAY") {
        for (i=0; i<${course.participants.size()}; i++) {
            weekdayTimesStart[24].push(parseInt(${course.timeStart.substring(0,2)*60 + course.timeStart.substring(3,5)}))
            weekdayTimesStart[25].push(parseInt("${course.timeEnd.substring(0,2)*60 + course.timeEnd.substring(3,5)}"))
        }

    } else {
        for (i=0; i<${course.participants.size()}; i++) {
            weekdayTimesStart[26].push(parseInt("${course.timeStart.substring(0,2)*60 + course.timeStart.substring(3,5)}"))
            weekdayTimesStart[27].push(parseInt("${course.timeEnd.substring(0,2)*60 + course.timeEnd.substring(3,5)}"))
        }

    }
    </c:forEach>
    */

    //console.log(weekdayTimesStart)
    //console.log("${allCourses}")
    function drawBoxPlot() {
        var array = weekdayTimesStart

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'x');
        data.addColumn('number', 'series0');
        data.addColumn('number', 'series1');
        data.addColumn('number', 'series2');
        data.addColumn('number', 'series3');
        data.addColumn('number', 'series4');
        data.addColumn('number', 'series5');
        data.addColumn('number', 'series6');

        data.addColumn({id:'max', type:'number', role:'interval'});
        data.addColumn({id:'min', type:'number', role:'interval'});
        data.addColumn({id:'firstQuartile', type:'number', role:'interval'});
        data.addColumn({id:'median', type:'number', role:'interval'});
        data.addColumn({id:'thirdQuartile', type:'number', role:'interval'});

        data.addRows(getBoxPlotValues(array));

        function getBoxPlotValues(array) {
            for (var i = 0; i < array.length; i++) {
                var arr = array[i].slice(1).sort(function (a, b) {
                    return a - b;
                });

                var max = arr[arr.length - 1];
                var min = arr[0];
                var median = getMedian(arr);

// First Quartile is the median from lowest to overall median.
                var firstQuartile = getMedian(arr.slice(0, 4));

// Third Quartile is the median from the overall median to the highest.
                var thirdQuartile = getMedian(arr.slice(3));

                array[i][8] = max;
                array[i][9] = min
                array[i][10] = firstQuartile;
                array[i][11] = median;
                array[i][12] = thirdQuartile;
            }
            return array;
        }

        /*
* Takes an array and returns
* the median value.
*/
        function getMedian(array) {
            var length = array.length;

            /* If the array is an even length the
            * median is the average of the two
            * middle-most values. Otherwise the
            * median is the middle-most value.
            */

            if (length % 2 === 0) {
                var midUpper = length / 2;
                var midLower = midUpper - 1;
                return (array[midUpper] + array[midLower]) / 2;
            }
            else {
                return array[Math.floor(length / 2)];
            }
        }

        var options = {
            title:'Average Start and End Times',
            legend: {position: 'none'},
            hAxis: {
                gridlines: {color: '#fff'}
            },
            vAxis: {
                ticks: [
                    {v: 0, f:'00:00'},
                    {v: 120, f:'02:00'},
                    {v: 240, f:'04:00'},
                    {v: 360, f:'06:00'},
                    {v: 480, f:'08:00'},
                    {v: 600, f:'10:00'},
                    {v: 720, f:'12:00'},
                    {v: 840, f:'14:00'},
                    {v: 960, f:'16:00'},
                    {v: 1080, f:'18:00'},
                    {v: 1200, f:'20:00'},
                    {v: 1320, f:'22:00'},
                    {v: 1440, f:'24:00'}
                ]
            },
            lineWidth: 0,
            series: [{'color': '#50FFB1'}],
            intervals: {
                barWidth: 1,
                boxWidth: 1,
                lineWidth: 2,
                style: 'boxes'
            },
            interval: {
                max: {
                    style: 'bars',
                    fillOpacity: 1,
                    color: '#777'
                },
                min: {
                    style: 'bars',
                    fillOpacity: 1,
                    color: '#777'
                }
            }
        };
        var chart = new google.visualization.LineChart(document.getElementById('topTimes'));
        chart.draw(data, options);

    }
</script>

<script>
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawHistogramm);

    var ages = [];
    <c:forEach items="${courses}" var="course">
    <c:forEach items="${course.participants}" var="user">
    <c:if test="${user.dayOfBirth != null}">

    ages.push(2022 - ${user.dayOfBirth.year})
    </c:if>



    </c:forEach>
    </c:forEach>


    function drawHistogramm() {

        var data = new google.visualization.DataTable();

        data.addColumn('string', 'Age');
        data.addColumn('number', 'Ages');

        for (i=0;i<ages.length;i++) {
            data.addRow(["User", ages[i]])
        }


        var options = {
            title: 'Top Categories',
            is3D: false,
        };

        var chart = new google.visualization.Histogram(document.getElementById('averageAge'));
        chart.draw(data, options);
    }
</script>
