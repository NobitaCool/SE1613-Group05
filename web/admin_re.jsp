<%@page import="com.ebutler.swp.dao.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.ebutler.swp.dto.UserDTO"%>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
-->
<!-- beautify ignore:start -->
<html
    lang="en"
    class="light-style layout-menu-fixed"
    dir="ltr"
    data-theme="theme-default"
    data-assets-path="../assets/"
    data-template="vertical-menu-template-free"
    >
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
            />

        <title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

        <meta name="description" content="" />
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

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
        <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

        <link rel="stylesheet" href="../assets/vendor/libs/apex-charts/apex-charts.css" />

        <!-- Page CSS -->

        <!-- Helpers -->
        <script src="../assets/vendor/js/helpers.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="../assets/js/config.js"></script>
    </head>

    <body>
        <!-- Layout wrapper -->

        <!-- Menu -->




        <!-- / Menu -->

        <!-- Layout container -->

        <!-- Navbar -->



        <!-- / Navbar -->

        <!-- Content wrapper -->
        <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
                <div class="row">
                    <%
                        UserDAO userdao = new UserDAO();
                        List<UserDTO> listUser = new ArrayList();
                        List<UserDTO> listUser1 = new ArrayList();
                        List<UserDTO> listUser2 = new ArrayList();
                        List<UserDTO> listUser3 = new ArrayList();
                        listUser = (List<UserDTO>) session.getAttribute("Admin_List");
                        listUser1 = userdao.getUserByProRole();
                        listUser2 = userdao.getUserByCusRole();
                        listUser3 = userdao.getUserByShipRole();

                    %>

                    <!-- Total Revenue -->
                    <div class="col-4 mb-4">
                        <div class="card h-100">
                            <div class="card-header d-flex align-items-center justify-content-between pb-0">
                                <div class="card-title mb-0">
                                    <h5 class="m-0 me-2">User Statistics</h5>

                                </div>
                                <div class="dropdown">
                                    <button
                                        class="btn p-0"
                                        type="button"
                                        id="orederStatistics"
                                        data-bs-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        >
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="orederStatistics">
                                        <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Share</a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <div class="d-flex flex-column align-items-center gap-1">

                                        <span>Total Users</span>

                                        <h2 class="mb-2"><%=listUser.size()%></h2>
                                        <canvas id="myChart" style="width:100%;max-width:600px"></canvas>
                                    </div>
                                    <div id="orderStatisticsChart"></div>
                                </div>
                                <ul class="p-0 m-0">
                                    <li class="d-flex mb-4 pb-1">
                                        <div class="avatar flex-shrink-0 me-3">
                                            <span class="avatar-initial rounded bg-label-primary"
                                                  ><i class="bx bx-mobile-alt"></i
                                                ></span>
                                        </div>
                                        <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                            <div class="me-2">
                                                <h6 class="mb-0">Customer</h6>

                                            </div>
                                            <div class="user-progress">
                                                <small  id='customerchart' class="fw-semibold"><%=listUser2.size()%></small>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="d-flex mb-4 pb-1">
                                        <div class="avatar flex-shrink-0 me-3">
                                            <span class="avatar-initial rounded bg-label-success"><i class="bx bx-closet"></i></span>
                                        </div>
                                        <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                            <div class="me-2">
                                                <h6 class="mb-0">Provider</h6>

                                            </div>
                                            <div class="user-progress">
                                                <small id='providerchart' class="fw-semibold"><%=listUser1.size()%></small>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="d-flex mb-4 pb-1">
                                        <div class="avatar flex-shrink-0 me-3">
                                            <span class="avatar-initial rounded bg-label-info"><i class="bx bx-home-alt"></i></span>
                                        </div>
                                        <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                            <div class="me-2">
                                                <h6 class="mb-0">Shipper</h6>

                                            </div>
                                            <div class="user-progress">
                                                <small id='shipperchart' class="fw-semibold"><%=listUser3.size()%></small>
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-4 mb-4">
                        <div class="card h-100">
                            <div class="card-header d-flex align-items-center justify-content-between pb-0">
                                <div class="card-title mb-0">
                                    <h5 class="m-0 me-2">User Statistics</h5>

                                </div>
                                <div class="dropdown">
                                    <button
                                        class="btn p-0"
                                        type="button"
                                        id="orederStatistics"
                                        data-bs-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        >
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="orederStatistics">
                                        <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Share</a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <div class="d-flex flex-column align-items-center gap-1">

                                        <span>Total Users</span>

                                        <h2 class="mb-2"><%=listUser.size()%></h2>
                                        <canvas id="myChart2" style="width:100%;max-width:600px"></canvas>
                                    </div>
                                    <div id="orderStatisticsChart"></div>
                                </div>
                                <ul class="p-0 m-0">
                                    <li class="d-flex mb-4 pb-1">
                                        <div class="avatar flex-shrink-0 me-3">
                                            <span class="avatar-initial rounded bg-label-primary"
                                                  ><i class="bx bx-mobile-alt"></i
                                                ></span>
                                        </div>
                                        <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                            <div class="me-2">
                                                <h6 class="mb-0">Customer</h6>

                                            </div>
                                            <div class="user-progress">
                                                <small  id='customerchart' class="fw-semibold"><%=listUser2.size()%></small>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="d-flex mb-4 pb-1">
                                        <div class="avatar flex-shrink-0 me-3">
                                            <span class="avatar-initial rounded bg-label-success"><i class="bx bx-closet"></i></span>
                                        </div>
                                        <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                            <div class="me-2">
                                                <h6 class="mb-0">Provider</h6>

                                            </div>
                                            <div class="user-progress">
                                                <small id='providerchart' class="fw-semibold"><%=listUser1.size()%></small>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="d-flex mb-4 pb-1">
                                        <div class="avatar flex-shrink-0 me-3">
                                            <span class="avatar-initial rounded bg-label-info"><i class="bx bx-home-alt"></i></span>
                                        </div>
                                        <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                            <div class="me-2">
                                                <h6 class="mb-0">Shipper</h6>

                                            </div>
                                            <div class="user-progress">
                                                <small id='shipperchart' class="fw-semibold"><%=listUser3.size()%></small>
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-4 mb-4">
                        <div class="card h-100">
                            <div class="card-header d-flex align-items-center justify-content-between pb-0">
                                <div class="card-title mb-0">
                                    <h5 class="m-0 me-2">User Statistics</h5>

                                </div>
                                <div class="dropdown">
                                    <button
                                        class="btn p-0"
                                        type="button"
                                        id="orederStatistics"
                                        data-bs-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        >
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="orederStatistics">
                                        <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Share</a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <div class="d-flex flex-column align-items-center gap-1">

                                        <span>Total Users</span>

                                        <h2 class="mb-2"><%=listUser.size()%></h2>
                                        <canvas id="myChart3" style="width:100%;max-width:600px"></canvas>
                                    </div>
                                    <div id="orderStatisticsChart"></div>
                                </div>
                                <ul class="p-0 m-0">
                                    <li class="d-flex mb-4 pb-1">
                                        <div class="avatar flex-shrink-0 me-3">
                                            <span class="avatar-initial rounded bg-label-primary"
                                                  ><i class="bx bx-mobile-alt"></i
                                                ></span>
                                        </div>
                                        <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                            <div class="me-2">
                                                <h6 class="mb-0">Customer</h6>

                                            </div>
                                            <div class="user-progress">
                                                <small  id='customerchart' class="fw-semibold"><%=listUser2.size()%></small>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="d-flex mb-4 pb-1">
                                        <div class="avatar flex-shrink-0 me-3">
                                            <span class="avatar-initial rounded bg-label-success"><i class="bx bx-closet"></i></span>
                                        </div>
                                        <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                            <div class="me-2">
                                                <h6 class="mb-0">Provider</h6>

                                            </div>
                                            <div class="user-progress">
                                                <small id='providerchart' class="fw-semibold"><%=listUser1.size()%></small>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="d-flex mb-4 pb-1">
                                        <div class="avatar flex-shrink-0 me-3">
                                            <span class="avatar-initial rounded bg-label-info"><i class="bx bx-home-alt"></i></span>
                                        </div>
                                        <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                            <div class="me-2">
                                                <h6 class="mb-0">Shipper</h6>

                                            </div>
                                            <div class="user-progress">
                                                <small id='shipperchart' class="fw-semibold"><%=listUser3.size()%></small>
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                    <!--/ Total Revenue -->

                </div>


                <div class="col mb-4">
                    <div class="card">
                        <div class="card-header header-elements">
                            <div class="ps-0 ps-sm-2 d-flex flex-column mb-2 mb-sm-0">
                                <p class="card-subtitle text-muted mb-1">Revenue</p>
                                
                            </div>
                            <div class="card-action-element ms-auto py-0">
                                <div class="dropdown">
                                    <button type="button" class="btn dropdown-toggle p-0" data-bs-toggle="dropdown" aria-expanded="false"><i class="bx bx-calendar"></i></button>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li><a href="javascript:void(0);" class="dropdown-item d-flex align-items-center">Today</a></li>
                                        <li><a href="javascript:void(0);" class="dropdown-item d-flex align-items-center">Yesterday</a></li>
                                        <li><a href="javascript:void(0);" class="dropdown-item d-flex align-items-center">Last 7 Days</a></li>
                                        <li><a href="javascript:void(0);" class="dropdown-item d-flex align-items-center">Last 30 Days</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a href="javascript:void(0);" class="dropdown-item d-flex align-items-center">Current Month</a></li>
                                        <li><a href="javascript:void(0);" class="dropdown-item d-flex align-items-center">Last Month</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <label>Content1</label>
                            <div class="w3-light-grey">
                                <div class="w3-container w3-green w3-center" style="width:25%">25%</div>
                            </div><br>
