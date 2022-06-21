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
	<div class="d-flex justify-content-between mt-3">
		<button onclick="status('Đã từ chối')"
			class="col-2 pt-4 text-center text-white pb-4 ps-2 pe-2 btn-danger btn fw-bold">
			Đã từ chối<br>${s1 }
		</button>
		<button onclick="status('Chờ xác nhận')"
			class="col-2 pt-4 text-center text-white pb-4 ps-2 pe-2 btn-secondary btn fw-bold">
			Chờ xác nhận<br>${s2 }
		</button>
		<button onclick="status('Đã xác nhận')"
			class="col-2 pt-4 text-center text-white pb-4 ps-2 pe-2 btn-warning btn fw-bold">
			Đã xác nhận<br>${s3 }
		</button>
		<button onclick="status('Đang vận chuyển')"
			class="col-2 pt-4 text-center text-white pb-4 ps-2 pe-2 btn-primary btn fw-bold">
			Đang vận chuyển<br>${s4 }
		</button>
		<button onclick="status('Đã nhận hàng')"
			class="col-2 pt-4 text-center text-white pb-4  ps-2 pe-2 btn-success btn fw-bold">
			Đã nhận hàng<br>${s5 }
		</button>
	</div>
	<table class="table mt-3" id="tableAll">
		<thead>
			<tr>
				<th>Mã</th>
				<th>Thông tin nhận hàng</th>
				<th>Tổng SP</th>
				<th>Tổng tiền</th>
				<th>Trạng thái</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${mnorders }" var="o">
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
</c:if>