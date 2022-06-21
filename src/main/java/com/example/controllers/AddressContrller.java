package com.example.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.entities.DiaChi;
import com.example.entities.NguoiDung;
import com.example.services.AddressService;

@Controller
@RequestMapping("/address")
public class AddressContrller {
	@Autowired
	private AddressService adServ;
	
	@PostMapping("/set")
	public String set(DiaChi dc, HttpServletRequest request) {
		NguoiDung u = (NguoiDung) request.getSession().getAttribute("user");
		DiaChi d = adServ.findByNguoiDungId(u.getId());
		if(d==null) {
			dc.setNguoidungid(u.getId());
			adServ.create(dc);
		} else {
			dc.setId(d.getId());
			dc.setNguoidungid(u.getId());
			adServ.update(dc);
		}
		return "layout";
	}
	
	@GetMapping("/get")
	public @ResponseBody String get(HttpServletRequest request , ModelMap map) {
		NguoiDung u = (NguoiDung) request.getSession().getAttribute("user");
		DiaChi d = adServ.findByNguoiDungId(u.getId());
		
		return "<div class=\"mb-3 row\" id=\"form-address\">\r\n"
				+ "								<h1 class=\"text-center \">Thông tin nhận hàng</h1>\r\n"
				+ "								<hr>\r\n"
				+ "								<div class=\"col-6\">\r\n"
				+ "									<label class=\"fw-bold\">Người nhận hàng</label> <input\r\n"
				+ "										autocomplete=\"off\" type=\"text\" class=\"form-control\" id=\"n1\"\r\n"
				+ "										value=\""+d.getHoten()+"\" name=\"hoten\" required=\"required\">\r\n"
				+ "									<div class=\"invalid-feedback\">Vui lòng nhập người nhận\r\n"
				+ "										hàng!</div>\r\n"
				+ "								</div>\r\n"
				+ "								<div class=\"col-6\">\r\n"
				+ "									<label class=\"fw-bold\">Số điện thoại</label> <input\r\n"
				+ "										autocomplete=\"off\" type=\"text\" class=\"form-control\" id=\"n2\"\r\n"
				+ "										value=\""+d.getSodienthoai()+"\" name=\"sodienthoai\" required=\"required\">\r\n"
				+ "									<div class=\"invalid-feedback\">Vui lòng nhập số điện\r\n"
				+ "										thoại!</div>\r\n"
				+ "								</div>\r\n"
				+ "								<div class=\"col-12\">\r\n"
				+ "									<label class=\"fw-bold\">Địa chỉ nhận hàng</label> <input id=\"n3\"\r\n"
				+ "										autocomplete=\"off\" type=\"text\" class=\"form-control\"\r\n"
				+ "										value=\""+d.getDiachi()+"\" name=\"diachi\" required=\"required\">\r\n"
				+ "									<div class=\"invalid-feedback\">Vui lòng nhập địa chỉ nhận\r\n"
				+ "										hàng!</div>\r\n"
				+ "								</div>\r\n"
				+ "							</div>";
	}
		
}
