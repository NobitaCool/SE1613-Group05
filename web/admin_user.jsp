<%-- 
    Document   : admin_user
    Created on : Oct 9, 2022, 11:24:29 PM
    Author     : DELL
--%>

<%@page import="com.ebutler.swp.dao.CustomerDAO"%>
<%@page import="com.ebutler.swp.dto.CustomerDTO"%>
<%@page import="com.ebutler.swp.dao.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ebutler.swp.dto.UserDTO"%>
<%@page import="com.ebutler.swp.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>


<html
    lang="en"
    class="light-style layout-menu-fixed"
    dir="ltr"
    data-theme="theme-default"
    data-assets-path="./"
    data-template="vertical-menu-template-free"
    >
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
            />

        <title>Admin User</title>

        <meta name="description" content="" />

        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="./assets/img/favicon/favicon.ico" />

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
            />

        <!-- Icons. Uncomment required icon fonts -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <!-- Core CSS -->
        <link rel="stylesheet" href="./css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="./css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="./demo.css" />

        <!-- Vendors CSS -->
        <link rel="stylesheet" href="./assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

        <link rel="stylesheet" href="./assets/vendor/libs/apex-charts/apex-charts.css" />

        <!-- Page CSS -->

        <!-- Helpers -->
        <script src="./assets/vendor/js/helpers.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="./assets/js/config.js"></script>
    </head>

    <body style="background-color: #273A89">
        <!-- Layout wrapper -->

        <!-- / Menu -->

        <!-- Layout container -->
        <div class="container-xxl " >
            <div class="container-fluid nav-bar bg-white px-0 border-bottom-1">
                <nav class="navbar navbar-expand-lg  navbar-light py-0 px-5 border-bottom d-flex justify-content-between">
                    <div>
                        <a class="navbar-brand d-flex align-items-center text-center">
                            <div class="icon p-2 me-2">
                                <img class="img-fluid"
                                     src="./img/about_us.png"
                                     alt="Icon" style="width: 30px; height: 30px;">
                            </div>
                            <h1 class="m-0 " style="color:#273A89;">E-Butler</h1>
                        </a>
                        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>




                    <!-- On hover dropdown button -->

                    <!-- <a href="" class="btn btn-primary px-3 d-none d-lg-flex">Add Property</a> -->
                    <div class="btn-group me-3 " ">

                        <div style="cursor: pointer; " class="btn btn-secondary">

                            <a style="color:white" href="MainController?action=Logout">Logout</a>
                        </div>
                    </div>
                </nav>
                 <div class="navbar-nav-right d-flex flex-row-reverse align-items-center my-4" id="navbar-collapse">


                    </ul>

                </div>
   
    <div class="nav mx-5">
        <h2>User List</h2>

    </div>
<form class="d-flex mx-3" action="SearchUserController">
                        <input class="form-control me-sm-2 mx-2" type="search" placeholder="Search..." aria-label="Search" name="userS"/>
                        <button class="btn btn-outline-primary" type="submit"><i class="bx bx-search"></i></button>
                    </form>
    <div class="mx-5 mt-3">
        <nav aria-label="breadcrumb m-5">
            <ol class="breadcrumb breadcrumb-style">

                <li class="breadcrumb-item">
                    <a href="AdminCustomerController">User</a>
                </li>
                <li class="breadcrumb-item active">List</li>
            </ol>
        </nav>
    </div>
    <!-- / Navbar -->

    <!-- Content wrapper -->
    <div class="content-wrapper">
        <!-- Content -->





        <!-- Modal -->
        <div class="modal js-modal " tabindex="-1" >
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Alert</h5>
                        <button type="button" class="btn-close js-modal-close" data-bs-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure to delete this user?</p>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger js-modal-close-2" >Cancel</button>
                        <button type="submit" class="btn btn-primary">Confirm</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal js-modal-confirm" id="modalToggle" aria-labelledby="modalToggleLabel" tabindex="-1" style="display: none;" aria-hidden="true">
            <div class="modal-dialog  modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalToggleLabel">Edit User</h5>
                        <button type="button" class="btn-close js-modal-close-1" ></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="row">
                                <div class="col mb-3">
                                    <label for="username" class="form-label">Username</label>
                                    <input type="text" id="username" class="form-control" placeholder="Enter Username">
                                </div>
                                <div class="col mb-3">
                                    <label class="form-label">Status</label>
                                    <select class="form-select " aria-label="Default select example">
                                        <option selected>Choose status</option>
                                        <option value="1">Active</option>
                                        <option value="2">Inactive</option>              
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">

                        <button type="button" class="btn btn-danger js-modal-close-3" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="table-responsive px-5 py-5">
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th>Role ID</th>
                        <th>Username</th>
                        <th>Phone</th>
                        <th>Email</th>

                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        UserDAO userdao = new UserDAO();
                        List<UserDTO> listUser = new ArrayList();
                        listUser = (List<UserDTO>) session.getAttribute("Admin_List");
                        int c = 0;
                        if (listUser == null || listUser.isEmpty()) { %>
                <h1 class="btn btn-danger ">There are no user in list</h1> <%
                    }

                    for (UserDTO userDTO : listUser) {
                %>
                <tr>
                    <td><%= userDTO.getRole_id()%></td>
                    <td><%= userDTO.getUsername()%></td>
                    <td><%= userDTO.getPhone()%></td>
                    <td><%= userDTO.getEmail()%></td>


                    <td><%if (userDTO.getStatus() == 1) {
                        %>
                        <span class="badge bg-label-success me-1">Active</span>
                        <%} else { %><span class="badge bg-label-danger me-1">Inactive</span> <%
                                }%>
                    </td>

                    <td style="padding-left:0 ;">
                        <div>
                            <form action="DeleleUserController" method="post">

                                <input type="hidden" name="status" value="<%=userDTO.getStatus()%>">
                                <input type="hidden" name="username" value="<%=userDTO.getUsername()%>">
                                <button type="text" style="color:white" class="btn js-edit"><i class="bx bx-edit-alt"></i>Change Status</button>
                            </form>


                        </div>
                    </td>
                </tr>



                </tbody>
                <%}%>

            </table>

        </div>

        <!-- / Content -->



        <div class="content-backdrop fade"></div>
    </div>
    <!-- Content wrapper -->
</div>
                 </div>
<!-- / Layout page -->
</div>
</div>
<!-- Overlay -->
<div class="layout-overlay layout-menu-toggle"></div>
</div>


<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="./vendor/libs/jquery/jquery.js"></script>
<script src="./vendor/libs/popper/popper.js"></script>
<script src="./vendor/js/bootstrap.js"></script>
<script src="./vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="./vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->
<script src="./vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src="./js/main.js"></script>

<!-- Page JS -->
<script src="./js/dashboards-analytics.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

<script>

</script>
</body>
</html>
