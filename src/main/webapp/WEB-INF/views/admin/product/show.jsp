<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:if test="${!empty products}">
	<div class="d-flex p-3 row justify-content-between">
		<c:forEach items="${products }" var="p">
			<c:if test="${p.soLuong > 0 }">
				<div class="col-xl-3 col-lg-3 col-sm-4">
					<div class="card">
						<div class="m-4">
							<img src="/assets/images/${p.hinhAnh }" height="232px"
								width="157px" class="card-img-top" alt="...">
						</div>
						<hr>
						<div class="card-body" style="height: 220px">
							<h5 class="card-title">${p.tenSach }</h5>
							<p class="card-text text-warning">
								<c:choose>
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
							</p>
							<p class="card-text">
								Số lượng còn lại:
								<fmt:setLocale value="en_US" />
								<fmt:formatNumber value="${p.soLuong}" />
							</p>
							<p class="card-text fw-bold">
								Giá:
								<fmt:setLocale value="en_US" />
								<fmt:formatNumber value="${p.gia}" />
								đ
							</p>
						</div>
						<div class="card-footer">
							<p class="card-text d-flex justify-content-between">
								<c:if test="${empty user }">
									<a href="/login">
										<button class="btn btn-outline-success">Mua hàng</button>
									</a>
								</c:if>
								<c:if test="${!empty user }">
									<button class="btn btn-outline-success"
										onclick="add(${user.id},${p.id })">Mua hàng</button>
								</c:if>
								<a href="/sach-tieng-anh/detail?id=${p.id }"><button
										class="btn btn-outline-primary ms-2">Xem thêm</button></a>
							</p>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
</c:if>
<c:if test="${empty products}">
	<h2 class="mt-3">Sản phẩm trống rỗng</h2>
	<a href="/sach-tieng-anh"><button class="btn btn-dark">Trở
			về trang chủ</button></a>
</c:if>