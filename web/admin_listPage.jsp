<%@page import="java.util.ArrayList"%>
<%@page import="com.ebutler.swp.dto.AdminDTO"%>
<%@page import="com.ebutler.swp.dao.AdminDAO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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



        <!-- Page CSS -->

        <!-- Helpers -->
        <script src="./assets/vendor/js/helpers.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="./assets/js/config.js"></script>
    </head>

    <body>
        <%
            AdminDTO admin = (AdminDTO) session.getAttribute("Admin_Login");

        %>
        <!-- Layout wrapper -->

        <div class="navbar-nav-right d-flex flex-row-reverse align-items-center my-4" id="navbar-collapse">
            <nav class="navbar navbar-light">
                <div class="container-fluid">
                    <div style="cursor: pointer; color:white;" class="btn btn-outline-danger">

                        <a href="MainController?action=Logout">Logout</a>
                    </div>




                    <form   action="SearchAdminController" method="post">
                        <div class="d-flex ">
                            <input class="form-control me-sm-2 mx-2" type="text" placeholder="Search..." aria-label="Search" name="search" />
                            <button class="btn btn-outline-primary" type="submit"><i class="bx bx-search"></i></button>
                        </div>
                    </form>

                </div>
            </nav>     
        </ul>

    </div>

    <nav class="nav mx-5">
        <h2>Admin List</h2>

        <button data-bs-toggle="modal" data-bs-target="#basicModal" class="btn btn-primary mx-3 mb-5 js-create-admin">+ Create New Admin</button>  
        <div style="color:red;font-style:italic;">
            ${Message}
        </div>
    </nav>

    <div class="mx-5 mt-3">
        <nav aria-label="breadcrumb m-5">
            <ol class="breadcrumb breadcrumb-style">

                <li class="breadcrumb-item">
                    <a href="AdminController">Admin</a>
                </li>
                <li class="breadcrumb-item active">List</li>
            </ol>
        </nav>
    </div>
</nav>


<!-- / Navbar -->

<!-- Content wrapper -->
<div class="content-wrapper">
    <!-- Content -->
    <%        AdminDAO admindao = new AdminDAO();

        List<String> listRole1 = admindao.getRoleName();

        int c = 0;
    %>
    <div class="modal fade" id="basicModal">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <form action="AddAdminController" method="post">

                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel1">Create New Admin</h5>
                        <button type="button" class="btn-close js-modal-close-4" ></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">

                            <div class="col mb-3">
                                <label  for="username" class="form-label">Username</label>
                                <input name="username" type="text" id="username" class="form-control" ">
                            </div>
                            <div class="col mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input name="password" type="password" id="password"  class="form-control" placeholder="" >
                            </div>
                        </div>
                        <div class="row ">
                            <div class="col">
                                <label class="form-label">Role</label>
                                <select name="role_ID" class="form-select " aria-label="Default select example">
                                    <option value="" selected="">Choose Role</option>
                                    <%                                                                                for (String role : listRole1) {
                                    %>
                                    <option ><%= listRole1.get(c++)%></option>        
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-label-secondary js-modal-close-5" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
        </div>
    </div>
</form>



<!-- Modal Delete -->
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
                <button type="button" class="btn btn-danger js-modal-close-2 " >Cancel</button>
                <button type="submit" class="btn btn-primary">Confirm</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal 1-->
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
                            <%
                                List<AdminDTO> listAdmin1 = admindao.getAllAdmin();
                                for (AdminDTO adminDTO : listAdmin1) {%>
                            <label for="username" class="form-label">Username</label>
                            <input type="text" value="<%= adminDTO.getUsername()%>" id="username" class="form-control" placeholder="Enter Username" readonly="">
                            <%}%>
                        </div>
                        <div class="col mb-3">
                            <label class="form-label">Role</label>
                            <select class="form-select " aria-label="Default select example">
                                <option selected>Select Role</option>
                                <option value="1">Role1</option>
                                <option value="2">Role2</option>              
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" id="changepassbtn" data-bs-target="#modalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal">Change Password</button>
                <button type="button" class="btn btn-danger js-modal-close-3" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal 2-->
<div class="modal fade " id="modalToggle2" aria-hidden="true" aria-labelledby="modalToggleLabel2" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalToggleLabel2">Change Password</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="row">
                        <div class="col mb-3">
                            <label for="o-pass" class="form-label">Old Password</label>
                            <input type="password" id="o-pass" class="form-control">
                        </div>
                        <div class="col mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" id="password" class="form-control" >
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Save changes</button>

            </div>
        </div>
    </div>
</div>


<div class="table-responsive px-5 py-5">

    <table class="table table-dark">
        <thead>
            <tr>

                <th>Username</th>
                <th>Password</th>
                <th>Role</th>
                <th>Status</th>

                <th>Actions</th>
            </tr>

        </thead>
        <tbody>

            <%

                List<String> listRole2 = admindao.getAllRoleName();
                int c1 = 0;
                List<AdminDTO> listAdmin = new ArrayList();
                listAdmin = (List<AdminDTO>) session.getAttribute("Admin_List");

                if (listAdmin.size() == 0) { %>
        <h1 class="btn btn-danger">No results</h1> <%
            }
            for (AdminDTO admindto : listAdmin) {


        %>

        <tr>
            <td><%= admindto.getUsername()%></td>
            <td><%= admindto.getPassword()%></td>

            <td>
                <%= listRole2.get(c1++)%>
            </td>
         <td><%if(admindto.getStatus()==1){ %>
             <span class="badge bg-label-success">Active</span> <%
                   
                }else {%>
          <span class="badge bg-label-danger">Inactive</span> <% }%>
         </td>
        <td style="padding-left:0 ;">
            <div class="d-flex"
                 >
                <form action="AdminController" method="post">
                    <input type="hidden" name="action" value="showupdate">                       
                    <input type="hidden" name="username" value="<%= admindto.getUsername()%>">

                    <button class="btn btn-dark"  style="color:white" type="submit"><i class="bx bx-edit mx-1 "></i> Edit </button>
                </form>
                <form action="AdminController" method="post">
                    <input type="hidden" name="action" value="showchangepass">
                    <input type="hidden" name="username" value="<%= admindto.getUsername()%>">
                    <button type="submit" style="color:white" class="btn "><i class="bx bx-pen mx-1 "></i>Change Password</button>
                </form>
                <form  action="DeleteAdController" method="post">
                    
                    <input type="hidden" name="puser" value="<%= admindto.getUsername()%>"> 
                    <input type="hidden" name="status" value="<%= admindto.getStatus()%>">
                    <button type="submit" style="color:white" class="btn js-delete"><i class="bx bx-trash mx-1 "></i>Delete</button>
                </form>





            </div>
            <!--                       
            -->                        

        </td>
        </tr>

        <%}%>

        </tbody>

    </table>


</div>
</div>

<!-- / Content -->



<div class="content-backdrop fade"></div>
</div>
<!-- Content wrapper -->
</div>
<!-- / Layout page -->
</div>

<!-- Overlay -->
<div class="layout-overlay layout-menu-toggle"></div>
</div>


<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="./assets/vendor/libs/jquery/jquery.js"></script>
<script src="./assets/vendor/libs/popper/popper.js"></script>
<script src="./assets/vendor/js/bootstrap.js"></script>
<script src="./assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="./assets/vendor/js/menu.js"></script>
<!-- endbuild -->



<!-- Main JS -->
<script src="./js/main1.js"></script>



<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

<script>

</script>
</body>
</html>