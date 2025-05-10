<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.nio.charset.StandardCharsets"%>
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
		  href="${pageContext.request.contextPath}/css/admin/admin_add_product.css">

	<link rel="stylesheet"
		  href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
	<!-- or -->
	<link rel="stylesheet"
		  href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
	<!-- Font-icon css-->
	<link rel="stylesheet" type="text/css"
		  href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script
			src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<link rel="stylesheet"
		  href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<link rel="stylesheet"
		  href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
		  href="${pageContext.request.contextPath}/adding/bootstrap/boostrap.min.css">

	<script
			src="${pageContext.request.contextPath}/adding/bootstrap/bootstrap.bundle.min.js"></script>

	<!-- CSS bổ sung cho danh sách sản phẩm -->
	<style>
		.form-control ul {
			padding-left: 20px;
			margin-bottom: 0;
		}
		.form-control li {
			list-style-type: disc;
			margin-bottom: 5px;
		}
	</style>
</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<header class="app-header">
	<!-- Sidebar toggle button-->
	<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
	   aria-label="Hide Sidebar"></a>
	<!-- Navbar Right Menu-->
	<ul class="app-nav">
		<li><a class="app-nav__item" href="${pageContext.request.contextPath}/logout"><i
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
		<li><a class="app-menu__item "
			   href="${pageContext.request.contextPath}/order"><i
				class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Quản
                lý đơn hàng</span></a></li>
		<li><a class="app-menu__item "
			   href="${pageContext.request.contextPath}/inventory"><i
				class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Quản
                lý hàng tồn kho</span></a></li>
	</ul>
</aside>

<main class="app-content">
	<div class="container mt-5">
		<!-- Title -->
		<h2 class="text-center mb-4">Sửa trạng thái đơn hàng</h2>

		<!-- Tab navigation -->
		<ul class="nav nav-tabs" id="productTab" role="tablist">
			<li class="nav-item">
				<button class="nav-link active" id="spu-tab" data-bs-toggle="tab"
						data-bs-target="#spu" type="button" role="tab">Thông Tin
					Đơn Hàng</button>
			</li>
		</ul>

		<!-- Tab content -->
		<div class="tab-content mt-4" id="productTabContent">
			<div class="tab-pane fade show active" id="spu" role="tabpanel"
				 aria-labelledby="spu-tab">
				<form
						action="${pageContext.request.contextPath}/update_order_action"
						method="POST">
					<div class="mb-3">
						<label for="orderCode" class="form-label">Mã đơn hàng</label>
						<input type="text" class="form-control" id="orderCode" name="orderId"
							   value="${order.id_order_admin}" readonly>
					</div>
					<div class="mb-3">
						<label for="customerName" class="form-label">Tên khách hàng</label>
						<input type="text" class="form-control" id="customerName" name="customerName"
							   value="${order.name_customer}" readonly>
					</div>
					<div class="mb-3">
						<label for="orderDetails" class="form-label">Đơn hàng</label>
						<div class="form-control" style="height: auto; background-color: #f8f9fa;" readonly>
							<ul>
								<c:set var="currentOrderId" value="${order.id_order_admin}" />
								<c:forEach var="item" items="${list_order_update}">
									<c:if test="${item.id_order_admin == currentOrderId}">
										<li>${item.name_product} (x${item.quantity_order})</li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="mb-3">
						<label for="quantity" class="form-label">Tổng số lượng</label>
						<input type="text" class="form-control" id="quantity" name="quantity"
							   value="<c:set var='totalQuantity' value='0' /><c:forEach var='item' items='${list_order_update}'><c:if test='${item.id_order_admin == currentOrderId}'><c:set var='totalQuantity' value='${totalQuantity + item.quantity_order}' /></c:if></c:forEach>${totalQuantity}"
							   readonly>
					</div>
					<div class="mb-3">
						<label for="totalPrice" class="form-label">Tổng tiền</label>
						<input type="text" class="form-control" id="totalPrice" name="totalPrice"
							   value="<c:set var='totalPrice' value='0' /><c:forEach var='item' items='${list_order_update}'><c:if test='${item.id_order_admin == currentOrderId}'><c:set var='totalPrice' value='${item.price}' /></c:if></c:forEach><fmt:formatNumber value='${totalPrice}' pattern='#,##0'/>đ"
							   readonly>
					</div>
					<div class="mb-3">
						<label for="orderStatus" class="form-label">Tình trạng</label>
						<select class="form-control" id="orderStatus" name="orderStatus" required>
							<option value="ĐÃ_HỦY" ${order.status == 'ĐÃ_HỦY' ? 'selected' : ''}>Đã hủy</option>
							<option value="ĐANG_CHỜ" ${order.status == 'ĐANG_CHỜ' ? 'selected' : ''}>Đang chờ</option>
							<option value="ĐÃ_HOÀN_THÀNH" ${order.status == 'ĐÃ_HOÀN_THÀNH' ? 'selected' : ''}>Đã giao</option>
						</select>
					</div>
					<div class="mb-3">
						<label for="orderSign" class="form-label">Xác thực</label>
						<select class="form-control" id="orderSign" name="orderSign" required disabled>
							<option value="HỢP_LỆ" ${order.sign == 'HỢP_LỆ' ? 'selected' : ''}>Hợp lệ</option>
							<option value="KHÔNG_HỢP_LỆ" ${order.sign == 'KHÔNG_HỢP_LỆ' ? 'selected' : ''}>Không hợp lệ</option>
						</select>
					</div>
					<button type="submit" class="btn btn-primary" id="saveSpu">Lưu Thông Tin Đơn Hàng</button>
				</form>
			</div>
		</div>

		<c:if test="${not empty message}">
		<div class="modal fade" id="message" tabindex="-1"
			 aria-labelledby="outOfStockModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="outOfStockModalLabel">Thông báo</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>${fn:escapeXml(URLDecoder.decode(message, StandardCharsets.UTF_8.toString()))}</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Đóng</button>
					</div>
				</div>
			</div>
		</div>
		</c:if>

		<script src="${pageContext.request.contextPath}/js/admin/main.js"></script>
</body>
</html>