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
        <%
    AdminDTO admin = (AdminDTO) session.getAttribute("Admin_Login");%>
        <div class="container">

            <div class='modal-dialog modal-dialog-centered'>
                
                <div class="modal-content  ">
                    <div class="m-2">
                        <button  class="btn btn-primary  "><a style="color: white; cursor:pointer" href="AdminController"><i class='bx bx-left-arrow-alt'></i>Back</a></button>
                    </div>
                         

                    <div class="modal-header d-flex flex-row-reverse justify-content-between">
                        <div>
                           
                        </div>
                        <h5 class="modal-title" id="modalToggleLabel">Edit User</h5>


                    </div>
                     <form action="AdminChangePassword" method="post"> 
                    <div class="modal-body">
                        <div class="row">
                            <div class="row">

                                <input type="hidden" value="${adminInfo.username}" name="userP">
                                <div class="col mb-3">

                                    <label for="OldPassword" class="form-label">Old Password</label>
                                    <input name='OldPassword'  type="text" class="form-control" >
                                </div>

                                <div class="col mb-3">

                                    <label for="OldPassword" class="form-label">New Password</label>
                                    <input name='NewPassword'  type="text" class="form-control" >
                                </div>
                                <div class="col mb-3">

                                    <label for="ConfirmPassword" class="form-label">Confirm Password</label>
                                    <input name='ConfirmPassword'  type="text" class="form-control" >
                                </div>

                            </div>
                        </div>
                        <input type="hidden" name="action" value="confirmupdate">                   

                        <div class="modal-footer">


                            <button type="submit" class="btn btn-primary">Save changes</button>
                            
                            <%
                                String message = (String) request.getAttribute("MESSAGE");
                                String message1 = (String) request.getAttribute("MESSAGE1");
                                if (message == null ) {
                                    message = "";
                                }
                                if (message1 == null ) {
                                    message1 = "";
                                }
                            %> 
                        </div>
                        <div style="color:red;font-style:italic;">
                            <%= message%>
                        </div>
                        <div style="color:green;font-style:italic;">
                            <%= message1%>
                        </div>
                    </div>
                </div>

</form>  
            </div>

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