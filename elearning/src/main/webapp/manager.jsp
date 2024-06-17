<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<t:main>






    <!-- Header Start -->
    <div class="container-fluid bg-primary py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">Welcome manager</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                            <li class="breadcrumb-item"><a class="text-white" href="#"></a></li>
                            <li class="breadcrumb-item"><a class="text-white" href="#"></a></li>

                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->


    <!-- Course Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Instructors</h6>
                <h1 class="mb-5">Your Courses</h1>
                <h3 class="mb-5">Add Courses</h3>
            </div>
            <div class="row g-4">
                <c:forEach var="course" items="${clist}">
                    <div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="d-flex align-items-center">
                            <div class="flex-shrink-0">
                                <img class="img-fluid" src="${course.imgpath}" alt=""
                                     style="width: 300px; height: auto;">
                            </div>
                            <div class="p-2 flex-grow-1">
                                <h5 class="mb-0">Course Name</h5>
                                <p>${course.title}</p>
                                <p>${course.active==true?"puplished":"unpuplished"} </p>
                                <c:choose>
                                    <c:when test="${course.active==true}">
                                        <a href="url">Unpuplished</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="url">Delete</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <!-- Course End -->

    <!-- Team Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Instructors</h6>
                <h1 class="mb-5">Your Teachers</h1>
                <h3 class="mb-5">Add Teachers</h3>
            </div>
            <div class="row g-4">
                <c:forEach var="course" items="${tlist}">
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="team-item bg-light">
                            <div class="overflow-hidden">
                                <img class="img-fluid" src="${teacher.imgpath}" alt="">
                            </div>
                            <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                                <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                    <a class="btn btn-sm-square btn-primary mx-1" href=""><i
                                            class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-sm-square btn-primary mx-1" href=""><i
                                            class="fab fa-twitter"></i></coursea>
                                        <a class="btn btn-sm-square btn-primary mx-1" href=""><i
                                                class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                            <div class="text-center p-4">
                                <h5 class="mb-0">Instructor Name</h5>
                                <small>Designation</small>
                            </div>
                            <p>${course.title}</p>
                            <a href="url">Name</a>

                        </div>
                    </div>

                </div>
            </c:forEach>
        </div>
    </div>
    <!-- Team End -->



</t:main>