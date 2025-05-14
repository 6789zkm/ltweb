<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Login.css">
    <link rel="stylesheet"
          href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
</head>
<body>
<section class="container forms">
    <div class="form login">
        <div class="form-content">
            <header>Đăng kí</header>
            <c:if test="${not empty error}">
                <div style="color:red;">${error}</div>
                <c:remove var="error" scope="session"/>
            </c:if>

<%--            <c:if test="${not empty sessionScope.success}">--%>
<%--                <div style="color:green;">${sessionScope.success}</div>--%>
<%--                <c:remove var="success" scope="session"/>--%>
<%--            </c:if>--%>
            <form action="<%=request.getContextPath()%>/signup" method="POST">
                <div class="field input-field">
                    <input type="text" placeholder="Your email" class="input" name = "username"
                           id="emailOrUsername" style="margin-top: 5%"/>
                    <input type="password" placeholder="Your Password" class="input" name = "password"
                           id="emailOrUsername" style="margin-top: 5%"/>
                    <input type="password" placeholder="Again Your Password" class="input" name = "repassword"
                           id="emailOrUsername" style="margin-top: 5%"/>
                </div>

                <div class="field button-field" style="margin-top: 35%">
                    <button class="button-signup" type="submit">Đăng kí</button>
                </div>

                <div class="field button-field" style="margin-top: 3%">
                    <button class="button-signup" type="button" onclick="window.location.href='${pageContext.request.contextPath}/view/user/login.jsp'">
                        Quay lại đăng nhập</button>
                </div>
            </form>
        </div>




    </div>
</section>
</body>
</html>