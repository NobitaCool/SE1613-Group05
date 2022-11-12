 <%@page import="com.ebutler.swp.dto.AdminDTO"%>
<%@page import="com.ebutler.swp.dao.AdminDAO"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html
    lang="en"
    class="light-style layout-menu-fixed"
    dir="ltr"
    data-theme="theme-default"
    data-assets-path="./assets/"
    data-template="vertical-menu-template-free"
    >
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
            />

        <title>Admin</title>

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
        <link rel="stylesheet" href="./css/demo.css" />

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
    <body>

        <div class="container">
            <form action="AdminEditController" method="post">
                <div class='modal-dialog modal-dialog-centered'>
                    <div class="modal-content d-flex">
                        <div class="m-2">
                            <button  class="btn  "><a cursor:pointer" href="AdminController"><i class='bx bx-left-arrow-alt'></i>Back</a></button>
                        </div>

                        <div class="modal-header d-flex flex-row-reverse justify-content-between">
                            <div>

                            </div>

                            <h4 class="modal-title " id="modalToggleLabel">Edit User</h4>


                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="row">
                                    <div class="col-12 mb-3">
                                        
                                        <label for="username" class="form-label">Username</label>
                                        <input name='username' value="${adminInfo.username}" type="text" class="form-control" readonly>
                                    </div>


                                    <%
                                        AdminDAO admindao = new AdminDAO();
                                        List<String> listRole1 = admindao.getRoleName();
                                        int count = 0;
                                        //                                        AdminDTO adminInfo = (AdminDTO)request.getAttribute("adminInfo");

                                    %>

                                    <div class="row">
                                        <div class="col">
                                            <div class="col-6">


                                                <label class="form-label mb-3">Role</label>
                                                <div class="form-check"> 
                                                    <input class="mx-3 form-check-input" type='radio' name='rName' id='Revenue' value='Revenue'>Revenue

                                                </div> 
                                                <div class="form-check"> 

                                                    <input class="mx-3 form-check-input" type='radio' name='rName' id='User' value='User'>User 
                                                </div> 
                                            </div>
                                            
                                        </div> 
                                    </div>




                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="action" value="confirmupdate">                   

                        <div class="modal-footer">


                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>

            </form>
        </div>




        <!-- Core JS -->
        <!-- build:js assets/vendor/js/core.js -->
        <script src="./assets/vendor/libs/jquery/jquery.js"></script>
        <script src="./assets/vendor/libs/popper/popper.js"></script>
        <script src="./assets/vendor/js/bootstrap.js"></script>
        <script src="./assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

        <script src="./assets/vendor/js/menu.js"></script>
        <!-- endbuild -->

        <!-- Vendors JS -->
        <script src="./assets/vendor/libs/apex-charts/apexcharts.js"></script>

        <!-- Main JS -->
        <script src="./assets/js/main.js"></script>

        <!-- Page JS -->
        <script src="./assets/js/dashboards-analytics.js"></script>

        <!-- Place this tag in your head or just before your close body tag. -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>

        <script>

        </script>
    </body>
</html>