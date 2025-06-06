<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="vi">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Giỏ Hàng</title>
	<link rel="stylesheet" href="css/Navbar_procate.css">
	<link rel="stylesheet" href="css/Hero_procate.css">
	<link rel="stylesheet" href="css/SearchBar.css">
	<link rel="stylesheet" href="css/Popular.css">
	<link rel="stylesheet" href="css/Item.css">
	<link rel="stylesheet" href="css/NewCollections.css">
	<link rel="stylesheet" href="css/NewLetter.css">
	<link rel="stylesheet" href="css/Cate.css">
	<link rel="stylesheet" href="css/Cart.css">
	<link rel="stylesheet" href="adding/bootstrap/bootstrap.min.css">
	<script>
		window.contextPath = "${pageContext.request.contextPath}";
		console.log("Context Path:", window.contextPath);
	</script>
	<script src="${pageContext.request.contextPath}/js/cart.js" defer></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="cate-container container">
	<div class="cate-left">
		<ul class="cate-left-breadcrumb" style="margin-left: 20px;">
			<li><span class="ant-breadcrumb-link"><a href="home" draggable="false" aria-label="Trang chủ" class="ellipsis-1 text-sm inline breadcrumb-link">TRANG CHỦ</a></span></li>
			<li class="ant-breadcrumb-separator" aria-hidden="true"><span class="items-center inline h-full">></span></li>
			<li><span class="ant-breadcrumb-link"><a aria-label="Giỏ hàng" class="ellipsis-1 text-sm inline breadcrumb-link">GIỎ HÀNG CỦA TÔI</a></span></li>
		</ul>
	</div>
</div>

<div class="container mt-5" style="margin-bottom: 8rem">
	<div class="row">
		<div class="left-cart col-md-8">
			<div class="cart-items">
				<div class="p-3 text-center">
					<span class="font-weight-bold">Giao Hàng</span>
				</div>
				<hr class="divider" style="margin: 0; height: 4px; background: black; opacity: 0.8" />

				<div class="cart-items pb-5 px-23 undefined" style="padding: 0px 24px">
					<c:choose>
						<c:when test="${not empty cartDetailList}">
							<div style="display: flex; justify-content: flex-start; gap: 0.5rem; margin-top: 0.5rem;">
								<label class="select-all-wrapper">
									<input type="checkbox" class="select-item-all" id="selectAll" checked>
									<span class="custom-checkbox"></span>
								</label>
								<span class="select-all-label">Chọn tất cả</span>
							</div>
						</c:when>
					</c:choose>

					<c:choose>
						<c:when test="${not empty cartDetailList}">
							<c:forEach items="${cartDetailList}" var="detail">
								<div class="cart-item d-flex justify-content-between align-items-center border-bottom" data-cart-id="${detail.cartId}">
									<label class="select-item-wrapper">
										<input type="checkbox" class="select-item" data-price="${detail.price * detail.quantity}" checked>
										<span class="custom-checkbox"></span>
									</label>
									<div class="cart-item-image ml-5">
										<img src="${detail.image}" alt="Hình ảnh sản phẩm" class="img-fluid" />
									</div>
									<div class="cart-item-details ml-3">
										<p class="cart-item-name mb-0">${detail.name}</p>
										<p class="cart-item-description text-muted mb-2">${detail.color}, ${detail.size}</p>
										<div class="cart-item-actions">
											<div class="quantity-container">
												<button class="btn-quantity" onclick="changeQuantity(-1, 'quantity_${detail.cartId}')">-</button>
												<input type="text" class="item-quantity text-center" id="quantity_${detail.cartId}" value="${detail.quantity}" readonly="readonly">
												<button class="btn-quantity" onclick="changeQuantity(1, 'quantity_${detail.cartId}')">+</button>
											</div>
											<button class="remove-item-btn" onclick="deleteInCart('quantity_${detail.cartId}')"><img src="img/remove.png" alt="Biểu tượng xóa"></button>
										</div>
									</div>
									<div class="cart-item-price font-weight-bold">
										<fmt:formatNumber value="${detail.quantity * detail.price}" pattern="#,###" /> đ
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div style="height: 120px; display: flex; align-items: center; justify-content: center; flex-direction: column; padding: 0px 23px; text-align: center;">
								Bạn chưa có sản phẩm nào trong giỏ hàng
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

		<div class="col-md-4">
			<div class="total-summary">
				<p class="mb-2 font-weight-bold">Tổng đơn hàng:</p>
				<h4 class="total-price mb-2" id="totalPrice">0 đ</h4>
				<button class="btn btn-dark btn-block mt-1" style="margin-right: 0.25rem" onclick="checkOut();">ĐẶT HÀNG</button>
				<a href="home" class="btn btn-outline-dark btn-block mt-1">TIẾP TỤC MUA SẮM</a>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="deleteConfirmationModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="deleteConfirmationModalLabel">Xác nhận xóa</h5>
				<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
			</div>
			<div class="modal-body">Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng không?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal()">Hủy</button>
				<button type="button" class="btn btn-danger" id="confirmDeleteButton" onclick="confirmDelete()">Xóa</button>
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script src="adding/popper/popper.min.js"></script>
<script src="adding/bootstrap/bootstrap.min.js"></script>
<script src="adding/bootstrap/bootstrap.bundle.min.js"></script>