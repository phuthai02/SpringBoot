<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form class="m-5 needs-validation" novalidate="novalidate"
	action="/nguoi-dung/update?id=${u.id }" method="post">
	<div class="mb-3">
		<label>Email</label> <input value="${u.email }" autocomplete="off"
			type="text" class="form-control" name="email" required="required">
		<div class="invalid-feedback">Vui lòng nhập email!</div>
	</div>
	<div class="mb-3">
		<label>Mật khẩu</label> <input value="${u.matkhau }"
			required="required" autocomplete="off" type="password"
			class="form-control" name="matkhau">
		<div class="invalid-feedback">Vui lòng nhập mật khẩu!</div>
	</div>
	<div class="mb-3">
		<label>Họ tên</label> <input value="${u.hoten }" autocomplete="off"
			type="text" class="form-control" name="hoten" required="required">
		<div class="invalid-feedback">Vui lòng nhập họ tên!</div>
	</div>
	<div class="mb-3">
		<label>Giới tính</label> <br> <input ${u.gioitinh?'checked':'' }
			autocomplete="off" type="radio" class="form-check-input" id="nam"
			value="1" name="gioitinh"> <label for="nam">Nam</label> <input
			autocomplete="off" type="radio" ${u.gioitinh?'':'checked' }
			class="form-check-input" id="nu" value="0" name="gioitinh"> <label
			for="nu">Nữ</label>

	</div>
	<div class="mb-3">
		<label>Địa chỉ</label> <input autocomplete="off" type="text"
			value="${u.diachi }" class="form-control" name="diachi"
			required="required">
		<div class="invalid-feedback">Vui lòng nhập địa chỉ!</div>
	</div>
	<div class="mb-3">
		<label>Hình ảnh</label> <input autocomplete="off" type="file"
			value="${u.hinhanh }" class="form-control" name="hinhanh"
			required="required">
		<div class="invalid-feedback">Vui lòng nhập hình ảnh!</div>
	</div>
	<div class="mb-3">
		<label>Vai trò</label> <select class="form-select" name="vaitro"
			aria-label="Default select example">
			<option disabled>Chọn vai trò</option>
			<option ${u.vaitro?'selected':'' } value="1">Quản trị</option>
			<option ${u.vaitro?'':'selected' } value="0">Người dùng</option>
		</select>
	</div>

	<button type="button" data-bs-target="#exampleModal"
		data-bs-toggle="modal" class="btn btn-primary">Chỉnh sửa
		người dùng</button>
	<a href="/nguoi-dung/index">
		<button type="button" class="btn btn-success">Danh sách người
			dùng</button>
	</a>
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn
						muốn sửa người dùng?</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Người dùng mới sẽ được lưu vào danh
					sách người dùng</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Hủy</button>
					<button type="submit" data-bs-dismiss="modal"
						class="btn btn-primary">Sửa</button>
				</div>
			</div>
		</div>
	</div>
</form>