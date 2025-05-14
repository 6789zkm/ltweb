<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác thực email</title>
    <link rel="stylesheet"
          href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Verify.css">

</head>
<body>

<div class="otp-container">
    <!-- <i class='bx bx-x close-btn'></i> -->
    <header>Nhập Email </header>
    <c:if test="${not empty error}">
        <div style="color:red;">${error}</div>
        <c:remove var="error" scope="session"/>
    </c:if>
    <p>Vui lòng nhập email đã được sử dụng để đăng kí, để phục vụ chức năng mật khẩu</p>
    <form action="<%=request.getContextPath()%>/verifyEmail" method="POST">
        <div class="otp-input">
            <input type="text" name="email" style="width: 100%;">
        </div>
        <button type="submit" class="continue-btn">Tiếp tục</button>
    </form>
</div>
</body>
</html>
