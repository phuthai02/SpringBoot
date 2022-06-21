<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:if test="${empty sessionScope.user or !sessionScope.user.vaitro }">
	<section
		class="section error-404 min-vh-100 d-flex flex-column align-items-center justify-content-center">
		<h1>404</h1>
		<h2>The page you are looking for doesn't exist.</h2>
		<a class="btn" href="/sach-tieng-anh">Trở về trang chủ</a> <img
			src="/assets/img/not-found.svg" class="img-fluid py-5"
			alt="Page Not Found">
	</section>
</c:if>
<c:if test="${!empty sessionScope.user and sessionScope.user.vaitro }">
	<form class="m-5 needs-validation" novalidate="novalidate"
		action="/nguoi-dung/store" method="post">
		<div class="mb-3">
			<label>Email</label> <input autocomplete="off" type="text"
				class="form-control" name="email" required="required">
			<div class="invalid-feedback">Vui lòng nhập email!</div>
		</div>
		<div class="mb-3">
			<label>Mật khẩu</label> <input autocomplete="off" type="password"
				class="form-control" name="matkhau" required="required">
			<div class="invalid-feedback">Vui lòng nhập mật khẩu!</div>
		</div>
		<div class="mb-3">
			<label>Họ tên</label> <input autocomplete="off" type="text"
				class="form-control" name="hoten" required="required">
			<div class="invalid-feedback">Vui lòng nhập họ tên!</div>
		</div>
		<div class="mb-3">
			<label>Giới tính</label> <br> <input autocomplete="off"
				type="radio" class="form-check-input" id="nam" value="1" checked
				name="gioitinh"> <label for="nam">Nam</label> <input
				autocomplete="off" type="radio" class="form-check-input" id="nu"
				value="0" name="gioitinh"> <label for="nu">Nữ</label>

		</div>
		<div class="mb-3">
			<label>Địa chỉ</label> <input autocomplete="off" type="text"
				class="form-control" name="diachi" required="required">
			<div class="invalid-feedback">Vui lòng nhập địa chỉ!</div>
		</div>
		<div class="mb-3">
			<label>Hình ảnh</label> <input autocomplete="off" type="file"
				class="form-control" name="hinhanh" required="required">
			<div class="invalid-feedback">Vui lòng nhập hình ảnh!</div>
		</div>
		<div class="mb-3">
			<label>Vai trò</label> <select class="form-select" name="vaitro"
				aria-label="Default select example">
				<option selected="selected" disabled>Chọn vai trò</option>
				<option value="1">Quản trị</option>
				<option value="0">Người dùng</option>
			</select>
		</div>

		<button type="button" class="btn btn-primary"
			data-bs-target="#exampleModal" data-bs-toggle="modal">Thêm
			người dùng</button>
		<a href="/nguoi-dung/index">
			<button type="button" class="btn btn-success">Danh sách
				người dùng</button>
		</a>
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn
							muốn thêm người dùng?</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">Người dùng sẽ được thêm vào danh sách
						người dùng</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Hủy</button>
						<button type="submit" data-bs-dismiss="modal"
							class="btn btn-primary">Thêm</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</c:if>