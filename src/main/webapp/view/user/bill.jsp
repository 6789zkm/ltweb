    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
    <html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bill</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Navbar_procate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Hero_procate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/NewCollections.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Bill.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Cate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Cart.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Footer.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    </head>
    <body>
    <jsp:include page="header.jsp"></jsp:include>

    <div class="cate-container container" style="height: 60px">
        <div class="cate-left">
            <ul class="cate-left-breadcrumb" style="margin-left: 20px;">
                <li><span class="ant-breadcrumb-link"><a href="home" draggable="false" aria-label="Trang chủ"
                                                         class="ellipsis-1 text-sm inline breadcrumb-link">TRANG CHỦ</a></span></li>
                <li class="ant-breadcrumb-separator" aria-hidden="true"><span class="items-center inline h-full">></span></li>
                <li><span class="ant-breadcrumb-link"><a aria-label="Thời trang"
                                                         class="ellipsis-1 text-sm inline breadcrumb-link">HÓA ĐƠN</a></span></li>
            </ul>
        </div>
    </div>

    <div class="container mt-4">
        <div class="row">
            <div class="col-md-8">
                <div class="invoice-container">
                    <div class="invoice-header">
                        <div class="invoice-logo">ECOMMERCE</div>
                        <div class="invoice-company-info">
                            Ecommerce<br>
                            123 Nguyen Du<br>
                            Quan 2, Thanh pho Ho Chi Minh<br>
                            ecommerce@gmail.com
                        </div>
                    </div>

                    <div class="invoice-client-info">
                        <h2>Họ và tên: ${customerName}</h2>
                        <h2>Địa chỉ: ${customerAddress}</h2>
                        <h2>Số điện thoại: ${customerPhone}</h2>
                        <h2>Email: ${user.email}</h2>
                    </div>

                    <table class="invoice-table">
                        <thead>
                        <tr>
                            <th>Số lượng</th>
                            <th>Sản phẩm</th>
                            <th>Giá sản phẩm</th>
                            <th>Tổng giá sản phẩm</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${selectedProducts}" var="product">
                            <tr>
                                <td>${product.quantity}</td>
                                <td>${product.name} <c:if test="${not empty product.color}">, ${product.color}</c:if> <c:if test="${not empty product.size}">, ${product.size}</c:if></td>
                                <td class="price">$<fmt:formatNumber value="${product.price}" pattern="#,##0.00"/></td>
                                <td class="subtotal">$<fmt:formatNumber value="${product.quantity * product.price}" pattern="#,##0.00"/></td>
                            </tr>
                            <c:set var="totalPrice"
                                   value="${totalPrice + (product.quantity * product.price)}" />
                        </c:forEach>
                        </tbody>
                    </table>

                    <div class="invoice-summary">
                        <p>Tổng tiền: <strong>$<fmt:formatNumber value="${totalPrice}" pattern="#,##0.00"/></strong></p>
                        <p>Tiền ship: <strong>$0.00</strong></p>
                        <p>Tiền được giảm giá: <strong>$0.00</strong></p>
                        <p><strong>Tổng cộng: $<fmt:formatNumber value="${totalPrice}" pattern="#,##0.00"/></strong></p>
                    </div>

                    <div class="payment-info">
                        <div>
                            <strong>Thông tin thanh toán</strong><br>
    <%--                        Account No: 123567744<br>--%>
    <%--                        Routing No: 120000547--%>
                        </div>
                        <div class="total-due">
                            <strong>TOTAL DUE</strong><br>
                            $<fmt:formatNumber value="${totalPrice}" pattern="#,##0.00"/>
                        </div>
                    </div>

                    <p class="thank-you">Thank you!</p>
                </div>
            </div>

            <div class="col-md-4">
                <form class="signature-frame" id="signature-form" action="<%=request.getContextPath()%>/completeOrder" method="post">
                    <h3>Xác nhận đơn hàng</h3>
                    <div class="mb-3">
                        <label for="signature-input" class="form-label">Định danh hóa đơn</label>
                        <div class="flex">
                            <input id="billindetify" type="text" class="form-control" value="${bill.encode()}" readonly>
                            <button type="button" class="btn btn-secondary form-control" id="copyClipboard">Copy</button>
                        </div>
                        
                    </div>
                    <div class="mb-3">
                        <label for="signature-input" class="form-label">Nhập mã chữ ký số</label>
                        <input type="text" class="form-control" id="signature-input" name="signatureInput" placeholder="Nhập mã chữ ký số">
                    </div>
                    <div class="d-flex gap-2">
                        <button id="confirm-signature" class="btn btn-success" type="submit">Xác nhận</button>
                    </div>
                    <div id="signature-status" class="mt-3"></div>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>

    <script>
    
        // Xử lý xác nhận chữ ký--%>
        // document.getElementById('confirm-signature').addEventListener('click', () => {
        //     const signatureInput = document.getElementById('signature-input').value;
        //    const signatureFile = document.getElementById('signature-file').files[0];
        //   if (!signatureInput && !signatureFile) {
        //      document.getElementById('signature-status').innerHTML = '<p class="text-danger">Vui lòng nhập mã chữ ký số hoặc tải file!</p>';
        //        return;
        //    }

        //    // Gửi dữ liệu chữ ký đến server (ví dụ minh họa)
        //    const formData = new FormData();
        //    formData.append('signatureInput', signatureInput);

        //    fetch('${pageContext.request.contextPath}/completeOrder', {
        //        method: 'POST',
        //        body: formData
        //    }).then(response => response.json()).then(data => {
        //        document.getElementById('signature-status').innerHTML = '<p class="text-success">Chữ ký đã được xác nhận!</p>';
        //    }).catch(error => {
        //         console.error('Error:', error);
        //        document.getElementById('signature-status').innerHTML = '<p class="text-danger">Lỗi khi xác nhận chữ ký!</p>';
        //    });
        // });

        // // Xử lý hủy chữ ký
        // document.getElementById('cancel-signature').addEventListener('click', () => {
        //    document.getElementById('signature-input').value = '';
        //    document.getElementById('signature-file').value = '';
        //    document.getElementById('signature-status').innerHTML = '<p class="text-info">Đã hủy chữ ký.</p>';
        // });

        document.getElementById('copyClipboard').addEventListener('click', function() {
            const textToCopy = document.querySelector('#signature-input').value;
            navigator.clipboard.writeText(textToCopy).then(function() {
                navigator.clipboard.writeText(document.querySelector('#billindetify').value).then(function() {
                    alert('Đã sao chép mã hóa đơn vào clipboard!');
                }).catch(function(err) {
                    console.error('Lỗi khi sao chép: ', err);
                });
            });
        });
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    </body>
    </html>