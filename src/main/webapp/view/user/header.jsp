<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/Navbar.css">
	<link rel="stylesheet" href="css/SearchBar.css">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="adding/bootstrap/boostrap.min.css">

	<!-- Thêm link jQuery (phải tải trước Bootstrap JS) -->
	<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="adding/bootstrap/bootstrap.bundle.min.js"></script>
	<!-- Thêm link jQuery -->

	<!-- js  -->

</head>
<body>
<div class="hero" style="display: flex;">
	<div class="nav-header">
		<a href="home"
		   style="text-decoration: none; color: inherit; z-index: 3; margin-top: 3.5rem; position: fixed; z-index: 9999;">
			<p style="color: white;">ECOMMERCE</p>
		</a>
	</div>
	<div class="shop-navbar">
		<ul class="nav-menu">
			<!-- render data  -->
		</ul>

		<div class="nav-login-cart">
			<!-- Search bar -->
			<div class="search-bar"
				 style="margin: 0.5px; border: none; border-bottom: 2px solid white; outline: none; background-color: transparent; display: flex; align-items: center;">
					<span style="font-size: 1rem; color: white;"> <img
							src="./img/search.png" alt="" style="height: 20px;">
					</span> <input type="text" id="searchInput" placeholder="Tìm kiếm"
								   style="background: transparent; outline: none; border: none; color: white;">
			</div>

			<!-- User icon and hidden login/register options -->
			<div class="user-menu">
					<span class="user-icon"
						  style="color: white; font-size: 2rem; cursor: pointer;"> <img
							src="./img/avatar.png" alt=""
							style="height: 30px; margin-top: 5%;">
					</span>
				<div class="user-options" style="display: none;">
					<c:choose>
						<c:when test="${not empty user}">
							<!-- Nút Profile và Logout -->
							<a href = "<%=request.getContextPath()%>/profile"><button
									style="color: white; width: 100%; height: 40px; margin-bottom: 0.5rem; font-size: 15px; background-color: black;">
								Profile</button></a>
							<a href = "${pageContext.request.contextPath}/view/user/forgot_password.jsp"><button
									style="color: white; width: 100%; height: 40px; margin-bottom: 0.5rem; font-size: 15px; background-color: black;">
								Đổi mật khẩu</button></a>
							<a href = "<%=request.getContextPath()%>/historyOrder"><button
									style="color: white; width: 100%; height: 40px; margin-bottom: 0.5rem; font-size: 15px; background-color: black;">
								Lịch sử mua hàng</button></a>
							<a href = "<c:url value='/logout' />"><button
									style="color: black; width: 100%; height: 40px; font-size: 15px; background-color: white; border: 1px solid black">
								Logout</button></a>

						</c:when>
						<c:otherwise>
							<!-- Nút Đăng nhập và Đăng ký -->
							<a href = "<%=request.getContextPath()%>/view/user/login.jsp"><button
									style="color: white; width: 100%; height: 40px; margin-bottom: 0.5rem; font-size: 15px; background-color: black;">
								Đăng nhập</button></a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<!-- Heart icon -->
			<div class="heart">
					<span style="color: white; font-size: 2rem; cursor: pointer;"><img
							src="./img/heart.png" alt="" style="height: 25px; opacity: 1;"></span>
			</div>

			<!-- Cart icon -->
			<div class="cart">
				<a href="#" data-bs-toggle="offcanvas"
				   data-bs-target="#cartOffcanvas"> <span
						style="color: white; font-size: 2rem; cursor: pointer;"> <img
						src="./img/shopping-cart.png" alt=""
						style="height: 30px; padding-left: 15px;">
					</span>
				</a>
			</div>

			<!-- Offcanvas (cart frame) náº±m bÃªn pháº£i -->
			<div class="offcanvas offcanvas-end" tabindex="-1"
				 id="cartOffcanvas" aria-labelledby="cartOffcanvasLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title " id="cartOffcanvasLabel">Giỏ hàng
						của tôi</h5>
					<button type="button" class="btn-close"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>

				<div class="offcanvas-body">
					<!-- Cart Item -->
					<!-- Rednder dữ liệu -->
				</div>

				<div class="offcanvas-footer">
					<button class="view-cart-btn" onclick="redirectCartDetail()">Xem
						giỏ hàng</button>
				</div>
			</div>
			<div class="nav-cart-count"></div>
		</div>
	</div>
	<!-- Navbar placeholder -->
