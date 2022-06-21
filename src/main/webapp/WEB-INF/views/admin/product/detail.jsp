<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="row	mt-3">
	<div class="col-8 row" style="height: 320px;">
		<img src="/assets/images/${p.hinhAnh }" class="col-3 mt-2"
			height="250px">
		<div class="col-9">
			<label class="fs-4 fw-bold"> ${p.tenSach } </label> <br> <label
				class="fs-5 text-warning fw-bold"> <c:choose>
					<c:when test="${p.gia<=150000 }">
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star text-dark"></i>
					</c:when>
					<c:when test="${p.gia>=200000 }">
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
					</c:when>
					<c:otherwise>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star-half-stroke"></i>
					</c:otherwise>
				</c:choose>
			</label> <br> <label class="fs-6 mt-2"> Thể loại: ${p.theLoai }
			</label><br> <label class="fs-6"> Cấp độ: ${p.capDo } </label><br>
			<label class="fs-6"> Số trang: ${p.soTrang } </label><br> <label
				class="fs-6"> Giá: <fmt:setLocale value="en_US" /> <fmt:formatNumber
					value="${p.gia}" /> đ
			</label><br> <label>Số lượng: </label>
			<div class="input-group mt-1 col-5">
				<button type="button" onclick="giam()">
					<i class="fa-solid fa-minus"></i>
				</button>
				<input type="text" value="0" id="sld" onchange="validN(${p.soLuong })" class="col-1 text-center">
				<button type="button" onclick="tang(${p.soLuong })">
					<i class="fa-solid fa-plus"></i>
				</button>
				<label class="ms-3"></label> ${p.soLuong } sản phẩm có sẵn</label><br>
			</div>
			<div class="action mt-3">
				<c:if test="${empty user }">
					<a href="/login"><button class="btn btn-primary">Đăng
							nhập để mua hàng</button></a>
				</c:if>
				<c:if test="${!empty user }">
					<button class="btn btn-primary"
						onclick="addDetail(${user.id},${p.id })">Thêm vào giỏ
						hàng</button>
				</c:if>
				<a href="/sach-tieng-anh"><button type="button"
						class="btn btn-dark ms-2">Quay lại trang chủ</button></a>
			</div>
		</div>
		<hr class="mt-3">
		<div class="danhgia"></div>
	</div>
	<div class="col-4 border-start">
		<div class="fs-4 fw-bold text-center">Sản phẩm tương tự</div>
		<c:forEach items="${products }" var="p" end="4">
			<a href="/sach-tieng-anh/detail?id=${p.id }"><div
					class="card m-0 text-dark">
					<div class="card-body p-2">
						<div class="row">
							<img src="/assets/images/${p.hinhAnh }" class="col-3"
								height="90px" width="70px" alt="">
							<div class="col-9">
								<label>${p.tenSach }</label> <br> <small>TL:
									${p.theLoai }</small> &emsp; <small>CĐ: ${p.capDo }</small> <br> <small>Giá:
									<fmt:setLocale value="en_US" /> <fmt:formatNumber
										value="${p.gia}" /> đ
								</small> <br>
							</div>
						</div>
					</div>
				</div></a>
		</c:forEach>
	</div>
</div>