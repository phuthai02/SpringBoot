<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:if test="${!empty carts}">
	<div class="row mt-3">
		<div class="row">
			<div class="col-7">
				<div class="card">
					<div class="card-body">
						<form class="m-3 needs-validation" novalidate="novalidate"
							action="/order/store" method="post">
							<div class="mb-3 row" id="form-address">
								<h1 class="text-center ">Thông tin nhận hàng</h1>
								<hr>
								<div class="col-6">
									<label class="fw-bold">Người nhận hàng</label> <input
										autocomplete="off" type="text" class="form-control" id="n1"
										value="" name="hoten" required="required">
									<div class="invalid-feedback">Vui lòng nhập người nhận
										hàng!</div>
								</div>
								<div class="col-6">
									<label class="fw-bold">Số điện thoại</label> <input
										autocomplete="off" type="text" class="form-control" id="n2"
										value="" name="sodienthoai" required="required">
									<div class="invalid-feedback">Vui lòng nhập số điện
										thoại!</div>
								</div>
								<div class="col-12">
									<label class="fw-bold">Địa chỉ nhận hàng</label> <input id="n3"
										autocomplete="off" type="text" class="form-control"
										value="" name="diachi" required="required">
									<div class="invalid-feedback">Vui lòng nhập địa chỉ nhận
										hàng!</div>
								</div>
							</div>
							<button class="btn btn-outline-success" type="button"
								onclick="getAddress()">Dùng địa chỉ mặc định</button>
							<button class="btn btn-outline-primary ms-3" type="button"
								onclick="setAddress()">Đặt làm địa chỉ mặc định</button>
							<hr>
							<div class="row">
								<div class="col-12">
									<label class="fw-bold">Phương thức giao hàng</label> <br>
									<input type="radio" value="Giao hàng nhanh" name="giaohang"
										class="form-check-input" checked="checked" id="nhanh">
									<label for="nhanh">Giao hàng nhanh</label> <br> <input
										type="radio" value="Giao hàng tiết kiệm" name="giaohang"
										class="form-check-input" id="tietkiem"> <label
										for="tietkiem">Giao hàng tiết kiệm</label>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-12">
									<label class="fw-bold">Phương thức thanh toán</label> <br>
									<input type="radio" value="Thanh toán bằng thẻ tín dụng"
										name="thanhtoan" checked="checked" class="form-check-input"
										id="tindung"> <label class="" for="tindung">Thanh
										toán bằng thẻ tín dụng</label><br> <img height="30px"
										src="https://swanz.id/wp-content/uploads/2020/10/Visa-Logo-2006%E2%80%932014.png">
									<img height="30px"
										src="https://th.bing.com/th/id/R.a4bd3202cecefadc1b07ee359f856780?rik=rLDO2zSNggmU4Q&pid=ImgRaw&r=0">
									<img height="30px"
										src="https://th.bing.com/th/id/R.93432c12cb348bdefdcc27d465fac524?rik=LhggmvPksBkFkA&riu=http%3a%2f%2flogos-download.com%2fwp-content%2fuploads%2f2016%2f04%2fJCB_logo_logotype_emblem_Japan_Credit_Bureau.png&ehk=Q0%2f%2fhZsj0IOI9CRwjKhtQ%2bPCmN0Dgyiqi5VNsI67lvM%3d&risl=&pid=ImgRaw&r=0">
									<br> <input type="radio" value="Thanh toán bằng thẻ ATM"
										name="thanhtoan" class="form-check-input mt-3" id="atm">
									<label for="atm" class="mt-3">Thanh toán bằng thẻ ATM</label> <br>
									<img height="30px"
										src="https://www.ngoisaoso.vn/uploads/news/2013_07/01/130513-logo-vietcombank.png">
									<img height="30px"
										src="https://th.bing.com/th/id/R.09364586bfece7314fb2b4839018582e?rik=G6Zq6sUXmt8fDw&pid=ImgRaw&r=0">
									<img height="30px"
										src="https://www.pyn.fi/wp-content/uploads/Logo_MB_new-2.png">
									<img height="30px"
										src="https://th.bing.com/th/id/OIP.sTv7b4Jk9ebcu6W77Ddo9AHaEo?pid=ImgDet&rs=1">
									<img height="30px"
										src="https://th.bing.com/th/id/R.42978c9aec16b8b54f197b2c319adedb?rik=IEPQuiQ5S5NxhA&riu=http%3a%2f%2fdvthetindung247.com%2fwp-content%2fuploads%2f2017%2f04%2fthe_tin_dung_TPbank-1280x640.jpg&ehk=AKqdC%2bF3VbHuRx7R%2fP5eTDNtJgOjmVxxj83EC51uw9w%3d&risl=&pid=ImgRaw&r=0">
									<br> <input type="radio" value="Thanh toán bằng tiền mặt"
										name="thanhtoan" class="form-check-input mt-3" id="tienmat">
									<label for="tienmat" class="mt-3">Thanh toán bằng tiền
										mặt</label>
								</div>
							</div>
							<hr>
							<div class="d-flex justify-content-between">
								<div class="col-6">
									<a href="/cart/index"><button type="button"
											class="btn btn-outline-dark">Quay lại giỏ hàng</button></a>
								</div>
								<div class="col-6 text-end">
									<button type="submit" class="btn btn-dark">Thanh toán
										và giao hàng</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="col-5">
				<div class="card">
					<div class="card-body">
						<table class="table table-striped">
							<thead>
								<tr>
									<th class="col-8">Tên sản phẩm</th>
									<th class="col-2 text-center">Giá</th>
									<th class="col-2 text-center">SL</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="c" items="${carts }">
									<tr>
										<td class="col-8">${c.tensanpham}</td>
										<td class="col-2 text-center"><fmt:setLocale
												value="en_US" /> <fmt:formatNumber value="${c.gia}" />đ</td>
										<td class="col-2 text-center">${c.soluong }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="info">
							<div class="d-flex justify-content-between mt-3 fs-6">
								<small class="col-6 fw-bold">Tổng sản phẩm:</small> <small
									class="col-6  text-end">${sizeCarts}</small>
							</div>
							<div class="d-flex justify-content-between">
								<small class="col-6 fw-bold">Tổng tiền hàng:</small> <small
									class="col-6  text-end"> <fmt:setLocale value="en_US" />
									<fmt:formatNumber value="${priceCarts}" /> đ
								</small>
							</div>
							<div class="d-flex justify-content-between">
								<small class="col-6 fw-bold">Phí vận chuyển:</small> <small
									class="col-6  text-end"> <fmt:setLocale value="en_US" />
									<fmt:formatNumber value="${priceCarts<2000000?30000:0}" /> đ
								</small>
							</div>
							<hr>
							<div class="d-flex justify-content-between">
								<small class="col-6 fw-bold">Thành tiền:</small> <small
									class="col-6 text-end"> <fmt:setLocale value="en_US" />
									<fmt:formatNumber
										value="${priceCarts<2000000?priceCarts+30000:priceCarts}" />
									đ
								</small>
							</div>
							<div class="d-flex justify-content-between">
							<small class="col-6 fw-bold"></small>
								<small onclick="convert(${priceCarts<2000000?priceCarts+30000:priceCarts},'odindex')"
									class="col-6 text-end" id="odindex">
									click mee
								</small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${empty carts }">
	<section
	class="section error-404 min-vh-100 d-flex flex-column align-items-center justify-content-center">
	<h1>404</h1>
	<h2>The page you are looking for doesn't exist.</h2>
	<a class="btn btn-dark" href="/sach-tieng-anh">Trở về trang chủ</a> <img
		src="assets/img/not-found.svg" class="img-fluid py-5"
		alt="Page Not Found">
</section>
</c:if>