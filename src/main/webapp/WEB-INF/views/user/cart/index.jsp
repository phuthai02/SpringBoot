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
	<c:if test="${!empty carts}">
		<div class="row mt-3">
			<div class="row">
				<div class="col-8">
					<div class="card">
						<div class="card-body">
							<table class="table table-striped">
								<thead>
									<tr>
										<th class="col-2">Sản phẩm</th>
										<th class="col-5">Tên sản phẩm</th>
										<th class="col-1">Thể loại</th>
										<th class="col-1">Cấp độ</th>
										<th class="col-1 text-center">SL</th>
										<th class="col-1 text-center">Giá</th>
										<th class="col-1">Xóa</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="c" items="${carts }">
										<tr>
											<td class="text-center"><img
												src="/assets/images/${c.hinhanh}" height="80px" width="60px"
												alt=""></td>
											<td>${c.tensanpham}</td>
											<td>${c.theloai}</td>
											<td>${c.capdo}</td>
											<td class="text-center">
												<button class="col-12"
													onclick="plus(${user.id },${c.sanphamid})">
													<i class="fa-solid fa-angle-up"></i>
												</button> <label class="col-12">${c.soluong }</label>
												<button class="col-12"
													onclick="sub(${user.id },${c.sanphamid})">
													<i class="fa-solid fa-angle-down"></i>
												</button>
											</td>
											<td><fmt:setLocale value="en_US" /> <fmt:formatNumber
													value="${c.gia}" />đ</td>
											<td><button class="col-12 align-middle h-100"
													onclick="deletecart(${user.id },${c.sanphamid},${c.soluong })">
													<i class="fa-solid fa-xmark"></i>
												</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="col-4">
					<div class="card">
						<div class="card-body">
							<div class="d-flex justify-content-between mt-3">
								<h5 class="col-6">Tổng sản phẩm:</h5>
								<h5 class="col-6 text-end">${sizeCarts}</h5>
							</div>
							<div class="d-flex justify-content-between">
								<h5 class="col-6">Tổng tiền hàng:</h5>
								<h5 class="col-6 text-end">
									<fmt:setLocale value="en_US" />
									<fmt:formatNumber value="${priceCarts}" />
									đ
								</h5>
							</div>
							<div class="d-flex justify-content-between">
								<h5 class="col-6">Thành tiền:</h5>
								<h5 class="col-6 text-end">
									<fmt:setLocale value="en_US" />
									<fmt:formatNumber value="${priceCarts}" />
									đ
								</h5>
							</div>
							<hr>
							<div class="d-flex justify-content-between">
								<h5 class="col-6">Tạm tính:</h5>
								<h5 class="col-6 text-end">
									<fmt:setLocale value="en_US" />
									<fmt:formatNumber value="${priceCarts}" />
									đ
								</h5>
							</div>
							<c:if test="${priceCarts<2000000}">
								<small>Bạn được miễn phí ship khi đơn hàng có tổng giá
									trị trên 2.000.000đ</small>
								<br>
								<small class="text-danger">Mua thêm <fmt:setLocale
										value="en_US" /> <fmt:formatNumber
										value="${2000000-priceCarts}" />đ để được miễn phí SHIP
								</small>
							</c:if>
							<div class="d-flex justify-content-between mt-3">
								<a href="/sach-tieng-anh" class="col-7"><button
										class="btn btn-outline-dark">Tiếp tục mua sắm</button></a> <a
									href="/order/index" class="col-5 text-end"><button
										class="btn btn-dark">Thanh toán</button></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${empty carts }">
		<h2 class="mt-3">Giỏ hàng trống rỗng</h2>
		<a href="/sach-tieng-anh"><button class="btn btn-dark">Trở
				về trang chủ</button></a>
	</c:if>
</c:if>