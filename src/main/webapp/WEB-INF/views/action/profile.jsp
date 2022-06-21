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
	<section class="section profile mt-3">
		<div class="row">
			<div class="col-xl-4">

				<div class="card">
					<div
						class="card-body profile-card pt-4 d-flex flex-column align-items-center">

						<img src="assets/images/${sessionScope.user.hinhanh }"
							alt="Profile" class="rounded-circle">
						<h2>${sessionScope.user.hoten }</h2>
						<h3>${sessionScope.user.vaitro?'Quản trị viên':'Người dùng' }</h3>
						<div class="social-links mt-2">
							<a href="#" class="twitter"><i class="bi bi-twitter"></i></a> <a
								href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
								href="#" class="instagram"><i class="bi bi-instagram"></i></a> <a
								href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
						</div>
					</div>
				</div>

			</div>

			<div class="col-xl-8">

				<div class="card">
					<div class="card-body pt-3">
						<!-- Bordered Tabs -->
						<ul class="nav nav-tabs nav-tabs-bordered">

							<li class="nav-item">
								<button class="nav-link active" data-bs-toggle="tab"
									data-bs-target="#profile-overview">Tổng quan</button>
							</li>

							<li class="nav-item">
								<button class="nav-link" data-bs-toggle="tab"
									data-bs-target="#profile-edit">Chỉnh sửa thông tin</button>
							</li>

							<li class="nav-item">
								<button class="nav-link" data-bs-toggle="tab"
									data-bs-target="#profile-settings">Cài đặt</button>
							</li>

							<li class="nav-item">
								<button class="nav-link" data-bs-toggle="tab"
									data-bs-target="#profile-change-password">Đổi mật khẩu</button>
							</li>

						</ul>
						<div class="tab-content pt-2">

							<div class="tab-pane fade show active profile-overview"
								id="profile-overview">

								<h5 class="card-title">Thông tin chi tiết</h5>

								<div class="row">
									<div class="col-lg-3 col-md-4 label ">Họ tên</div>
									<div class="col-lg-9 col-md-8">${sessionScope.user.hoten }</div>
								</div>

								<div class="row">
									<div class="col-lg-3 col-md-4 label">Giới tính</div>
									<div class="col-lg-9 col-md-8">${sessionScope.user.gioitinh?'Nam':'Nữ' }</div>
								</div>

								<div class="row">
									<div class="col-lg-3 col-md-4 label">Địa chỉ</div>
									<div class="col-lg-9 col-md-8">${sessionScope.user.diachi }</div>
								</div>

								<div class="row">
									<div class="col-lg-3 col-md-4 label">Email</div>
									<div class="col-lg-9 col-md-8">${sessionScope.user.email }</div>
								</div>


								<div class="row">
									<div class="col-lg-3 col-md-4 label">Vai trò</div>
									<div class="col-lg-9 col-md-8">${sessionScope.user.vaitro?'Quản trị viên':'Người dùng' }</div>
								</div>

								<div class="row">
									<div class="col-lg-3 col-md-4 label">Ngày tham gia</div>
									<div class="col-lg-9 col-md-8">
										<fmt:formatDate value="${sessionScope.user.ngaytao }"
											pattern="dd/MM/yyyy" />
									</div>
								</div>

							</div>

							<div class="tab-pane fade profile-edit pt-3" id="profile-edit">

								<!-- Profile Edit Form -->
								<form novalidate="novalidate" class="needs-validation"
									action="/profile/update?id=${user.id}" method="post">
									<div class="row mb-3">
										<label for="profileImage"
											class="col-md-4 col-lg-3 col-form-label">Hình ảnh</label>
										<div class="col-md-8 col-lg-9">
											<img id="profileimg" src="assets/images/${user.hinhanh }" alt="Profile">
											<div class="pt-2">
												<button onclick="upload()" class="btn btn-primary p-1 ps-2 pe-2" type="button">
													<i class="bi bi-upload"></i>
												</button>
												<input type="file" name="hinhanh" class="d-none" onchange="change()" id="imgInput" >
												<button onclick="remove()" class="btn btn-danger p-1 ps-2 pe-2 ms-2" type="button">
													<i class="bi bi-trash"></i>
												</button>
											</div>
										</div>
									</div>

									<div class="row mb-3">
										<label for="fullName" class="col-md-4 col-lg-3 col-form-label">Họ
											tên </label>
										<div class="col-md-8 col-lg-9">
											<input name="hoten" type="text" class="form-control"
												id="fullName" value="${user.hoten }" required="required">
											<div class="invalid-feedback">Vui lòng nhập họ tên!</div>
										</div>
									</div>


									<div class="row mb-3">
										<label for="giotinh" class="col-md-4 col-lg-3 col-form-label">Giới
											tính</label>
										<div class="col-md-8 col-lg-9">
											<input name="gioitinh" type="radio" class="form-check-input"
												id="nam" value="1" ${user.gioitinh?'checked':'' }> <label
												for="nam"> Nam</label> <input name="gioitinh" type="radio"
												${user.gioitinh?'':'checked' } class="form-check-input"
												id="nu" value="0"> <label for="nu"> Nữ</label>
										</div>
									</div>

									<div class="row mb-3">
										<label for="Job" class="col-md-4 col-lg-3 col-form-label">Địa
											chỉ</label>
										<div class="col-md-8 col-lg-9">
											<input name="diachi" type="text" class="form-control"
												id="Job" value="${user.diachi }" required="required">
											<div class="invalid-feedback">Vui lòng nhập địa chỉ!</div>
										</div>
									</div>

									<div class="row mb-3">
										<label for="Country" class="col-md-4 col-lg-3 col-form-label">Email</label>
										<div class="col-md-8 col-lg-9">
											<input name="email" type="text"
												class="form-control" id="Country" value="${user.email }"
												required="required">
											<div class="invalid-feedback">Vui lòng nhập mật khẩu!</div>
										</div>
									</div>


									<div class="text-center">
										<button type="submit" class="btn btn-primary">Lưu
											thay đổi</button>
									</div>
								</form>
								<!-- End Profile Edit Form -->

							</div>

							<div class="tab-pane fade pt-3" id="profile-settings">

								<!-- Settings Form -->
								<form>

									<div class="row mb-3">
										<label for="fullName" class="col-md-4 col-lg-3 col-form-label">Thông
											báo Email</label>
										<div class="col-md-8 col-lg-9">
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													id="changesMade" checked> <label
													class="form-check-label" for="changesMade"> Các
													thay đổi được thực hiện đối với tài khoản của bạn </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													id="newProducts" checked> <label
													class="form-check-label" for="newProducts"> Thông
													tin về các sản phẩm và dịch vụ mới </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													id="proOffers"> <label class="form-check-label"
													for="proOffers"> Tiếp thị và khuyến mãi </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													id="securityNotify" checked disabled> <label
													class="form-check-label" for="securityNotify"> Cảnh
													báo bảo mật </label>
											</div>
										</div>
									</div>

									<div class="text-center">
										<button type="submit" class="btn btn-primary">Lưu
											thay đổi</button>
									</div>
								</form>
								<!-- End settings Form -->

							</div>

							<div class="tab-pane fade pt-3" id="profile-change-password">
								<!-- Change Password Form -->
								<form class="needs-validation" method="post"
									novalidate="novalidate"
									action="/profile/changepass?id=${user.id }">

									<div class="row mb-3">
										<label for="currentPassword"
											class="col-md-4 col-lg-3 col-form-label">Mật khẩu
											hiện tại</label>
										<div class="col-md-8 col-lg-9">
											<input name="password" type="password" class="form-control"
												id="currentPassword" required="required">
											<div class="invalid-feedback">Vui lòng nhập mật khẩu
												hiện tại!</div>
										</div>
									</div>

									<div class="row mb-3">
										<label for="newPassword"
											class="col-md-4 col-lg-3 col-form-label">Mật khẩu mới</label>
										<div class="col-md-8 col-lg-9">
											<input name="newpassword" type="password"
												class="form-control" id="newPassword" required="required">
											<div class="invalid-feedback">Vui lòng nhập mật khẩu
												mới!</div>
										</div>
									</div>

									<div class="row mb-3">
										<label for="renewPassword"
											class="col-md-4 col-lg-3 col-form-label">Xác nhận mật
											khẩu mới!</label>
										<div class="col-md-8 col-lg-9">
											<input name="renewpassword" type="password"
												class="form-control" id="renewPassword" required="required">
											<div class="invalid-feedback">Vui lòng xác nhận mật
												khẩu mới!</div>
										</div>
									</div>

									<div class="text-center">
										<button type="submit" class="btn btn-primary">Đổi mật
											khẩu</button>
									</div>
								</form>
								<!-- End Change Password Form -->

							</div>

						</div>
						<!-- End Bordered Tabs -->

					</div>
				</div>

			</div>
		</div>
	</section>
</c:if>
