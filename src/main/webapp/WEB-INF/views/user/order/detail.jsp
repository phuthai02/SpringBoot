<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="row mt-3">
	<div class="row">
		<h2 class="fw-bold text-success text-center">
			CHI TIẾT ĐƠN HÀNG: <b class="text-danger" id="mdh">${madonhang }</b>
		</h2>
		<div class="col-6">
			<div class="card">
				<div class="card-body">
					<div class="cart-title text-danger mt-3">
						<h3>Thông tin giao hàng</h3>
						<hr>
					</div>
					<div class="cart-body">
						<b>Người nhận hàng: </b>${order.hoten } <br> <b>Số điện
							thoại: </b>${order.sodienthoai } <br> <b>Địa chỉ nhận hàng:
						</b>${order.diachi } <br> <b>Phương thức giao hàng: </b>${order.giaohang }
						<br> <b>Phương thức thanh toán: </b>${order.thanhtoan }<br>
						<b>Ngày đặt: </b>
						<fmt:formatDate value="${order.ngaytao }" pattern="dd/MM/yyyy" />
						<br> <b>Trạng thái: </b> <b class="text-danger">${order.trangthai }
						</b>
						<hr>
						<a href="/sach-tieng-anh"><button class="btn btn-dark">Tiếp
								tục mua sắm</button></a>
						<c:if test="${user.vaitro && order.trangthai eq 'Chờ xác nhận'}">
							<button onclick="xacnhan()" class="btn btn-success ms-3">Xác nhận</button>
							<button onclick="tuchoi()" class="btn btn-danger ms-3">Từ chối</button>
						</c:if>
						<c:if test="${user.vaitro && order.trangthai eq 'Đã xác nhận'}">
							<button onclick="in()" class="btn btn-success ms-3">In hóa đơn</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="col-6 ">
			<div class="card">
				<div class="card-body">
					<div class="cart-title text-danger mt-3">
						<h3>Danh sách sản phẩm</h3>
						<hr>
					</div>
					<div class="cart-body">
						<table class="table">
							<thead>
								<tr>
									<th class="col-2">SP</th>
									<th class="col-6">Tên SP</th>
									<th class="col-1">Thể loại</th>
									<th class="col-1">Cấp độ</th>
									<th class="col-1 text-center">SL</th>
									<th class="col-1 text-center">Giá</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="c" items="${details }">
									<tr>
										<td class="text-center"><img
											src="/assets/images/${c.hinhanh}" height="80px" width="60px"
											alt=""></td>
										<td>${c.tensanpham}</td>
										<td>${c.theloai}</td>
										<td>${c.capdo}</td>
										<td class="text-center">${c.soluong }</td>
										<td><fmt:setLocale value="en_US" /> <fmt:formatNumber
												value="${c.gia}" />đ</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="info">
							<div class="d-flex justify-content-between mt-3 fs-6">
								<small class="col-6 fw-bold">Tổng sản phẩm:</small> <small
									class="col-6  text-end">${order.tongsanpham}</small>
							</div>
							<div class="d-flex justify-content-between">
								<small class="col-6 fw-bold">Tổng tiền hàng:</small> <small
									class="col-6  text-end"> <fmt:setLocale value="en_US" />
									<fmt:formatNumber value="${order.tongtien}" /> đ
								</small>
							</div>
							<div class="d-flex justify-content-between">
								<small class="col-6 fw-bold">Phí vận chuyển:</small> <small
									class="col-6  text-end"> <fmt:setLocale value="en_US" />
									<fmt:formatNumber value="${order.ship}" /> đ
								</small>
							</div>
							<hr>
							<div class="d-flex justify-content-between">
								<small class="col-6 fw-bold">Thành tiền:</small> <small
									class="col-6 text-end"> <fmt:setLocale value="en_US" />
									<fmt:formatNumber value="${order.ship+order.tongtien}" /> đ
								</small>
							</div>
							<div class="d-flex justify-content-between">
								<small class="col-6 fw-bold"></small>
								<small onclick="convert(${order.ship+order.tongtien},'oddetail')"
									class="col-6 text-end" id="oddetail">
									click mee
								</small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>