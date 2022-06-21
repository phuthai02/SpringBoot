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
<c:if test="${!empty sessionScope.user and sessionScope.user.vaitro}">
	<form class="m-5 needs-validation" action="/sach-tieng-anh/store"
		method="post" novalidate="novalidate">
		<div class="mb-3 col-12">
			<label for="tenSach">Tên sản phẩm</label> <input type="text"
				name="tenSach" class="form-control" id="tenSach" required>
			<div class="invalid-feedback">Vui lòng nhập tên sản phẩm!</div>
		</div>
		<div class="mb-3">
			<label>Thể loại</label> <select class="form-select" name="theLoai"
				aria-label="Default select example" required="required">
				<option selected="selected" disabled>Chọn thể loại</option>
				<option value="Listening">Listening</option>
				<option value="Speaking">Speaking</option>
				<option value="Writing">Writing</option>
				<option value="Reading">Reading</option>
				<option value="Phonics">Phonics</option>
				<option value="History">History</option>
				<option value="Grammar">Grammar</option>
				<option value="Mathematics">Mathematics</option>
			</select>
			<div class="invalid-feedback">Vui lòng nhập thể loại!</div>
		</div>

		<div class="mb-3">
			<label>Cấp độ</label> <select class="form-select" name="capDo"
				aria-label="Default select example" required="required">
				<option selected="selected" disabled>Chọn cấp độ</option>
				<option value="Starters">Starters</option>
				<option value="Movers">Movers</option>
				<option value="Flyers">Flyers</option>
				<option value="A2">A2</option>
				<option value="B1">B1</option>
				<option value="B2">B2</option>
				<option value="C1">C1</option>
				<option value="C2">C2</option>
			</select>
			<div class="invalid-feedback">Vui lòng chọn cấp độ!</div>
		</div>
		<div class="mb-3">
			<label>Số trang</label> <input autocomplete="off" type="text"
				name="soTrang" class="form-control" required>
			<div class="invalid-feedback">Vui lòng nhập số trang!</div>
		</div>
		<div class="mb-3">
			<label>Số lượng</label> <input autocomplete="off" type="text"
				name="soLuong" class="form-control" required>
			<div class="invalid-feedback">Vui lòng nhập số lượng!</div>
		</div>
		<div class="mb-3">
			<label>Giá tiền</label> <input autocomplete="off" type="text"
				name="gia" class="form-control" required="required">
			<div class="invalid-feedback">Vui lòng nhập giá tiền!</div>
		</div>

		<div class="mb-3">
			<label>Hình ảnh</label> <input autocomplete="off" type="file"
				name="hinhAnh" class="form-control" required="required">
			<div class="invalid-feedback">Vui lòng chọn hình ảnh!</div>
		</div>
		<button type="button" data-bs-toggle="modal"
			data-bs-target="#exampleModal" class="btn btn-primary">Thêm
			sản phẩm</button>
		<a href="/sach-tieng-anh/index"><button type="button"
				class="btn btn-success">Danh sách sản phẩm</button></a>
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn
							muốn thêm sản phẩm</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">Sản phẩm sẽ được thêm vào danh sách
						sản phẩm</div>
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