</div>


<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		// Trigger Ajax call on page load
		$.ajax({
			url: "header",
			method: "GET",
			success: function(response) {
				console.log("Header response: ", response);
				renderDataDropListCategoryHeader(response.dropListCategory);
				renderDataQuantityProductHeader(response.quantityProduct);
				renderDataListCartDetailHeader(response.listCartDetail);
			},
			error: function(xhr, status, error) {
				console.error("Error fetching header data: ", error);
			}
		});
	});

	function renderDataDropListCategoryHeader(dropListCategory) {
		console.log("dropListCategory: ", dropListCategory);
		if (!dropListCategory) {
			console.error("dropListCategory is null or undefined");
			return;
		}

		const navMenu = document.querySelector('.nav-menu');
		navMenu.innerHTML = '';

		for (const categoryKey in dropListCategory) {
			if (dropListCategory.hasOwnProperty(categoryKey)) {
				const navItem = document.createElement('li');
				navItem.className = 'nav-item';

				const categoryLink = document.createElement('a');
				categoryLink.href = `gender?gender=${categoryKey}`;
				categoryLink.style.textDecoration = 'none';
				categoryLink.style.color = 'inherit';
				categoryLink.innerText = categoryKey.toUpperCase();

				navItem.appendChild(categoryLink);

				const hr = document.createElement('hr');
				navItem.appendChild(hr);

				const subcategoriesDiv = document.createElement('div');
				subcategoriesDiv.className = 'subcategories';
				subcategoriesDiv.style.margin = '0';
				subcategoriesDiv.style.width = '20rem';

				const subcategories = dropListCategory[categoryKey];
				for (const subCategoryKey in subcategories) {
					if (subcategories.hasOwnProperty(subCategoryKey)) {
						const subCategoryWrapper = document.createElement('div');
						subCategoryWrapper.style.display = 'flex';
						subCategoryWrapper.style.alignItems = 'center';

						const subCategoryParagraph = document.createElement('p');
						subCategoryParagraph.style.margin = '0';
						subCategoryParagraph.innerText = subCategoryKey.toUpperCase();
						subCategoryParagraph.style.cursor = 'pointer';
						subCategoryParagraph.onclick = () => {
							window.location.href = 'category?category=' + subCategoryKey;
						};

						const toggleSpan = document.createElement('span');
						toggleSpan.style.color = 'red';
						toggleSpan.style.marginLeft = '8px';
						toggleSpan.innerText = ' + ';
						toggleSpan.style.cursor = 'pointer';
						toggleSpan.onclick = () => toggleSubcategory(subCategoryKey);

						subCategoryWrapper.appendChild(subCategoryParagraph);
						subCategoryWrapper.appendChild(toggleSpan);

						subcategoriesDiv.appendChild(subCategoryWrapper);

						const extraSubcategoriesDiv = document.createElement('div');
						extraSubcategoriesDiv.id = `subcategory${subCategoryKey}-extra`;
						extraSubcategoriesDiv.className = 'subcategory-extra';
						extraSubcategoriesDiv.style.display = 'none';
						extraSubcategoriesDiv.style.marginLeft = '8%';

						const extraSubCategories = subcategories[subCategoryKey];
						extraSubCategories.forEach(extraSubCategory => {
							const extraSubCategoryLink = document.createElement('a');
							extraSubCategoryLink.href = '#';
							extraSubCategoryLink.style.textDecoration = 'none';

							const extraSubCategoryParagraph = document.createElement('p');
							extraSubCategoryParagraph.innerText = extraSubCategory.toUpperCase();
							extraSubCategoryParagraph.onclick = () => {
								window.location.href = 'subcategory?subCategory=' + extraSubCategory;
							};
							extraSubCategoryLink.appendChild(extraSubCategoryParagraph);

							extraSubcategoriesDiv.appendChild(extraSubCategoryLink);
						});

						subcategoriesDiv.appendChild(extraSubcategoriesDiv);
					}
				}

				navItem.appendChild(subcategoriesDiv);

				const separator = document.createElement('span');
				separator.style.fontSize = '2rem';
				separator.style.marginBottom = '2%';
				separator.innerText = '|';

				navMenu.appendChild(navItem);
				navMenu.appendChild(separator);
			}
		}
	}

	function renderDataQuantityProductHeader(quantityProduct) {
		console.log("quantityProduct: ", quantityProduct);
		const navCartCount = document.querySelector('.nav-cart-count');
		navCartCount.innerHTML = '';
		navCartCount.innerText = quantityProduct || 0;
	}

	function renderDataListCartDetailHeader(listCartDetail) {
		console.log("listCartDetail: ", listCartDetail);
		const offcanvasBody = document.querySelector('.offcanvas-body');
		offcanvasBody.innerHTML = '';

		if (!listCartDetail || listCartDetail.length === 0) {
			offcanvasBody.innerHTML = `
                    <div style="height: 120px; display: flex; align-items: center; justify-content: center; flex-direction: column; padding: 0px 23px; text-align: center;">
                        Bạn chưa có sản phẩm nào trong giỏ hàng
                    </div>
                `;
			return;
		}

		listCartDetail.forEach(item => {
			const cartItem = document.createElement('div');
			cartItem.className = 'cart-item';

			const cartItemImage = document.createElement('div');
			cartItemImage.className = 'cart-item-image';
			const img = document.createElement('img');
			img.src = item.image;
			img.alt = 'Product Image';
			cartItemImage.appendChild(img);

			const cartItemDetails = document.createElement('div');
			cartItemDetails.className = 'cart-item-details';

			const name = document.createElement('p');
			name.className = 'cart-item-name';
			name.innerText = item.name;

			const description = document.createElement('p');
			description.className = 'cart-item-description';
			description.innerText = item.color + ' , ' + item.size;

			const cartItemActions = document.createElement('div');
			cartItemActions.className = 'cart-item-actions';

			const quantity = document.createElement('span');
			quantity.className = 'cart-item-quantity';
			quantity.innerText = 'SL: ' + item.quantity;

			const removeBtn = document.createElement('button');
			removeBtn.className = 'remove-item-btn';

			const removeIcon = document.createElement('img');
			removeIcon.src = 'img/remove.png';
			removeIcon.alt = 'Remove Icon';
			removeBtn.appendChild(removeIcon);

			removeBtn.onclick = function() {
				var currentUrl = window.location.href;
				var encodedUrl = encodeURIComponent(currentUrl);
				window.location.href = 'cartdetail?action=remove&cartId=' + item.cartId + '&redirectUrl=' + encodedUrl;
			};

			cartItemActions.appendChild(quantity);
			cartItemActions.appendChild(removeBtn);

			cartItemDetails.appendChild(name);
			cartItemDetails.appendChild(description);
			cartItemDetails.appendChild(cartItemActions);

			const cartItemPrice = document.createElement('div');
			cartItemPrice.className = 'cart-item-price';
			cartItemPrice.innerText = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(item.price);

			cartItem.appendChild(cartItemImage);
			cartItem.appendChild(cartItemDetails);
			cartItem.appendChild(cartItemPrice);

			offcanvasBody.appendChild(cartItem);
		});
	}

	function toggleSubcategory(subcategoryId) {
		const subcategory = document.getElementById(`subcategory${subcategoryId}-extra`);
		if (subcategory) {
			subcategory.style.display = (subcategory.style.display === "none" ? "block" : "none");
		}
	}

	function redirectCartDetail() {
		window.location.href = 'cartdetail?action=get';
	}
</script>


<script src="js/navbar.js"></script>





</body>
</html>