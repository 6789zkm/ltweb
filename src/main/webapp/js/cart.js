// Hàm cập nhật tổng tiền
function updateTotal() {
	let total = 0;
	const items = document.querySelectorAll('.select-item');

	// Duyệt qua tất cả các checkbox và tính tổng cho các sản phẩm được chọn
	items.forEach(item => {
		if (item.checked) {
			total += parseInt(item.getAttribute('data-price'), 10);
		}
	});

	// Cập nhật tổng tiền vào phần tử HTML
	document.getElementById('totalPrice').innerText = total.toLocaleString() + ' đ';
}

function checkOut() {
	console.log("Checking login status..."); // Debug
	// Tạo mảng để lưu trữ các cartId đã chọn
	const selectedCartIds = [];

	// Lấy tất cả các checkbox của các sản phẩm
	const checkboxes = document.querySelectorAll(".select-item");

	// Lặp qua các checkbox
	checkboxes.forEach((checkbox) => {
		if (checkbox.checked) {
			const cartId = checkbox.closest('.cart-item').getAttribute('data-cart-id');
			selectedCartIds.push(cartId);
		}
	});

	// Kiểm tra xem có sản phẩm nào được chọn không
	if (selectedCartIds.length === 0) {
		alert("Vui lòng chọn ít nhất một sản phẩm để đặt hàng.");
		return;
	}

	// Mã hóa selectedCartIds
	const encodedSelectedCartIds = encodeURIComponent(JSON.stringify(selectedCartIds));

	// URL gọi AJAX
	const url = window.contextPath + "/processCheckout?selectedCartIds=" + encodedSelectedCartIds;
	console.log("Fetching URL:", url); // Debug

	// Gửi yêu cầu AJAX đến servlet /processCheckout
	fetch(url)
		.then(response => {
			if (!response.ok) {
				throw new Error("Network response was not ok: " + response.status);
			}
			return response.json();
		})
		.then(data => {
			console.log("Response received:", data); // Debug
			if (data.status === "not_logged_in") {
				console.log("Redirecting to:", data.redirect); // Debug
				// Chưa đăng nhập, chuyển hướng đến trang đăng nhập
				localStorage.setItem("selectedCartIds", JSON.stringify(selectedCartIds));
				window.location.href = data.redirect;
			} else if (data.status === "logged_in") {
				console.log("Performing checkout with selectedCartIds:", selectedCartIds); // Debug
				// Đã đăng nhập, gọi logic checkout
				performCheckout(selectedCartIds);
			} else {
				console.error("Unexpected status:", data.status);
				alert("Đã có lỗi xảy ra, vui lòng thử lại.");
			}
		})
		.catch(error => {
			console.error("Fetch error:", error);
			alert("Đã có lỗi xảy ra khi kiểm tra trạng thái đăng nhập, vui lòng thử lại.");
		});
}

// Hàm thực hiện logic checkout
function performCheckout(selectedCartIds) {
	console.log("Performing checkout with cart IDs:", selectedCartIds); // Debug
	// Lưu danh sách cartId vào localStorage để khôi phục sau khi đăng nhập
	localStorage.setItem("selectedCartIds", JSON.stringify(selectedCartIds));

	// Mã hóa selectedCartIds dưới dạng JSON và encodeURIComponent
	const encodedSelectedCartIds = encodeURIComponent(JSON.stringify(selectedCartIds));

	// Chuyển hướng với dữ liệu đã mã hóa
	window.location.href = window.contextPath + "/checkout?selectedCartIds=" + encodedSelectedCartIds;
}

// Tự động chọn các checkbox nếu có trong localStorage hoặc query string
window.onload = function() {
	const urlParams = new URLSearchParams(window.location.search);
	const selectedCartIdsFromUrl = urlParams.get("selectedCartIds");
	let selectedCartIds = [];

	if (selectedCartIdsFromUrl) {
		selectedCartIds = JSON.parse(decodeURIComponent(selectedCartIdsFromUrl));
		localStorage.setItem("selectedCartIds", JSON.stringify(selectedCartIds));
	} else {
		selectedCartIds = JSON.parse(localStorage.getItem("selectedCartIds")) || [];
	}

	const checkboxes = document.querySelectorAll(".select-item");
	checkboxes.forEach((checkbox) => {
		const cartId = checkbox.closest('.cart-item').getAttribute('data-cart-id');
		if (selectedCartIds.includes(cartId)) {
			checkbox.checked = true;
		}
	});

	if (selectedCartIdsFromUrl) {
		localStorage.removeItem("selectedCartIds");
	}
	updateTotal();
};

