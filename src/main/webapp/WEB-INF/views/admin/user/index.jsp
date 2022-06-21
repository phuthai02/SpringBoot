<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:if test="${empty sessionScope.user or !sessionScope.user.vaitro}">
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
	<c:if test="${!empty users}">
		<nav class="navbar row navbar-expand-lg">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse d-flex justify-content-between"
					id="navbarSupportedContent">
					<form action="/nguoi-dung/find" method="get">
						<div class="input-group">
							<div class="col-xl">
								<select class="form-select" name="role">
									<option disabled="disabled" selected="selected">Vai
										trò</option>
									<option value="1">Quản trị</option>
									<option value="0">Người dùng</option>
								</select>
							</div>
							<div class="col-xl-7">
								<input type="text" class="form-control" name="name"
									aria-label="Nhập tên người dùng cần tìm...">
							</div>
							<button class="btn btn-success" type="submit">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</div>
					</form>
					<div class="text-center ms-5">
						<c:if test="${pageNumber>1 }">
							<a href="/nguoi-dung/first"><button class="btn">
									<i class="fa-solid fa-backward-step fs-4 text-danger"></i>
								</button></a>
							<a href="/nguoi-dung/previus"><button class="btn">
									<i class="fa-solid fa-angles-left fs-4 text-danger"></i>
								</button></a>
						</c:if>
						<label class="fs-4 text-danger fw-bold ms-2 me-2">${pageNumber }/${pageMax }</label>
						<c:if test="${pageNumber<pageMax }">
							<a href="/nguoi-dung/next">
								<button class="btn">
									<i class="fa-solid fa-angles-right fs-4 text-danger"></i>
								</button>
							</a>
							<a href="/nguoi-dung/last"><button class="btn">
									<i class="fa-solid fa-forward-step fs-4 text-danger"></i>
								</button></a>
						</c:if>
					</div>
					<form action="/nguoi-dung/deleteList" class="ms-5" method="get">
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Bạn có chắc
											chắn muốn xóa những người dùng đã chọn?</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Những người dùng đã chọn sẽ bị
										xóa vĩnh viễn khỏi danh sách người dùng</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Hủy</button>
										<button type="submit" data-bs-dismiss="modal"
											class="btn btn-primary">Xóa hết</button>
									</div>
								</div>
							</div>
						</div>
						<button type="button" data-bs-target="#exampleModal"
							data-bs-toggle="modal" class="btn btn-danger me-3">- Xóa
							tất cả</button>
						<a href="/nguoi-dung/create"><button type="button"
								class="btn btn-primary">+ Thêm người dùng</button></a>
				</div>
			</div>
		</nav>

		<table class="table">
			<thead>
				<tr>
					<th><input type="checkbox" onclick="selectAll()" id="chkAll"
						class="form-check-input"></th>
					<th>Email</th>
					<th class="text-center">Họ tên</th>
					<th class="text-center">Giới tính</th>
					<th class="text-center">Địa chỉ</th>
					<th class="text-center">Vai trò</th>
					<th class="text-center">Ngày tạo</th>
					<th colspan="2" class="text-center"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ users}" var="u">
					<tr>
						<td><input type="checkbox" value="${u.id }" name="chk"
							class="form-check-input"></td>
						<td>${u.email }</td>
						<td class="text-center">${u.hoten }</td>
						<td class="text-center">${u.gioitinh?"Nam":"Nữ" }</td>
						<td class="text-center">${u.diachi }</td>
						<td class="text-center">${u.vaitro?"Quản trị":"Người dùng" }</td>
						<td class="text-center"><fmt:formatDate value="${u.ngaytao }"
								pattern="dd/MM/yyyy" /></td>
						<td><a href="/nguoi-dung/edit?id=${u.id }"><button
									type="button" class="btn">
									<i class="fa-solid fa-pen fs-5 text-warning"></i>
								</button></a></td>
						<td><button class="btn" data-bs-toggle="modal" type="button"
								data-bs-target="#exampleModal${u.id }">
								<i class="fa-solid fa-trash-can fs-5 text-danger"></i>
							</button></td>
					</tr>
					<div class="modal fade" id="exampleModal${u.id }" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Bạn có chắc muốn xóa sản phẩm này?</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										type="button" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<p>${u.email}
										<lable>sẽ bị xóa khỏi danh sách sản phẩm vĩnh viễn!</lable>
									</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" type="button"
										data-bs-dismiss="modal">Hủy</button>
									<a href="/nguoi-dung/delete?id=${u.id }">
										<button type="button" class="btn btn-primary" type="button">Vẫn
											xóa</button>
									</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</tbody>
		</table>
		</form>
	</c:if>
	<c:if test="${empty users}">
		<h2 class="mt-3">Người dùng trống rỗng</h2>
		<a href="/sach-tieng-anh"><button class="btn btn-dark">Trở
				về trang chủ</button></a>
	</c:if>
</c:if>