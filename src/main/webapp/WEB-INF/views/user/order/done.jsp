<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="row mt-3">
	<div class="card">
		<div class="card-body text-center">
			<div class="cart-title text-success mt-3">
				<h2 class="fw-bold">ĐẶT HÀNG THÀNH CÔNG</h2>
			</div>
			<hr>
			Thân chào <label class="text-success fw-bold">${user.hoten }
			</label>! Đơn hàng của bạn với mã <label class="text-success fw-bold">${madonhang }
			</label> đã được đặt thành công. <br> Đơn hàng của bạn sẽ được gửi tới
			nhân viên xác nhận. <br> <label class="fw-bold"> Hiện
				tại do đang trong quá trình sale lớn, đơn hàng của bạn có thể sẽ gửi
				chậm hơn so với dự kiến từ 5-10 ngày. Rất mong bạn thông cảm vì sự
				bất tiện này!</label> <br> <label class="text-danger">(Lưu ý:
				Bạn chỉ có thể hủy đơn hàng khi nhân viên chưa xác nhận)</label> <br>
			Cảm ơn bạn tin dùng sản phẩm của Phú Thái - EBook <br> <br>
			<a href="/order/detail?mdh=${madonhang }"><button class="btn btn-outline-dark">Xem chi tiết đơn hàng</button></a>
			<a href="/sach-tieng-anh"><button class="btn btn-dark ms-5">Tiếp
					tục mua sắm</button></a> <br> <br> Mọi thắc mắc xin vui lòng liên hệ
			hotline <label class="text-danger fw-bold">0865.110.502</label> hoặc
			liên hệ kênh hỗ trợ để được giải quyết nhanh nhất.
		</div>
	</div>
</div>