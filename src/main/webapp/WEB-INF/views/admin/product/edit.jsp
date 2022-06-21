<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form class="m-5 needs-validation" novalidate="novalidate"
	action="/sach-tieng-anh/update?id=${product.id }" method="post">
	<div class="mb-3">
		<label>Tên sản phẩm</label> <input autocomplete="off" type="text"
			class="form-control" value="${product.tenSach }" name="tenSach"
			required="required">
		<div class="invalid-feedback">Vui lòng nhập tên sản phẩm!</div>
	</div>
	<div class="mb-3">
		<label>Thể loại</label> <select class="form-select" name="theLoai"
			aria-label="Default select example">
			<option disabled>Chọn thể loại</option>
			<option ${product.theLoai==Listening?"selected":"" }
				value="Listening">Listening</option>
			<option ${product.theLoai=='Speaking'?"selected":"" }
				value="Speaking">Speaking</option>
			<option ${product.theLoai=='Writing'?"selected":"" } value="Writing">Writing</option>
			<option ${product.theLoai=='Reading'?"selected":"" } value="Reading">Reading</option>
			<option ${product.theLoai=='Phonics'?"selected":"" } value="Phonics">Phonics</option>
			<option ${product.theLoai=='History'?"selected":"" } value="History">History</option>
			<option ${product.theLoai=='Grammar'?"selected":"" } value="Grammar">Grammar</option>
			<option ${product.theLoai=='Mathematics'?"selected":"" }
				value="Mathematics">Mathematics</option>
		</select>
	</div>

	<div class="mb-3">
		<label>Cấp độ</label> <select class="form-select" name="capDo"
			aria-label="Default select example">
			<option disabled>Chọn cấp độ</option>
			<option ${product.capDo=='Starters'?"selected":"" } value="Starters">Starters</option>
			<option ${product.capDo=='Movers'?"selected":"" } value="Movers">Movers</option>
			<option ${product.capDo=='Flyers'?"selected":"" } value="Flyers">Flyers</option>
			<option ${product.capDo=='A2'?"selected":"" } value="A2">A2</option>
			<option ${product.capDo=='B1'?"selected":"" } value="B1">B1</option>
			<option ${product.capDo=='B2'?"selected":"" } value="B2">B2</option>
			<option ${product.capDo=='C1'?"selected":"" } value="C1">C1</option>
			<option ${product.capDo=='C2'?"selected":"" } value="C2">C2</option>
		</select>
	</div>
	<div class="mb-3">
		<label>Số trang</label> <input autocomplete="off" type="text"
			name="soTrang" value="${product.soTrang }" class="form-control"
			required="required">
		<div class="invalid-feedback">Vui lòng nhập số trang!</div>
	</div>
	<div class="mb-3">
		<label>Số lượng</label> <input autocomplete="off" type="text"
			name="soLuong" value="${product.soLuong }" class="form-control"
			required="required">
		<div class="invalid-feedback">Vui lòng nhập số lượng!</div>
	</div>

	<div class="mb-3">
		<label>Giá tiền</label> <input autocomplete="off" type="text"
			name="gia" value="${product.gia }" class="form-control"
			required="required">
		<div class="invalid-feedback">Vui lòng nhập giá tiền!</div>
	</div>

	<div class="mb-3">
		<label>Hình ảnh</label> <input autocomplete="off" type="file"
			required="required" name="hinhAnh" class="form-control">
		<div class="invalid-feedback">Vui lòng chọn hình ảnh!</div>
	</div>
	<button type="button" class="btn btn-primary"
		data-bs-target="#exampleModal" data-bs-toggle="modal">Chỉnh
		sửa sản phẩm</button>
	<a href="/sach-tieng-anh/index"><button type="button"
			class="btn btn-success">Danh sách sản phẩm</button></a>
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn
						muốn sửa sản phẩm?</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Sản phẩm mới sẽ được lưu vào danh sách
					sản phẩm</div>
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