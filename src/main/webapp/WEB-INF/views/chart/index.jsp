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
<c:if test="${!empty sessionScope.user}">
	<div class="row mt-3">
		<div class="col-6">
			<div class="card">
				<div class="card-body" style="height: 500px;">
					<div id="pieChart" class="mt-5" style="min-height: 400px;"
						class="echart"></div>
					<table class="table" id="table" hidden>
						<thead>
							<tr>
								<th>Tên sản phẩm
								</td>
								<th>Số lượng đã bán
								</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="l">
								<tr>
									<td>${l[0] }</td>
									<td class="text-center">${l[1] }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="card-footer d-flex">
					<button id="danhsach" class="btn btn-outline-primary"
						onclick="danhsach()">Xem danh sách</button>
					<button id="bieudo" class="btn btn-outline-success"
						onclick="bieudo()" hidden>Xem biểu đồ</button>
				</div>
			</div>
		</div>
		<div class="col-6">
			<div class="card">
				<div class="card-body" style="height: 500px;">
					<div id="pieChart2" class="mt-5" style="min-height: 400px;"
						class="echart"></div>
					<table class="table" id="table2" hidden>
						<thead>
							<tr>
								<th>Tên sản phẩm
								</td>
								<th>Doanh thu
								</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list2 }" var="l">
								<tr>
									<td>${l[0] }</td>
									<td class="text-center"><fmt:setLocale value="en_US" /> <fmt:formatNumber
											value="${l[1]}" /> đ</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="card-footer">
					<button class="btn btn-outline-primary" id="danhsach2"
						onclick="danhsach2()">Xem danh sách</button>
					<button class="btn btn-outline-success" id="bieudo2"
						onclick="bieudo2()" hidden>Xem biểu đồ</button>
				</div>
			</div>
		</div>
	</div>
	<script>
					document.addEventListener("DOMContentLoaded", () => {
						echarts.init(document.querySelector("#pieChart")).setOption({
							title: {
								text: 'TOP 5 SẢN PHẨM BÁN CHẠY NHẤT',
								subtext: 'Phú Thái EBook',
								left: 'center'
							},
							tooltip: {
								trigger: 'item'
							},
							series: [{
								name: 'Sản phẩm',
								type: 'pie',
								radius: '50%',
								data: ${ listString },
								emphasis: {
								itemStyle: {
									shadowBlur: 10,
									shadowOffsetX: 0,
									shadowColor: 'rgba(0, 0, 0, 0.5)'
								}
							}
                    }]
                  });
                });

					document.addEventListener("DOMContentLoaded", () => {
						echarts.init(document.querySelector("#pieChart2")).setOption({
							title: {
								text: 'TOP 5 SẢN PHẨM DOANH THU CAO NHẤT',
								subtext: 'Phú Thái EBook',
								left: 'center'
							},
							tooltip: {
								trigger: 'item'
							},
							series: [{
								name: 'Sản phẩm',
								type: 'pie',
								radius: '50%',
								data: ${ listString2 },
								emphasis: {
								itemStyle: {
									shadowBlur: 10,
									shadowOffsetX: 0,
									shadowColor: 'rgba(0, 0, 0, 0.5)'
								}
							}
                   }]
                 });
               });
				</script>
</c:if>