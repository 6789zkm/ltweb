<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 6/29/2025
  Time: 10:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Báo mất khóa - Thành công</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f7f7f7;
        }

        .success-container {
            margin-top: 80px;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .success-icon {
            font-size: 60px;
            color: #28a745;
        }

        .btn-home {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 success-container">
            <div class="success-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <h2>Báo mất khóa thành công</h2>
            <p>Thông tin của bạn đã được gửi đến quản trị viên.<br>Chúng tôi sẽ phản hồi sớm nhất có thể.</p>
            <a href="${pageContext.request.contextPath}/profile" class="btn btn-primary btn-home">Quay lại trang cá nhân</a>
        </div>
    </div>
</div>

<!-- FontAwesome & Bootstrap JS -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>

