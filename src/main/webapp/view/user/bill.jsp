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
                        <h2>${user.name || customerName}</h2>
                        <h2>${user.address || customerAddress}</h2>
                        <h2>${user.phone || customerPhone}</h2>
                        <h2>${user.email}</h2>
                        <div class="invoice-details">
                            <p><strong>Ngày đặt hàng:</strong> <fmt:formatDate value="${aor.date_order}" pattern="MMMM dd, yyyy"/></p>
    <%--                        <p><strong>Invoice No:</strong> 12345</p>--%>
                        </div>
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
                        <div class="due-date">
                            <strong>Thông tin xác thực</strong><br>
                            ${aor.sign}
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
                <div class="signature-frame">
                    <h3>Chữ ký số</h3>
                    <button id="download-invoice" class="btn btn-primary mb-3">Tải hóa đơn (PDF)</button>
                    <div class="mb-3">
                        <label for="signature-input" class="form-label">Nhập mã chữ ký số hoặc tải file</label>
                        <input type="text" class="form-control" id="signature-input" placeholder="Nhập mã chữ ký số">
                        <input type="file" class="form-control mt-2" id="signature-file" accept=".p12,.pfx">
                    </div>
                    <div class="d-flex gap-2">
                        <button id="confirm-signature" class="btn btn-success">Xác nhận chữ ký</button>
                        <button id="cancel-signature" class="btn btn-danger">Hủy chữ ký</button>
                    </div>
                    <div id="signature-status" class="mt-3"></div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>

    <script>
        // Tạo PDF từ hóa đơn
        document.getElementById('download-invoice').addEventListener('click', () => {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();
            const invoiceContainer = document.querySelector('.invoice-container');

            // Sử dụng html2canvas để chuyển đổi phần tử HTML thành canvas
            html2canvas(invoiceContainer).then(canvas => {
                const imgData = canvas.toDataURL('image/png');
                const imgWidth = 210; // Chiều rộng trang A4
                const imgHeight = (canvas.height * imgWidth) / canvas.width;

                doc.addImage(imgData, 'PNG', 0, 0, imgWidth, imgHeight);
                doc.save('invoice_12345.pdf');
            });
        });

        <%--// Xử lý xác nhận chữ ký--%>
        <%--document.getElementById('confirm-signature').addEventListener('click', () => {--%>
        <%--    const signatureInput = document.getElementById('signature-input').value;--%>
        <%--    const signatureFile = document.getElementById('signature-file').files[0];--%>
        <%--    if (!signatureInput && !signatureFile) {--%>
        <%--        document.getElementById('signature-status').innerHTML = '<p class="text-danger">Vui lòng nhập mã chữ ký số hoặc tải file!</p>';--%>
        <%--        return;--%>
        <%--    }--%>

        <%--    // Gửi dữ liệu chữ ký đến server (ví dụ minh họa)--%>
        <%--    const formData = new FormData();--%>
        <%--    formData.append('signatureInput', signatureInput);--%>
        <%--    if (signatureFile) formData.append('signatureFile', signatureFile);--%>
        <%--    formData.append('invoiceId', '12345');--%>

        <%--    fetch('${pageContext.request.contextPath}/saveSignature', {--%>
        <%--        method: 'POST',--%>
        <%--        body: formData--%>
        <%--    }).then(response => response.json()).then(data => {--%>
        <%--        document.getElementById('signature-status').innerHTML = '<p class="text-success">Chữ ký đã được xác nhận!</p>';--%>
        <%--    }).catch(error => {--%>
        <%--        document.getElementById('signature-status').innerHTML = '<p class="text-danger">Lỗi khi xác nhận chữ ký!</p>';--%>
        <%--    });--%>
        <%--});--%>

        <%--// Xử lý hủy chữ ký--%>
        <%--document.getElementById('cancel-signature').addEventListener('click', () => {--%>
        <%--    document.getElementById('signature-input').value = '';--%>
        <%--    document.getElementById('signature-file').value = '';--%>
        <%--    document.getElementById('signature-status').innerHTML = '<p class="text-info">Đã hủy chữ ký.</p>';--%>
        <%--});--%>
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    </body>
    </html>