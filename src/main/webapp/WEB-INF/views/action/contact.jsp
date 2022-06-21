<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<section class="section contact pt-3">
	<div class="row gy-4">

		<div class="col-xl-6">

			<div class="row">
				<div class="col-lg-6">
					<div class="info-box card">
						<i class="bi bi-geo-alt"></i>
						<h3>Địa chỉ</h3>
						<p>
							LK261-DV07 KDT Mậu Lương<br>Kiến Hưng, Hà Đông, Hà Nội
						</p>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="info-box card">
						<i class="bi bi-telephone"></i>
						<h3>Số điện thoại</h3>
						<p>
							+84 865110502<br>+84 069300802
						</p>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="info-box card">
						<i class="bi bi-envelope"></i>
						<h3>Email</h3>
						<p>
							doanphuthai@gmail.com<br>thaidpph17321@gmail.com
						</p>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="info-box card">
						<i class="bi bi-clock"></i>
						<h3>Thời gian</h3>
						<p>
							Thứ 2 - Thứ 7<br>6:00AM - 23:00PM
						</p>
					</div>
				</div>
			</div>

		</div>

		<div class="col-xl-6">
			<div class="card p-4">
				<form action="forms/contact.php" method="post"
					class="php-email-form">
					<div class="row gy-4">

						<div class="col-md-6">
							<input type="text" name="name" class="form-control"
								placeholder="Nhập họ tên..." required>
						</div>

						<div class="col-md-6 ">
							<input type="email" class="form-control" name="email"
								placeholder="Nhập email..." required>
						</div>

						<div class="col-md-12">
							<input type="text" class="form-control" name="subject"
								placeholder="Nhập tiêu đề..." required>
						</div>

						<div class="col-md-12">
							<textarea class="form-control" name="message" rows="6"
								placeholder="Nhập lời nhắn..." required></textarea>
						</div>

						<div class="col-md-12 text-center">
							<div class="loading">Loading</div>
							<div class="error-message"></div>
							<div class="sent-message">Your message has been sent. Thank
								you!</div>

							<button type="submit">Gửi tin nhắn</button>
						</div>

					</div>
				</form>
			</div>

		</div>

	</div>

</section>