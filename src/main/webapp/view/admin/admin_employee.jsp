<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Danh sách nhân viên | Quản trị Admin</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Main CSS-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/datatable.css">

<!-- Font-icon css-->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/adding/bootstrap/boostrap.min.css"> --%>

<script
	src="${pageContext.request.contextPath}/adding/bootstrap/bootstrap.bundle.min.js"></script>

</head>

<body onload="time()" class="app sidebar-mini rtl">
	<!-- Navbar-->
	<header class="app-header">
		<!-- Sidebar toggle button-->
		<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
			aria-label="Hide Sidebar"></a>
		<!-- Navbar Right Menu-->
		<ul class="app-nav">

			<li><a class="app-nav__item"
				href="${pageContext.request.contextPath}/logout"><i
					class='bx bx-log-out bx-rotate-180'></i> </a></li>
		</ul>
	</header>
	<!-- Sidebar menu-->
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
		<ul class="app-menu">
			<li><a class="app-menu__item"
				href="${pageContext.request.contextPath}/adminController"><i
					class='app-menu__icon bx bx-tachometer'></i><span
					class="app-menu__label">Bảng điều khiển</span></a></li>
			<li><a class="app-menu__item active"
				href="${pageContext.request.contextPath}/admin_employee"><i
					class='app-menu__icon bx bx-id-card'></i> <span
					class="app-menu__label">Quản lý nhân viên</span></a></li>
			<li><a class="app-menu__item"
				href="${pageContext.request.contextPath}/admin_customer"><i
					class='app-menu__icon bx bx-user-voice'></i><span
					class="app-menu__label">Quản lý khách hàng</span></a></li>
			<li><a class="app-menu__item "
				href="${pageContext.request.contextPath}/adminProduct"><i
					class='app-menu__icon bx bx-purchase-tag-alt'></i><span
					class="app-menu__label">Quản lý sản phẩm</span></a></li>
			<li><a class="app-menu__item "
				href="${pageContext.request.contextPath}/order"><i
					class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Quản
						lý đơn hàng</span></a></li>
			<li><a class="app-menu__item "
				href="${pageContext.request.contextPath}/inventory"><i
					class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Quản
						lý hàng tồn kho</span></a></li>
			<li><a class="app-menu__item"
				   href="${pageContext.request.contextPath}/historySign"><i
					class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Lịch sử tạo khóa</span></a></li>
			<li><a class="app-menu__item"
				   href="${pageContext.request.contextPath}/historyReportLostKey"><i
					class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Lịch sử báo mất khoá</span></a></li>
		</ul>
	</aside>
	<main class="app-content">
		<div class="app-title">
			<ul class="app-breadcrumb breadcrumb side">
				<li class="breadcrumb-item active"><a href="#"><b>Danh
							sách khách hàng</b></a></li>
			</ul>
			<div id="clock"></div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<div class="tile-body">
						<div class="row element-button">
							<div class="col-sm-2">
								<c:if test="${sessionScope.role == 'ADMIN'}">
									<a class="btn btn-add btn-sm"
										href="${pageContext.request.contextPath}/addEmployeeView"
										title="Thêm"><i class="fas fa-plus"></i> Thêm nhân viên</a>
								</c:if>
							</div>
							<c:if test="${not empty error}">
								<div class="alert alert-danger" role="alert">${error}</div>
							</c:if>
						</div>
						<table class="table table-hover table-bordered" id="productTable">
							<thead>
								<tr>
									<th>Mã nhân viên</th>
									<th>Email</th>
									<th>Số điện thoại</th>
									<th>Tên khách hàng</th>
									<th>Địa chỉ</th>
									<th>Ngày tạo</th>
									<th>Phân quyền</th>
										<th></th>
								</tr>
							</thead>
							<tbody>

								<c:if test="${not empty error}">
									<div class="alert alert-danger" role="alert">${error}</div>
								</c:if>
								<c:forEach items="${list_employee}" var="employee">
									<tr>
										<td>${employee.user_id}</td>
										<!-- Input ẩn để lưu user_id -->

										<td>${employee.email}</td>
										<td>${employee.phone}</td>
										<td>${employee.user_name}</td>
										<td>${employee.address}</td>
										<td>${employee.create_at}</td>
										<td>${employee.role_name}</td>
										<td>
											<form
												action="${pageContext.request.contextPath}/delete_employee"
												method="POST">
												<c:if test="${sessionScope.role == 'ADMIN'}">
													<input type="hidden" name="user_id"
														value="${employee.user_id}">
													<button class="btn btn-primary btn-sm trash" type="submit"
														title="Xóa">
														<i class="fas fa-trash-alt"></i>
													</button>
												</c:if>
											</form>
										</td>
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
	<script type="text/javascript">
		//Thời Gian
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
			var yyyy = today.getFullYear();
			var h = today.getHours();
			var m = today.getMinutes();
			var s = today.getSeconds();
			m = checkTime(m);
			s = checkTime(s);
			nowTime = h + " giờ " + m + " phút " + s + " giây";
			if (dd < 10) {
				dd = '0' + dd
			}
			if (mm < 10) {
				mm = '0' + mm
			}
			today = day + ', ' + dd + '/' + mm + '/' + yyyy;
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

	<!-- DataTables JS -->
	<script type="text/javascript"
		src="https://cdn.datatables.net/2.2.1/css/dataTables.dataTables.css"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$('#productTable')
									.DataTable(
											{
												language : {
													url : 'https://cdn.datatables.net/plug-ins/1.13.6/i18n/vi.json'
												},
												pageLength : 10,
												lengthMenu : [
														[ 10, 25, 50, -1 ],
														[ 10, 25, 50, "Tất cả" ] ],
												dom : '<"row"<"col-sm-6"l><"col-sm-6"f>>t<"row"<"col-sm-6"i><"col-sm-6 pagination-wrapper"p>>',
											});

							// Move pagination to the left
							$('.pagination-wrapper').addClass(
									'd-flex justify-content-start');
						});
	</script>

</body>

</html>