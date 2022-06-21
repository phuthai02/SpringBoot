<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:if test="${empty sessionScope.user }">
	<section
		class="section error-404 min-vh-100 d-flex flex-column align-items-center justify-content-center">
		<h1>404</h1>
		<h2>The page you are looking for doesn't exist.</h2>
		<a class="btn" href="/sach-tieng-anh">Trở về trang chủ</a> <img
			src="/assets/img/not-found.svg" class="img-fluid py-5"
			alt="Page Not Found">
	</section>
</c:if>
<c:if test="${!empty sessionScope.user }">
	<c:if test="${!empty orders}">
		<div class="row mt-3">
			<div class="input-group">
				<div class="col-xl">
					<form action="/order/find" method="get">
						<select class="form-select" name="trangthai">
							<option disabled="disabled" selected="selected">Trạng
								thái</option>
							<option value="Đã từ chối">Đã từ chối</option>
							<option value="Chờ xác nhận">Chờ xác nhận</option>
							<option value="Đã xác nhận">Đã xác nhận</option>
							<option value="Đang giao hàng">Đang giao hàng</option>
							<option value="Đã nhận hàng">Đã nhận hàng</option>
						</select>
				</div>
				&emsp; <label class="mt-2"> Từ </label> &emsp;
				<div class="col-xl-4">
					<input type="date" class="form-control" name="from"
						placeholder="Chọn ngày đặt hàng">
				</div>
				&emsp; <label class="mt-2"> đến </label> &emsp;
				<div class="col-xl-4">
					<input type="date" class="form-control" name="to"
						placeholder="Chọn ngày đặt hàng">
				</div>
				<button class="btn btn-success" type="submit">Tìm kiếm</button>
				</form>
			</div>
			<table class="table mt-2">
				<thead>
					<tr>
						<th>Mã đơn hàng</th>
						<th>Thông tin nhận hàng</th>
						<th>Tổng sản phẩm</th>
						<th>Tổng tiền</th>
						<th>Trạng thái</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orders }" var="o">
						<tr>
							<td>${o.madonhang }</td>
							<td>${o.hoten },${o.sodienthoai },${o.diachi }</td>
							<td class="text-center">${o.tongsanpham }</td>
							<td><fmt:setLocale value="en_US" /> <fmt:formatNumber
									value="${o.tongtien+o.ship}" /> đ</td>
							<td>${o.trangthai }</td>
							<td><a href="/order/detail?mdh=${o.madonhang }">Xem chi
									tiết</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>
	<c:if test="${empty orders }">
		<h2 class="mt-3">Đơn hàng trống rỗng</h2>
		<a href="/sach-tieng-anh"><button class="btn btn-dark">Trở
				về trang chủ</button></a>
	</c:if>
</c:if>