<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<title>Danh sách đơn hàng | Quản trị Admin</title>
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
		<li><a class="app-menu__item "
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
		<li><a class="app-menu__item active"
			   href="${pageContext.request.contextPath}/order"><i
				class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Quản lý đơn hàng</span></a></li>
		<li><a class="app-menu__item "
			   href="${pageContext.request.contextPath}/inventory"><i
				class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Quản lý hàng tồn kho</span></a></li>
		<li><a class="app-menu__item"
			   href="${pageContext.request.contextPath}/historySign"><i
				class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Lịch sử tạo khóa</span></a></li>
	</ul>
</aside>
<main class="app-content">
	<div class="app-title">
		<ul class="app-breadcrumb breadcrumb side">
			<li class="breadcrumb-item active"><a href="#"><b>Danh sách đơn hàng</b></a></li>
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
							<th>ID đơn hàng</th>
							<th>Khách hàng</th>
							<th>Đơn hàng</th>
							<th>Số lượng</th>
							<th>Địa chỉ</th>
							<th>Ngày đặt</th>
							<th>Tổng tiền</th>
							<th>Tình trạng</th>
							<th>Xác thực</th>
							<th>Tính năng</th>
						</tr>
						</thead>
						<tbody>
						<c:if test="${not empty error}">
							<div class="alert alert-danger" role="alert">${error}</div>
						</c:if>

						<c:set var="currentOrderId" value="-1" />
						<c:set var="totalQuantity" value="0" />
						<c:set var="totalPrice" value="0" />
						<c:set var="productList" value="" />
						<c:forEach var="order" items="${list_order}" varStatus="loop">
							<c:choose>
								<c:when test="${order.id_order_admin != currentOrderId}">
									<c:if test="${!loop.first}">
										<!-- Hiển thị hàng chính cho đơn hàng trước đó -->
										<tr>
											<td width="10"><input type="checkbox" name="check1"
																  value="${currentOrderId}"></td>
											<td>${currentOrderId}</td>
											<td>${prevOrder.name_customer}</td>
											<td>
												<ul>
														${productList}
												</ul>
											</td>
											<td>${totalQuantity}</td>
											<td>${prevOrder.address}</td>
											<td>${prevOrder.date_order}</td>
											<td><fmt:formatNumber value="${totalPrice}" pattern="#,##0"/>đ</td>
											<td><span class="badge bg-success">${prevOrder.status}</span></td>
											<td>
										<c:if test="${orderBillMap.get(prevOrder.getId_order_admin()).verify(prevOrder.getPublicKey(), prevOrder.getSign()) == true}">
											<span class="badge bg-success">Đã xác thực</span>
										</c:if>
										<c:if test="${orderBillMap.get(prevOrder.getId_order_admin()).verify(prevOrder.getPublicKey(), prevOrder.getSign()) == false}">
											<span class="badge bg-danger">Xác thực thất bại</span>
										</c:if></td>
											<td>
												<form action="${pageContext.request.contextPath}/delete_order"
													  method="POST">
													<input type="hidden" name="order_id"
														   value="${currentOrderId}">
													<c:if test="${sessionScope.role == 'ADMIN'}">
														<button class="btn btn-primary btn-sm trash" type="submit"
																title="Xóa">
															<i class="fas fa-trash-alt"></i>
														</button>
														<a href="${pageContext.request.contextPath}/update_order?order_id=${currentOrderId}">
															<button class="btn btn-primary btn-sm edit" type="button"
																	title="Sửa">
																<i class="fa fa-edit"></i>
															</button>
														</a>
													</c:if>
												</form>
											</td>
										</tr>
									</c:if>
									<!-- Khởi tạo lại cho đơn hàng mới -->
									<c:set var="currentOrderId" value="${order.id_order_admin}" />
									<c:set var="totalQuantity" value="${order.quantity_order}" />
									<c:set var="totalPrice" value="${order.price}" />
									<c:set var="productList" value="<li>${order.name_product} (x${order.quantity_order})</li>" />
									<c:set var="prevOrder" value="${order}" />
								</c:when>
								<c:otherwise>
									<!-- Thêm sản phẩm vào danh sách con và tính tổng -->
									<c:set var="totalQuantity" value="${totalQuantity + order.quantity_order}" />
									<c:set var="totalPrice" value="${order.price}" />
									<c:set var="productList" value="${productList}<li>${order.name_product} (x${order.quantity_order})</li>" />
									<c:set var="prevOrder" value="${order}" />
								</c:otherwise>
							</c:choose>
							<c:if test="${loop.last}">
								<!-- Hiển thị hàng chính cho đơn hàng cuối cùng -->
								<tr>
									<td width="10"><input type="checkbox" name="check1"
														  value="${currentOrderId}"></td>
									<td>${currentOrderId}</td>
									<td>${prevOrder.name_customer}</td>
									<td>
										<ul>
												${productList}
										</ul>
									</td>
									<td>${totalQuantity}</td>
									<td>${prevOrder.address}</td>
									<td>${prevOrder.date_order}</td>
									<td><fmt:formatNumber value="${totalPrice}" pattern="#,##0"/>đ</td>
									<td><span class="badge bg-success">${prevOrder.status}</span></td>
									<td>
										<c:if test="${orderBillMap.get(prevOrder.getId_order_admin()).verify(prevOrder.getPublicKey(), prevOrder.getSign()) == true}">
											<span class="badge bg-success">Đã xác thực</span>
										</c:if>
										<c:if test="${orderBillMap.get(prevOrder.getId_order_admin()).verify(prevOrder.getPublicKey(), prevOrder.getSign()) == false}">
											<span class="badge bg-danger">Xác thực thất bại</span>
										</c:if>
									</td>
									<td>
										<form action="${pageContext.request.contextPath}/delete_order"
											  method="POST">
											<input type="hidden" name="order_id"
												   value="${currentOrderId}">
											<c:if test="${sessionScope.role == 'ADMIN'}">
												<button class="btn btn-primary btn-sm trash" type="submit"
														title="Xóa">
													<i class="fas fa-trash-alt"></i>
												</button>
												<a href="${pageContext.request.contextPath}/update_order?order_id=${currentOrderId}">
													<button class="btn btn-primary btn-sm edit" type="button"
															title="Sửa">
														<i class="fa fa-edit"></i>
													</button>
												</a>
											</c:if>
										</form>
									</td>
								</tr>
							</c:if>
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
		var yy = today.getFullYear();
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

<script type="text/javascript"
		src="https://cdn.datatables.net/2.2.1/css/dataTables.dataTables.css"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="//cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
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
			dom: '<"row"<"col-sm-6"l><"col-sm-6"f>>t<"row"<"col-sm-6"i><"col-sm-6 pagination-wrapper"p>>',
		});

		$('.pagination-wrapper').addClass('d-flex justify-content-start');
	});
</script>
</body>
</html>