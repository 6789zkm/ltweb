<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Login</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Login.css">
	<link rel="stylesheet"
		  href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
</head>
<body>
<section class="container forms">
	<div class="form login">
		<div class="form-content">
			<header>Login</header>
			<c:if test="${not empty error}">
				<div style="color:red;">${error}</div>
				<c:remove var="error" scope="session"/>
			</c:if>
			<c:if test="${not empty success}">
				<div style="color:green;">${success}</div>
				<c:remove var="success" scope="session"/>
			</c:if>
			<%--				<div class="form-link">--%>
			<%--					<span>Login quickly with your phone number.If you don't have--%>
			<%--						account yet, Ecommerce will create one for you</span>--%>
			<%--				</div>--%>
			<form action="<%=request.getContextPath()%>/login" method="POST">
				<div class="field input-field">
					<input type="text" placeholder="Your Email" class="input" name = "username" id="emailOrUsername" />
				</div>
				<div class="field input-field">
					<input type="password" placeholder="Your Password" class="input" name = "password" id="emailOrUsername" />
				</div>

				<div class="button-group">
					<div class="field button-field" >
						<button type="submit">Đăng nhập</button>
					</div>
					<div class="field button-field" style="cursor: pointer">
						<button type="button" onclick="window.location.href='${pageContext.request.contextPath}/view/user/sign_up.jsp'">Đăng kí</button>
					</div>
					<div class="forgot-password-container">
						<a href="${pageContext.request.contextPath}/view/user/forgot_password.jsp">Quên mật khẩu</a>
					</div>
				</div>
			</form>
			<div class="line"></div>
			<div class="media-options">
				<%--					<a href="#" class="facebook">--%>
				<%--						<i class='bx bxl-facebook facebook-icon'></i>--%>
				<%--						<span>Login with Facebook</span>--%>
				<%--					</a>--%>
				<a
						href="https://accounts.google.com/o/oauth2/auth?scope=profile%20https://www.googleapis.com/auth/userinfo.email&redirect_uri=http://localhost:8080/Ecommerce_Web/login-google&response_type=code&client_id=524025208769-5qnkl0hima275idgajn63hhdo7i3hfeb.apps.googleusercontent.com&approval_prompt=force"
						class="google">
					<img src="https://img.icons8.com/color/16/000000/google-logo.png" alt="Google Logo"/>
					<span>Login with Google</span>
				</a>
			</div>

		</div>
	</div>
</section>
</body>
</html>