// Hàm để chọn/bỏ chọn tất cả sản phẩm
function toggleSelectAll(selectAllCheckbox) {
	const items = document.querySelectorAll('.select-item');

	// Đặt trạng thái của tất cả các checkbox theo trạng thái của checkbox "Chọn tất cả"
	items.forEach(item => item.checked = selectAllCheckbox.checked);

	// Cập nhật tổng tiền sau khi chọn/bỏ chọn tất cả
	updateTotal();
}

// Hàm để kiểm tra và cập nhật trạng thái checkbox "Chọn tất cả"
function updateSelectAllStatus() {
	const items = document.querySelectorAll('.select-item');
	const selectAllCheckbox = document.getElementById('selectAll');

	// Kiểm tra xem tất cả các sản phẩm có được chọn hay không
	const allSelected = Array.from(items).every(item => item.checked);

	// Nếu tất cả các sản phẩm đều được chọn thì "Chọn tất cả" sẽ được chọn, ngược lại bỏ chọn
	selectAllCheckbox.checked = allSelected;
}

// Gọi hàm toggleSelectAll khi trang tải để kích hoạt chọn tất cả
document.addEventListener('DOMContentLoaded', function() {
	// Khởi động với trạng thái "Chọn tất cả" đã được chọn
	toggleSelectAll(document.getElementById('selectAll'));

	// Lắng nghe sự kiện thay đổi của các checkbox sản phẩm để cập nhật "Chọn tất cả"
	const items = document.querySelectorAll('.select-item');
	items.forEach(item => {
		item.addEventListener('change', updateSelectAllStatus);
	});
});

function closeModal() {
	const modal = document.getElementById('deleteConfirmationModal');
	const backdrop = document.querySelector('.modal-backdrop');

	// Loại bỏ lớp 'show' của modal và ẩn modal
	modal.classList.remove('show');
	modal.style.display = 'none';
	modal.setAttribute('aria-hidden', 'true');
	modal.setAttribute('aria-modal', 'false');

	// Xóa phần nền đen (modal-backdrop)
	if (backdrop) {
		backdrop.remove();
	}
}

function openModal() {
	const modal = document.getElementById('deleteConfirmationModal');

	// Kiểm tra nếu modal-backdrop chưa tồn tại thì tạo mới
	let backdrop = document.querySelector('.modal-backdrop');
	if (!backdrop) {
		backdrop = document.createElement('div');
		backdrop.classList.add('modal-backdrop', 'fade', 'show');
		document.body.appendChild(backdrop);
	}

	modal.classList.add('show');
	modal.style.display = 'block';
	modal.setAttribute('aria-hidden', 'false');
	modal.setAttribute('aria-modal', 'true');
}

function changeQuantity(change, inputId) {
	var quantityInput = document.getElementById(inputId);
	var currentQuantity = parseInt(quantityInput.value);
	var cartId = inputId.split('_')[1];
	console.log('quantityInput: ' + currentQuantity);

	if (!isNaN(currentQuantity)) {
		var newQuantity = currentQuantity + change;

		if (newQuantity === 0) {
			// Lưu trữ cartId để sử dụng khi người dùng xác nhận xóa
			document.getElementById('confirmDeleteButton').setAttribute('data-cart-id', cartId);
			// Hiển thị modal xác nhận xóa
			openModal();
		} else if (newQuantity > 0) {
			quantityInput.value = newQuantity;
			window.location.href = window.contextPath + '/cartdetail?action=update&quantity=' + newQuantity + '&cartId=' + cartId;
		}
	}
}

function deleteInCart(inputId) {
	var cartId = inputId.split('_')[1];
	document.getElementById('confirmDeleteButton').setAttribute('data-cart-id', cartId);
	openModal();
}

function confirmDelete() {
	// Lấy cartId từ nút xác nhận xóa
	var cartId = document.getElementById('confirmDeleteButton').getAttribute('data-cart-id');

	// Lấy URL hiện tại và mã hóa nó để redirect
	var currentUrl = window.location.href;
	var encodedUrl = encodeURIComponent(currentUrl);

	// Thực hiện điều hướng đến hành động xóa
	window.location.href = window.contextPath + '/cartdetail?action=remove&cartId=' + cartId + '&redirectUrl=' + encodedUrl;
}