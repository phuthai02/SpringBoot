<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Phú Thái - English Book</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/assets/img/logo.png" rel="icon">
<link href="/assets/img/logo.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="/assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="/assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/assets/css/style.css" rel="stylesheet">
</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="/sach-tieng-anh" class="logo d-flex align-items-center">
				<img src="/assets/img/logo.png" alt=""> <span
				class="d-none d-lg-block">PhuThai</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->

		<div class="search-bar">
			<form class="search-form d-flex align-items-center" method="POST"
				action="#">
				<input type="text" name="query" placeholder="Search"
					title="Enter search keyword">
				<button type="submit" title="Search">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>
		<!-- End Search Bar -->
		<c:if test="${!empty user }">

			<nav class="header-nav ms-auto">
				<ul class="d-flex align-items-center">

					<li class="nav-item d-block d-lg-none"><a
						class="nav-link nav-icon search-bar-toggle " href="#"> <i
							class="bi bi-search"></i>
					</a></li>
					<!-- End Search Icon-->

					<li class="nav-item dropdown"><a class="nav-link nav-icon"
						href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell"></i>
							<span class="badge bg-danger badge-number">4</span>
					</a> <!-- End Notification Icon -->

						<ul
							class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
							<li class="dropdown-header">You have 4 new notifications <a
								href="#"><span
									class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
							</li>
							<li>
								<hr class="dropdown-divider">
							</li>

							<li class="notification-item"><i
								class="bi bi-exclamation-circle text-warning"></i>
								<div>
									<h4>Lorem Ipsum</h4>
									<p>Quae dolorem earum veritatis oditseno</p>
									<p>30 min. ago</p>
								</div></li>

							<li>
								<hr class="dropdown-divider">
							</li>

							<li class="notification-item"><i
								class="bi bi-x-circle text-danger"></i>
								<div>
									<h4>Atque rerum nesciunt</h4>
									<p>Quae dolorem earum veritatis oditseno</p>
									<p>1 hr. ago</p>
								</div></li>

							<li>
								<hr class="dropdown-divider">
							</li>

							<li class="notification-item"><i
								class="bi bi-check-circle text-success"></i>
								<div>
									<h4>Sit rerum fuga</h4>
									<p>Quae dolorem earum veritatis oditseno</p>
									<p>2 hrs. ago</p>
								</div></li>

							<li>
								<hr class="dropdown-divider">
							</li>

							<li class="notification-item"><i
								class="bi bi-info-circle text-primary"></i>
								<div>
									<h4>Dicta reprehenderit</h4>
									<p>Quae dolorem earum veritatis oditseno</p>
									<p>4 hrs. ago</p>
								</div></li>

							<li>
								<hr class="dropdown-divider">
							</li>
							<li class="dropdown-footer"><a href="#">Show all
									notifications</a></li>

						</ul> <!-- End Notification Dropdown Items --></li>
					<!-- End Notification Nav -->

					<li class="nav-item dropdown"><a class="nav-link nav-icon"
						href="#" data-bs-toggle="dropdown"> <i class="bi bi-cart"></i>
							<span class="badge bg-success badge-number">${sizeCarts }</span>
					</a> <!-- End Messages Icon -->

						<ul
							class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
							<li class="dropdown-header">Bạn có ${sizeCarts } sản phẩm <a
								href="/cart/index"><span
									class="badge rounded-pill bg-primary p-2 ms-2">Chi tiết</span></a>
							</li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<c:forEach var="c" items="${carts }" end="4">
								<li class="message-item"><a href="/cart/index"> <img
										src="/assets/images/${c.hinhanh }" alt="">
										<div>
											<h4>${c.tensanpham }</h4>
											<p>Số lượng: ${c.soluong }</p>
										</div>
								</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
							</c:forEach>
							<c:if test="${!empty carts }">
								<li class="dropdown-footer"><a href="/cart/index">Tổng
										tiền hàng: <fmt:setLocale value="en_US" /> <fmt:formatNumber
											value="${priceCarts}" /> đ
								</a></li>
							</c:if>
							<c:if test="${empty carts }">
								<li class="message-item"><a href="#">
										<h4>Giỏ hàng trống rỗng</h4>
								</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
							</c:if>


						</ul> <!-- End Messages Dropdown Items --></li>
					<!-- End Messages Nav -->

					<li class="nav-item dropdown pe-3"><a
						class="nav-link nav-profile d-flex align-items-center pe-0"
						href="#" data-bs-toggle="dropdown"> <img
							src="/assets/images/${sessionScope.user.hinhanh }" alt="Profile"
							class="rounded-circle"> <span
							class="d-none d-md-block dropdown-toggle ps-2">${sessionScope.user.hoten
												}</span>
					</a> <!-- End Profile Iamge Icon -->

						<ul
							class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
							<li class="dropdown-header">
								<h6>${sessionScope.user.hoten }</h6> <span>${sessionScope.user.vaitro?'Quản trị viên':'Người dùng' }</span>
							</li>
							<li>
								<hr class="dropdown-divider">
							</li>

							<li><a class="dropdown-item d-flex align-items-center"
								href="/profile"> <i class="bi bi-person"></i> <span>Thông
										tin cá nhân</span>
							</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>

							<li><a class="dropdown-item d-flex align-items-center"
								href="/profile"> <i class="bi bi-gear"></i> <span>Cài
										đặt tài khoản</span>
							</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>

							<li><a class="dropdown-item d-flex align-items-center"
								href="/contact"> <i class="bi bi-question-circle"></i> <span>Hỗ
										trợ</span>
							</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>

							<li><a class="dropdown-item d-flex align-items-center"
								href="/logout"> <i class="bi bi-box-arrow-right"></i> <span>Đăng
										xuất</span>
							</a></li>

						</ul> <!-- End Profile Dropdown Items --></li>
					<!-- End Profile Nav -->
				</ul>
			</nav>
		</c:if>
	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link collapsed"
				href="/sach-tieng-anh"> <i class="bi bi-grid"></i> <span>Trang
						chủ</span>
			</a></li>
			<!-- End Dashboard Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-menu-button-wide"></i><span>Quản lý sản phẩm</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="components-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="/sach-tieng-anh/create"> <i
							class="bi bi-circle"></i><span>Mới...</span>
					</a></li>
					<li><a href="/sach-tieng-anh/index""> <i
							class=" bi bi-circle"></i><span>Danh sách sản phẩm</span>
					</a></li>
				</ul></li>
			<!-- End Components Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>Quản lý người dùng</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="forms-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="/nguoi-dung/create"> <i class="bi bi-circle"></i><span>Mới...</span>
					</a></li>
					<li><a href="/nguoi-dung/index"> <i class="bi bi-circle"></i><span>Danh
								sách người dùng</span>
					</a></li>
				</ul></li>
			<!-- End Forms Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-layout-text-window-reverse"></i><span>Quản
						lý đơn hàng</span><i class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="tables-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="/order/ordermanager"> <i class="bi bi-circle"></i><span>Đơn
								hàng</span>
					</a></li>
					<li><a href="/cart/myorder"> <i class="bi bi-circle"></i><span>Đơn
								hàng của tôi</span>
					</a></li>
				</ul></li>
			<!-- End Tables Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-bar-chart"></i><span>Thống kê - phân tích</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="charts-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="/thong-ke/san-pham"> <i class="bi bi-circle"></i><span>Sản
								phẩm</span>
					</a></li>
					<li><a href="/thong-ke/doanh-so"> <i class="bi bi-circle"></i><span>Doanh
								số</span>
					</a></li>
				</ul></li>
			<!-- End Charts Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-gem"></i><span>Nâng cấp hệ thống</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="icons-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="icons-bootstrap.html"> <i
							class="bi bi-circle"></i><span>Bootstrap Icons</span>
					</a></li>
					<li><a href="icons-remix.html"> <i class="bi bi-circle"></i><span>Remix
								Icons</span>
					</a></li>
					<li><a href="icons-boxicons.html"> <i class="bi bi-circle"></i><span>Boxicons</span>
					</a></li>
				</ul></li>
			<!-- End Icons Nav -->

			<li class="nav-heading">Hoạt động</li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="/profile"> <i class="bi bi-person"></i> <span>Thông
						tin cá nhân</span>
			</a></li>
			<!-- End Profile Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed" href="/FAQ">
					<i class="bi bi-question-circle"></i> <span>F.A.Q</span>
			</a></li>
			<!-- End F.A.Q Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="/contact"> <i class="bi bi-envelope"></i> <span>Liên
						hệ</span>
			</a></li>
			<!-- End Contact Page Nav -->
			<c:if test="${empty user }">
				<li class="nav-item"><a class="nav-link collapsed"
					href="/register"> <i class="bi bi-card-list"></i> <span>Đăng
							ký</span>
				</a></li>
				<!-- End Register Page Nav -->

				<li class="nav-item"><a class="nav-link collapsed"
					href="/login"> <i class="bi bi-box-arrow-in-right"></i> <span>Đăng
							nhập</span>
				</a></li>
			</c:if>
		</ul>

	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">
		<c:if test="${ !empty sessionScope.message }">
			<div class="alert alert-success alert-dismissible fade show"
				role="alert">
				${ sessionScope.message }
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
			<c:remove var="message" scope="session" />
		</c:if>
		<c:if test="${ !empty sessionScope.error }">
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert">
				${ sessionScope.error }
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
			<c:remove var="error" scope="session" />
		</c:if>
		<div class="card">
			<div class="card-body" id="view">
				<jsp:include page="${view }"></jsp:include>
			</div>
		</div>
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="copyright">
			&copy; Copyright <strong><span>PhuThai</span></strong>. All Rights
			Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
			Designed by <a href="https://bootstrapmade.com/">ThaiDP</a>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->

	<script src="/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/vendor/chart.js/chart.min.js"></script>
	<script src="/assets/vendor/echarts/echarts.min.js"></script>
	<script src="/assets/vendor/quill/quill.min.js"></script>
	<script src="/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="/assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="/assets/js/main.js"></script>
	<script src="/assets/js/n2vw.min.js"></script>
	<script src="https://kit.fontawesome.com/ca0bfdb502.js"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		function upload() {
			document.getElementById("imgInput").click();
		}
		function change() {
			let url = document.getElementById("imgInput").value;
			let start = url.lastIndexOf("\\");
			document.getElementById("profileimg").src = "/assets/images/"
					+ url.substr(start + 1);
		}
		function remove() {
			document.getElementById("profileimg").src = "/assets/images/noname.jpg";
		}
		function add(uid, pid) {
			$.ajax({
				type : "POST",
				url : "/cart/add?nguoidungid=" + uid + "&sanphamid=" + pid
						+ "&soluong=1",
				success : function() {
					Swal.fire({
						position : 'top-end',
						icon : 'success',
						text : 'Đã thêm sản phẩm vào giỏ hàng',
						showConfirmButton : false,
						timer : 800,
						width : '400px',

					})
					setTimeout(function() {
						location.reload();
					}, 800);
				},
			});
		}
		function deletecart(uid, pid, sl) {
			$.ajax({
				type : "POST",
				url : "/cart/delete?nguoidungid=" + uid + "&sanphamid=" + pid
						+ "&soluong=" + sl,
				success : function() {
					location.reload();
				},
			});
		}
		function plus(uid, pid) {
			$.ajax({
				type : "POST",
				url : "/cart/plus?nguoidungid=" + uid + "&sanphamid=" + pid,
				success : function() {
					location.reload();
				},
			});
		}
		function sub(uid, pid) {
			$.ajax({
				type : "POST",
				url : "/cart/sub?nguoidungid=" + uid + "&sanphamid=" + pid,
				success : function() {
					location.reload();
				},
			});
		}
		function setAddress() {
			let hoten = document.getElementById("n1").value;
			let sdt = document.getElementById("n2").value;
			let diachi = document.getElementById("n3").value;
			$.ajax({
				type : "POST",
				url : "/address/set?hoten=" + hoten + "&sodienthoai=" + sdt
						+ "&diachi=" + diachi,
				success : function() {
					Swal.fire({
						position : 'top-end',
						icon : 'success',
						text : 'Đã đặt địa chỉ làm mặc định',
						showConfirmButton : false,
						timer : 800,
						width : '400px',
					})
				},
			});
		}
		function getAddress() {
			$.ajax({
				type : "GET",
				url : "/address/get",
				success : function(data) {
					document.getElementById('form-address').innerHTML = data;
				},
			});
		}
		function xacnhan() {
			let madonhang = document.getElementById("mdh").innerHTML;
			console.log(madonhang)
			$.ajax({
				type : "POST",
				url : "/order/xacnhan?madonhang=" + madonhang,
				success : function(data) {
					Swal.fire({
						position : 'top-end',
						icon : 'success',
						text : 'Đã xác nhận đơn hàng',
						showConfirmButton : false,
						timer : 800,
						width : '400px',
					})
					setTimeout(function() {
						location.reload();
					}, 800);
				},
			});
		}
		function tuchoi() {
			let madonhang = document.getElementById("mdh").innerHTML;
			console.log(madonhang)
			$.ajax({
				type : "POST",
				url : "/order/tuchoi?madonhang=" + madonhang,
				success : function(data) {
					Swal.fire({
						position : 'top-end',
						icon : 'error',
						text : 'Đã từ chối đơn hàng',
						showConfirmButton : false,
						timer : 800,
						width : '400px',
					})
					setTimeout(function() {
						location.reload();
					}, 800);
				},
			});
		}
		function selectAll() {
			var chkAll = document.getElementById("chkAll");
			var chk = document.getElementsByName("chk");
			if (chkAll.checked == true) {
				for (var i = 0; i < chk.length; i++) {
					chk[i].checked = true;
				}
			} else {
				for (var i = 0; i < chk.length; i++) {
					chk[i].checked = false;
				}
			}
			document.getElementsByClassName("chk")
		}
		function status(trangthai) {
			$.ajax({
				type : "POST",
				url : "/order/status?trangthai=" + trangthai,
				success : function(data) {
					console.log(data);
					document.getElementById('tableAll').innerHTML = data;
				},
			});
		}
		function addDetail(uid, pid) {
			let sld = document.getElementById("sld").value;
			console.log(sld);
			$.ajax({
				type : "POST",
				url : "/cart/add?nguoidungid=" + uid + "&sanphamid=" + pid
						+ "&soluong=" + sld,
				success : function() {
					Swal.fire({
						position : 'top-end',
						icon : 'success',
						text : 'Đã thêm sản phẩm vào giỏ hàng',
						showConfirmButton : false,
						timer : 800,
						width : '400px',

					})
					setTimeout(function() {
						location.reload();
					}, 800);
				},
			});
		}
		function tang(max) {
			let sld = document.getElementById("sld").value;
			if(sld < Number(max)){
				document.getElementById("sld").value = Number(sld) + 1;
			}
		}
		function validN(max){
			let sld = document.getElementById("sld").value;
			if(sld > Number(max)){
				document.getElementById("sld").value = max;
			}
		}
		function giam() {
			let sld = document.getElementById("sld").value;
			if(sld>0){
				document.getElementById("sld").value = Number(sld) - 1;
			}
		}
		function danhsach() {
			document.getElementById('table').hidden = false;
			document.getElementById('pieChart').hidden = true;
			document.getElementById('bieudo').hidden = false;
			document.getElementById('danhsach').hidden = true;
		}
		function bieudo() {
			document.getElementById('table').hidden = true;
			document.getElementById('pieChart').hidden = false;
			document.getElementById('bieudo').hidden = true;
			document.getElementById('danhsach').hidden = false;
		}
		function danhsach2() {
			document.getElementById('table2').hidden = false;
			document.getElementById('pieChart2').hidden = true;
			document.getElementById('bieudo2').hidden = false;
			document.getElementById('danhsach2').hidden = true;
		}
		function bieudo2() {
			document.getElementById('table2').hidden = true;
			document.getElementById('pieChart2').hidden = false;
			document.getElementById('bieudo2').hidden = true;
			document.getElementById('danhsach2').hidden = false;
		}
		function convert(value, label) {
			var converter = new n2vw();
			var result = document.getElementById(label);
			result.innerHTML = converter.getFullText(Number(value));
		}
	</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>