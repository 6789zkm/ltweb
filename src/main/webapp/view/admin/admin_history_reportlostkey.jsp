<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 6/29/2025
  Time: 1:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách khóa | Quản trị Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/admin/main.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/admin/datatable.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet"
          href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet"
          href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    <style>
        /* ========================================================= */
        /* START: CSS mới để xử lý bảng và xuống dòng nội dung dài  */
        /* ========================================================= */

        /* Buộc bảng sử dụng chiều rộng đã định và chiếm toàn bộ không gian */
        #sampleTable {
            table-layout: fixed; /* RẤT QUAN TRỌNG: Buộc các cột tuân theo chiều rộng đã đặt */
            width: 100% !important; /* Đảm bảo bảng chiếm 100% chiều rộng của thẻ cha */
        }

        /* Định nghĩa chiều rộng cho từng cột (phải đảm bảo tổng các width = 100%) */
        /* Bạn có thể điều chỉnh các giá trị này */
        #sampleTable th:nth-child(1), #sampleTable td:nth-child(1) { width: 3%; }   /* Checkbox */
        #sampleTable th:nth-child(2), #sampleTable td:nth-child(2) { width: 5%; }   /* ID */
        #sampleTable th:nth-child(3), #sampleTable td:nth-child(3) { width: 12%; }  /* Khách hàng */
        #sampleTable th:nth-child(4), #sampleTable td:nth-child(4) { width: 15%; }  /* Email */
        #sampleTable th:nth-child(5), #sampleTable td:nth-child(5) { width: 10%; }  /* Số điện thoại */
        #sampleTable th:nth-child(6), #sampleTable td:nth-child(6) { width: 35%; }  /* Khóa (Đây là cột quan trọng) */
        #sampleTable th:nth-child(7), #sampleTable td:nth-child(7) { width: 10%; }  /* Ngày tạo */
        #sampleTable th:nth-child(8), #sampleTable td:nth-child(8) { width: 10%; }  /* Trạng thái */


        /* Thiết lập chung cho các ô và tiêu đề để nội dung tự động xuống dòng */
        #sampleTable th,
        #sampleTable td {
            white-space: normal;      /* Cho phép nội dung xuống dòng */
            word-wrap: break-word;    /* Buộc các từ dài không có khoảng trắng xuống dòng */
            overflow-wrap: break-word;/* Phiên bản hiện đại của word-wrap */
            vertical-align: top;      /* Căn nội dung lên trên cùng của ô */
            padding: 8px;             /* Thêm padding cho các ô để dễ đọc */
        }

        /* Đảm bảo ul và li không có padding/margin thừa và nội dung bên trong li xuống dòng */
        .key-list {
            list-style: none; /* Bỏ dấu chấm đầu dòng mặc định của ul/li */
            padding: 0;
            margin: 0;
        }
        .key-list li {
            word-wrap: break-word;    /* Đảm bảo nội dung trong li cũng xuống dòng */
            overflow-wrap: break-word;/* Phiên bản hiện đại của word-wrap */
            padding: 2px 0;           /* Thêm padding nhẹ cho mỗi mục khóa */
        }
        /* ========================================================= */
        /* END: CSS mới để xử lý bảng và xuống dòng nội dung dài    */
        /* ========================================================= */
    </style>
</head>
<body onload="time()" class="app sidebar-mini rtl">
<header class="app-header">
    <a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
       aria-label="Hide Sidebar"></a>
    <ul class="app-nav">
        <li><a class="app-nav__item" href="${pageContext.request.contextPath}/logout"><i
                class='bx bx-log-out bx-rotate-180'></i> </a></li>
    </ul>
