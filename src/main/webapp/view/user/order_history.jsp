<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch sử mua hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Navbar_procate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Hero_procate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/NewCollections.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Cate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Cart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/OrderHistory.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container mt-5">
    <div class="cate-container container" style="height: 60px">
        <div class="cate-left">
            <ul class="cate-left-breadcrumb" style="margin-left: 20px;">
                <li><span class="ant-breadcrumb-link"><a href="home" draggable="false" aria-label="Trang chủ"
                                                         class="ellipsis-1 text-sm inline breadcrumb-link">TRANG CHỦ</a></span></li>
                <li class="ant-breadcrumb-separator" aria-hidden="true"><span class="items-center inline h-full">></span></li>
                <li><span class="ant-breadcrumb-link"><a aria-label="Thời trang"
                                                         class="ellipsis-1 text-sm inline breadcrumb-link">LỊCH SỬ MUA HÀNG</a></span></li>
            </ul>
        </div>
    </div>
    <!-- Tabs Navigation -->
    <ul class="nav nav-tabs mt-5" id="orderTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="pending-tab" data-bs-toggle="tab" data-bs-target="#pending" type="button" role="tab" aria-controls="pending" aria-selected="true">Đang chờ</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="delivered-tab" data-bs-toggle="tab" data-bs-target="#delivered" type="button" role="tab" aria-controls="delivered" aria-selected="false">Đã giao</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="canceled-tab" data-bs-toggle="tab" data-bs-target="#canceled" type="button" role="tab" aria-controls="canceled" aria-selected="false">Đã hủy</button>
        </li>
    </ul>

    <!-- Tabs Content -->
    <div class="tab-content" id="orderTabsContent">
        <!-- Pending Tab -->
        <div class="tab-pane fade show active" id="pending" role="tabpanel" aria-labelledby="pending-tab">
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th>Mã đơn hàng</th>
                    <th>Khách hàng</th>
                    <th>Sản phẩm x Số lượng</th>
                    <th>Tổng số lượng</th>
                    <th>TỔng giá tiền</th>
                    <th>Địa chỉ</th>
                    <th>Ngày đặt hàng</th>
                    <th>Trạng thái</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="currentOrderId" value="-1" />
                <c:set var="totalQuantity" value="0" />
                <c:set var="productList" value="" />
                <c:forEach var="order" items="${list_pending}" varStatus="loop">
                    <c:choose>
                        <c:when test="${order.id_order_admin != currentOrderId}">
                            <c:if test="${!loop.first}">
                                <tr>
                                    <td>${currentOrderId}</td>
                                    <td>${prevOrder.name_customer}</td>
                                    <td class="order-items">
                                        <ul>${productList}</ul>
                                    </td>
                                    <td>${totalQuantity}</td>
                                    <td><fmt:formatNumber value="${prevOrder.price}" pattern="#,##0"/>đ</td>
                                    <td>${prevOrder.address}</td>
                                    <td>${prevOrder.date_order}</td>
                                    <td><span class="badge bg-warning">${prevOrder.status}</span></td>
                                </tr>
                            </c:if>
                            <c:set var="currentOrderId" value="${order.id_order_admin}" />
                            <c:set var="totalQuantity" value="${order.quantity_order}" />
                            <c:set var="productList" value="<li>${order.name_product} (x${order.quantity_order})</li>" />
                            <c:set var="prevOrder" value="${order}" />
                        </c:when>
                        <c:otherwise>
                            <c:set var="totalQuantity" value="${totalQuantity + order.quantity_order}" />
                            <c:set var="productList" value="${productList}<li>${order.name_product} (x${order.quantity_order})</li>" />
                            <c:set var="prevOrder" value="${order}" />
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${loop.last}">
                        <tr>
                            <td>${currentOrderId}</td>
                            <td>${prevOrder.name_customer}</td>
                            <td class="order-items">
                                <ul>${productList}</ul>
                            </td>
                            <td>${totalQuantity}</td>
                            <td><fmt:formatNumber value="${prevOrder.price}" pattern="#,##0"/>đ</td>
                            <td>${prevOrder.address}</td>
                            <td>${prevOrder.date_order}</td>
                            <td><span class="badge bg-warning">${prevOrder.status}</span></td>
                        </tr>
                    </c:if>
                </c:forEach>
                <c:if test="${empty list_pending}">
                    <tr>
                        <td colspan="10" class="text-center">Không có đơn hàng đang chờ.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
        <!-- Delivered Tab -->
        <div class="tab-pane fade" id="delivered" role="tabpanel" aria-labelledby="delivered-tab">
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th>Mã đơn hàng</th>
                    <th>Khách hàng</th>
                    <th>Sản phẩm x Số lượng</th>
                    <th>Tổng số lượng</th>
                    <th>TỔng giá tiền</th>
                    <th>Địa chỉ</th>
                    <th>Ngày đặt hàng</th>
                    <th>Trạng thái</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="currentOrderId" value="-1" />
                <c:set var="totalQuantity" value="0" />
                <c:set var="productList" value="" />
                <c:forEach var="order" items="${list_success}" varStatus="loop">
                    <c:choose>
                        <c:when test="${order.id_order_admin != currentOrderId}">
                            <c:if test="${!loop.first}">
                                <tr>
                                    <td>${currentOrderId}</td>
                                    <td>${prevOrder.name_customer}</td>
                                    <td class="order-items">
                                        <ul>${productList}</ul>
                                    </td>
                                    <td>${totalQuantity}</td>
                                    <td><fmt:formatNumber value="${prevOrder.price}" pattern="#,##0"/>đ</td>
                                    <td>${prevOrder.address}</td>
                                    <td>${prevOrder.date_order}</td>
                                    <td><span class="badge bg-success">${prevOrder.status}</span></td>
                                </tr>
                            </c:if>
                            <c:set var="currentOrderId" value="${order.id_order_admin}" />
                            <c:set var="totalQuantity" value="${order.quantity_order}" />
                            <c:set var="productList" value="<li>${order.name_product} (x${order.quantity_order})</li>" />
                            <c:set var="prevOrder" value="${order}" />
                        </c:when>
                        <c:otherwise>
                            <c:set var="totalQuantity" value="${totalQuantity + order.quantity_order}" />
                            <c:set var="productList" value="${productList}<li>${order.name_product} (x${order.quantity_order})</li>" />
                            <c:set var="prevOrder" value="${order}" />
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${loop.last}">
                        <tr>
                            <td>${currentOrderId}</td>
                            <td>${prevOrder.name_customer}</td>
                            <td class="order-items">
                                <ul>${productList}</ul>
                            </td>
                            <td>${totalQuantity}</td>
                            <td><fmt:formatNumber value="${prevOrder.price}" pattern="#,##0"/>đ</td>
                            <td>${prevOrder.address}</td>
                            <td>${prevOrder.date_order}</td>
                            <td><span class="badge bg-success">${prevOrder.status}</span></td>
                        </tr>
                    </c:if>
                </c:forEach>
                <c:if test="${empty list_success}">
                    <tr>
                        <td colspan="10" class="text-center">Không có đơn hàng đã giao.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
        <!-- Canceled Tab -->
        <div class="tab-pane fade" id="canceled" role="tabpanel" aria-labelledby="canceled-tab">
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th>Mã đơn hàng</th>
                    <th>Khách hàng</th>
                    <th>Sản phẩm x Số lượng</th>
                    <th>Tổng số lượng</th>
                    <th>TỔng giá tiền</th>
                    <th>Địa chỉ</th>
                    <th>Ngày đặt hàng</th>
                    <th>Trạng thái</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="currentOrderId" value="-1" />
                <c:set var="totalQuantity" value="0" />
                <c:set var="productList" value="" />
                <c:forEach var="order" items="${list_cancle}" varStatus="loop">
                    <c:choose>
                        <c:when test="${order.id_order_admin != currentOrderId}">
                            <c:if test="${!loop.first}">
                                <tr>
                                    <td>${currentOrderId}</td>
                                    <td>${prevOrder.name_customer}</td>
                                    <td class="order-items">
                                        <ul>${productList}</ul>
                                    </td>
                                    <td>${totalQuantity}</td>
                                    <td><fmt:formatNumber value="${prevOrder.price}" pattern="#,##0"/>đ</td>
                                    <td>${prevOrder.address}</td>
                                    <td>${prevOrder.date_order}</td>
                                    <td><span class="badge bg-danger">${prevOrder.status}</span></td>
                                </tr>
                            </c:if>
                            <c:set var="currentOrderId" value="${order.id_order_admin}" />
                            <c:set var="totalQuantity" value="${order.quantity_order}" />
                            <c:set var="productList" value="<li>${order.name_product} (x${order.quantity_order})</li>" />
                            <c:set var="prevOrder" value="${order}" />
                        </c:when>
                        <c:otherwise>
                            <c:set var="totalQuantity" value="${totalQuantity + order.quantity_order}" />
                            <c:set var="productList" value="${productList}<li>${order.name_product} (x${order.quantity_order})</li>" />
                            <c:set var="prevOrder" value="${order}" />
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${loop.last}">
                        <tr>
                            <td>${currentOrderId}</td>
                            <td>${prevOrder.name_customer}</td>
                            <td class="order-items">
                                <ul>${productList}</ul>
                            </td>
                            <td>${totalQuantity}</td>
                            <td><fmt:formatNumber value="${prevOrder.price}" pattern="#,##0"/>đ</td>
                            <td>${prevOrder.address}</td>
                            <td>${prevOrder.date_order}</td>
                            <td><span class="badge bg-danger">${prevOrder.status}</span></td>
                        </tr>
                    </c:if>
                </c:forEach>
                <c:if test="${empty list_cancle}">
                    <tr>
                        <td colspan="10" class="text-center">Không có đơn hàng đã hủy.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Select All checkboxes functionality
    document.querySelectorAll('[id^="all-"]').forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const table = this.closest('table');
            table.querySelectorAll('tbody input[type="checkbox"]').forEach(cb => {
                cb.checked = this.checked;
            });
        });
    });
</script>
</body>
</html>