<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="container">
	<section
		class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
		<div class="container">
			<div class="row justify-content-center">
				<div
					class="col-lg-6 col-md-8 d-flex flex-column align-items-center justify-content-center">

					<div class="d-flex justify-content-center py-4">
						<a href="/sach-tieng-anh"
							class="logo d-flex align-items-center w-auto"> <img
							src="assets/img/logo.png" alt=""> <span
							class="d-none d-lg-block fs-2">PhuThai</span>
						</a>
					</div>
					<!-- End Logo -->

					<div class="card mb-3">

						<div class="card-body">

							<div class="pt-4 pb-2">
								<h5 class="card-title text-center pb-0 fs-4">Quên mật khẩu</h5>
								<p class="text-center small">Vui lòng nhập email để lấy lại mật khẩu</p>
							</div>
							<form class="row g-3 needs-validation" action="/forgot"
								method="post" novalidate>
								<div class="col-12">
									<label for="yourUsername" class="form-label">Email</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="yourEmail">@</span> <input
											type="email" name="email" class="form-control" id="yourEmail"
											required>
										<div class="invalid-feedback">Vui lòng nhập email!</div>
									</div>
								</div>


								<div class="col-12">
									<div class="form-check">
										<input class="form-check-input" name="terms" type="checkbox"
											value="" id="acceptTerms" required> <label
											class="form-check-label" for="acceptTerms">Tôi đồng ý
											chấp nhận các <a href="#"> điều khoản và điều kiện</a>
										</label>
										<div class="invalid-feedback">Vui lòng chấp nhận điều
											khoản và điều kiện!</div>
									</div>
								</div>
								<div class="col-12">
									<button class="btn btn-primary w-100" type="submit">Gửi mật khẩu</button>
								</div>
								<div class="col-12">
									<p class="small mb-0">
										Bạn đã nhớ tài khoản? <a href="/login">Đăng nhập ngay</a>
									</p>
								</div>
							</form>

						</div>
					</div>

				</div>
			</div>
		</div>
	</section>

</div>