</header>
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="app-sidebar__user">
        <div>
            <p class="app-sidebar__user-name">
                <b>${user.name}</b>
            </p>
            <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
        </div>
    </div>
    <hr>
    <ul class="app-menu">
        <li><a class="app-menu__item"
               href="${pageContext.request.contextPath}/adminController"><i
                class='app-menu__icon bx bx-tachometer'></i><span
                class="app-menu__label">Bảng điều khiển</span></a></li>
        <li><a class="app-menu__item"
               href="${pageContext.request.contextPath}/admin_employee"><i
                class='app-menu__icon bx bx-id-card'></i> <span
                class="app-menu__label">Quản lý nhân viên</span></a></li>
        <li><a class="app-menu__item"
               href="${pageContext.request.contextPath}/admin_customer"><i
                class='app-menu__icon bx bx-user-voice'></i><span
                class="app-menu__label">Quản lý khách hàng</span></a></li>
        <li><a class="app-menu__item"
               href="${pageContext.request.contextPath}/adminProduct"><i
                class='app-menu__icon bx bx-purchase-tag-alt'></i><span
                class="app-menu__label">Quản lý sản phẩm</span></a></li>
        <li><a class="app-menu__item"
               href="${pageContext.request.contextPath}/order"><i
                class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Quản lý đơn hàng</span></a></li>
        <li><a class="app-menu__item"
               href="${pageContext.request.contextPath}/inventory"><i
                class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Quản lý hàng tồn kho</span></a></li>
        <li><a class="app-menu__item"
               href="${pageContext.request.contextPath}/historySign"><i
                class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Lịch sử tạo khóa</span></a></li>
        <li><a class="app-menu__item active"
               href="${pageContext.request.contextPath}/historyReportLostKey"><i
                class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Lịch sử báo mất khoá</span></a></li>

    </ul>
</aside>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách lịch sử báo mất khoá</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <%-- <a class="btn btn-add btn-sm"
                                           href="<%=request.getContextPath()%>/adminAddProduct?action=view"
                                           title="Thêm"><i class="fas fa-plus"></i> Tạo mới sản phẩm</a> --%>
                        </div>
                    </div>
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th width="10"><input type="checkbox" id="all"></th>
                            <th>ID</th>
                            <th>Khách hàng</th>
                            <th>Email</th>
                            <th>Số điện thoại</th>
                            <th>Khóa</th>
                            <th>Ngày tạo</th>
                            <th>Trạng thái</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="r" items="${list}">
                            <tr>
                                <td>${r.id}</td>
                                <td>${r.name}</td>
                                <td>${r.email}</td>
                                <td>${r.phone}</td>
                                <td>${r.publicKey}</td>
                                <td><fmt:formatDate value="${r.reportTime}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                                <td>${r.isHandled ? "Đã xử lý" : "Chưa xử lý"}</td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<script src="${pageContext.request.contextPath}/js/admin/main.js"></script>

<script>
    // Thời Gian
    function time() {
        var today = new Date();
        var weekday = new Array(7);
        weekday[0] = "Chủ Nhật";
        weekday[1] = "Thứ Hai";
        weekday[2] = "Thứ Ba";
        weekday[3] = "Thứ Tư";
        weekday[4] = "Thứ Năm";
        weekday[5] = "Thứ Sáu";
        weekday[6] = "Thứ Bảy";
        var day = weekday[today.getDay()];
        var dd = today.getDate();
        var mm = today.getMonth() + 1;
        var yy = today.getFullYear();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();
        m = checkTime(m);
        s = checkTime(s);
        nowTime = h + " giờ " + m + " phút " + s + " giây";
        if (dd < 10) {
            dd = '0' + dd;
        }
        if (mm < 10) {
            mm = '0' + mm;
        }
        today = day + ', ' + dd + '/' + mm + '/' + yy;
        tmp = '<span class="date"> ' + today + ' - ' + nowTime + '</span>';
        document.getElementById("clock").innerHTML = tmp;
        clocktime = setTimeout("time()", "1000", "Javascript");

        function checkTime(i) {
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        }
    }
</script>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.0.2/css/dataTables.dataTables.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
<script>
    $(document).ready(function () {
        $('#sampleTable').DataTable({
            language: {
                url: 'https://cdn.datatables.net/plug-ins/1.13.6/i18n/vi.json'
            },
            pageLength: 10,
            lengthMenu: [
                [10, 25, 50, -1],
                [10, 25, 50, "Tất cả"]
            ],
            // RẤT QUAN TRỌNG: Vô hiệu hóa DataTables tự động tính chiều rộng
            autoWidth: false,
            // Vô hiệu hóa tính năng cuộn ngang của DataTables
            scrollX: false,
            // Cấu hình DOM để giữ lại thanh tìm kiếm
            dom: '<"row"<"col-sm-6"l><"col-sm-6"f>>t<"row"<"col-sm-6"i><"col-sm-6 pagination-wrapper"p>>',
        });

        // Đảm bảo phân trang được căn trái nếu có CSS tương ứng
        $('.pagination-wrapper').addClass('d-flex justify-content-start');
    });
</script>
</body>
</html>
