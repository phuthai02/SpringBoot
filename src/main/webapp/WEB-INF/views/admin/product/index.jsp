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
	<c:if test="${!empty products}">
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
					<form action="/sach-tieng-anh/find" method="get">
						<div class="input-group">
							<div class="col-xl">
								<select class="form-select" name="level">
									<option disabled="disabled" selected="selected">Cấp độ</option>
									<option value="Starters">Starters</option>
									<option value="Movers">Movers</option>
									<option value="Flyers">Flyers</option>
									<option value="A2">A2</option>
									<option value="B1">B1</option>
									<option value="B2">B2</option>
									<option value="C1">C1</option>
									<option value="C2">C2</option>
								</select>
							</div>
							<div class="col-xl-7">
								<input type="text" class="form-control" name="name"
									aria-label="Nhập tên sách cần tìm...">
							</div>
							<button class="btn btn-success" type="submit">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</div>
					</form>
					<div class="text-center ms-5">
						<c:if test="${pageNumber>1 }">
							<a href="/sach-tieng-anh/first"><button class="btn">
									<i class="fa-solid fa-backward-step fs-4 text-danger"></i>
								</button></a>
							<a href="/sach-tieng-anh/previus"><button class="btn">
									<i class="fa-solid fa-angles-left fs-4 text-danger"></i>
								</button></a>
						</c:if>
						<label class="fs-4 text-danger fw-bold ms-2 me-2">${pageNumber }/${pageMax }</label>
						<c:if test="${pageNumber<pageMax }">
							<a href="next">
								<button class="btn">
									<i class="fa-solid fa-angles-right fs-4 text-danger"></i>
								</button>
							</a>
							<a href="/sach-tieng-anh/last"><button class="btn">
									<i class="fa-solid fa-forward-step fs-4 text-danger"></i>
								</button></a>
						</c:if>
					</div>
					<form action="/sach-tieng-anh/deleteList" method="get" class="ms-5">
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Bạn có chắc
											chắn muốn xóa các sản phẩm đã chọn?</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Các sản phẩm đã chọn sẽ bị xóa vĩnh viễn khỏi danh sách sản phẩm</div>
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
						<a href="/sach-tieng-anh/create"><button type="button"
								class="btn btn-primary" type="button">+ Thêm sản phẩm</button></a>
				</div>
			</div>
		</nav>

		<table class="table">
			<thead>
				<tr>
					<th><input type="checkbox" id="chkAll" onclick="selectAll()"
						class="form-check-input"></th>
					<th>Tên sách</th>
					<th class="text-center">Loại</th>
					<th class="text-center">Cấp độ</th>
					<th class="text-center">Số trang</th>
					<th class="text-center">Số lượng</th>
					<th class="text-center">Giá</th>
					<th class="text-center">Ngày tạo</th>
					<th colspan="2" class="text-center"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ products}" var="p">
					<tr>
						<td><input type="checkbox" name="chk" value="${p.id }"
							class="form-check-input"></td>
						<td>${p.tenSach }</td>
						<td class="text-center">${p.theLoai }</td>
						<td class="text-center">${p.capDo }</td>
						<td class="text-center">${p.soTrang }</td>
						<td class="text-center">${p.soLuong }</td>
						<td class="text-center"><fmt:setLocale value="en_US" /> <fmt:formatNumber
								value="${p.gia}" />đ</td>
						<td class="text-center"><fmt:formatDate value="${p.ngayTao }"
								pattern="dd/MM/yyyy" /></td>
						<td><a href="/sach-tieng-anh/edit?id=${p.id }"><button
									type="button" class="btn">
									<i class="fa-solid fa-pen fs-5 text-warning"></i>
								</button></a></td>
						<td><button class="btn" data-bs-toggle="modal" type="button"
								data-bs-target="#exampleModal${p.id }">
								<i class="fa-solid fa-trash-can fs-5 text-danger"></i>
							</button></td>
					</tr>
					<div class="modal fade" id="exampleModal${p.id }" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Bạn có chắc muốn xóa sản phẩm này?</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close" type="button"></button>
								</div>
								<div class="modal-body">
									<p>${p.tenSach}
										<lable>sẽ bị xóa khỏi danh sách sản phẩm vĩnh viễn!</lable>
									</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal" type="button">Hủy</button>
									<a href="/sach-tieng-anh/delete?id=${p.id }">
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
	<c:if test="${empty products}">
		<h2 class="mt-3">Sản phẩm trống rỗng</h2>
		<a href="/sach-tieng-anh"><button class="btn btn-dark">Trở
				về trang chủ</button></a>
	</c:if>
</c:if>