<label>Content1</label>
                            <div class="w3-light-grey">
                                <div class="w3-container w3-red w3-center" style="width:50%">50%</div>
                            </div><br>
<label>Content1</label>
                            <div class="w3-light-grey">
                                <div class="w3-container w3-blue" style="width:75%">75%</div>
                            </div><br>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- / Content -->

        <!-- Footer -->

        <!-- / Footer -->

        <div class="content-backdrop fade"></div>
    </div>
    <!-- Content wrapper -->
</div>
<!-- / Layout page -->
</div>

<!-- Overlay -->
<div class="layout-overlay layout-menu-toggle"></div>
</div>
<!-- / Layout wrapper -->



<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="../assets/vendor/libs/jquery/jquery.js"></script>
<script src="../assets/vendor/libs/popper/popper.js"></script>
<script src="../assets/vendor/js/bootstrap.js"></script>
<script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->
<script src="../assets/vendor/libs/apex-charts/apexcharts.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>

<!-- Main JS -->
<script src="./js/main1.js"></script>

<!-- Page JS -->
<script src="./js/dashboards-analytics.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script>

    var xValues = ["Customer", "Provider", "Shipper"];

    var barColors = [
        "#b91d47",
        "#00aba9",
        "#2b5797"

    ];
    var value1 = document.getElementById("customerchart").innerHTML;
    var value2 = document.getElementById("providerchart").innerHTML;
    var value3 = document.getElementById("shipperchart").innerHTML;

    var yValues = [value1, value2, value3];

    new Chart("myChart", {
        type: "doughnut",
        data: {
            labels: xValues,
            datasets: [{
                    backgroundColor: barColors,
                    data: yValues
                }]
        },

    });
    new Chart("myChart2", {
        type: "doughnut",
        data: {
            labels: xValues,
            datasets: [{
                    backgroundColor: barColors,
                    data: yValues
                }]
        },

    });
    new Chart("myChart3", {
        type: "doughnut",
        data: {
            labels: xValues,
            datasets: [{
                    backgroundColor: barColors,
                    data: yValues
                }]
        },

    });

    new Chart(document.getElementById("horizontalBar"), {
        "type": "horizontalBar",
        "data": {
            "labels": ["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Grey"],
            "datasets": [{
                    "label": "My First Dataset",
                    "data": [22, 33, 55, 12, 86, 23, 14],
                    "fill": false,
                    "backgroundColor": ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)",
                        "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)",
                        "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)"
                    ],
                    "borderColor": ["rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)",
                        "rgb(75, 192, 192)", "rgb(54, 162, 235)", "rgb(153, 102, 255)", "rgb(201, 203, 207)"
                    ],
                    "borderWidth": 1
                }]
        },
        "options": {
            "scales": {
                "xAxes": [{
                        "ticks": {
                            "beginAtZero": true
                        }
                    }]
            }
        }
    });
</script>
</body>
</html>
