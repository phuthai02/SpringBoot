package com.example.controllers;

import java.math.BigDecimal;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entities.GioHang;
import com.example.entities.NguoiDung;
import com.example.services.CartService;
import com.example.services.UserService;
import com.example.utils.MailUtil;

@Controller
public class ActionController {
	@Autowired
	private UserService usvc;
	@Autowired
	private CartService csvc;

	private void setCarts(HttpServletRequest request, int nguoidungid) {
		int soluong = 0;
		BigDecimal sotien = new BigDecimal(0);
		HttpSession s = request.getSession();
		List<GioHang> list = csvc.findByNguoiDungId(nguoidungid);
		for (GioHang g : list) {
			soluong += g.getSoluong();
			sotien = sotien.add(new BigDecimal(g.getSoluong()).multiply(g.getGia()));
		}
		s.setAttribute("carts", list);
		s.setAttribute("sizeCarts", soluong);
		s.setAttribute("priceCarts", sotien);
	}

	@GetMapping("/login")
	public String loginGet(ModelMap map) {
		map.addAttribute("view", "/WEB-INF/views/action/login.jsp");
		return "layout";
	}

	@GetMapping("/forgot")
	public String forgotGet(ModelMap map) {
		map.addAttribute("view", "/WEB-INF/views/action/forgot.jsp");
		return "layout";
	}

	@Autowired
	private MailUtil mail;

	@PostMapping("/forgot")
	public String forgotPost(ModelMap map, HttpServletRequest request, String email) {
		String newPass = getRandomPassword();
		NguoiDung u = usvc.findByEmail(email);
		if (u == null) {
			request.getSession().setAttribute("error", "Email không tồn tại!");
			return "redirect:/forgot";
		} else {
			u.setMatkhau(newPass);
			try {
				usvc.update(u);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mail.sendEmail("thaidpph17321@fpt.edu.vn", "Mật khẩu mới là: " + newPass,
					"Hãy bảo mật mail này hoặc đổi mật khẩu ngay sau khi đăng nhập");
			request.getSession().setAttribute("message", "Mật khẩu mới đã được gửi tới email!");
			return "redirect:/login";
		}
	}

	@PostMapping("/login")
	public String loginPost(ModelMap map, @RequestParam(name = "email") String email,
			@RequestParam(name = "matkhau") String matkhau, HttpServletRequest request) {
		NguoiDung u = usvc.findByEmail(email);
		if (u == null) {
			request.getSession().setAttribute("error", "Email không tồn tại!");
			return "redirect:/login";
		} else if (!u.getMatkhau().equals(matkhau)) {
			request.getSession().setAttribute("error", "Mật khẩu không chính xác!");
			return "redirect:/login";
		} else {
			request.getSession().setAttribute("user", u);
			setCarts(request, u.getId());
			return "redirect:/sach-tieng-anh";
		}
	}

	@GetMapping("/contact")
	public String contact(ModelMap map) {
		map.addAttribute("view", "/WEB-INF/views/action/contact.jsp");
		return "layout";
	}

	@GetMapping("/FAQ")
	public String FAQ(ModelMap map) {
		map.addAttribute("view", "/WEB-INF/views/action/FAQ.jsp");
		return "layout";
	}

	@GetMapping("/register")
	public String registerGet(ModelMap map) {
		map.addAttribute("view", "/WEB-INF/views/action/register.jsp");
		return "layout";
	}

	@PostMapping("/register")
	public String registerPost(ModelMap map, NguoiDung u, HttpServletRequest request) {
		try {
			u.setVaitro(false);
			usvc.create(u);
			request.getSession().setAttribute("message", "Tạo tài khoản thành công!");
			return "redirect:/login";
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Tạo tài khoản thành công!");
			return "redirect:/register";
		}
	}

	@GetMapping("/profile")
	public String profile(ModelMap map, HttpServletRequest request) {
		map.addAttribute("view", "/WEB-INF/views/action/profile.jsp");
		return "layout";
	}

	private String getRandomPassword() {
		String rds = "MK";
		String src = "1234567890QWERTYUIOPASD110502FGHJKLZXCVBNM1234567890";
		Random r = new Random();
		for (int i = 0; i < 8; i++) {
			rds += src.charAt(r.nextInt(src.length() - 1));
		}
		return rds;
	}

	@PostMapping("/profile/update")
	public String update(ModelMap map, HttpServletRequest request, NguoiDung u, @RequestParam(name = "id") int id) {
		NguoiDung user = (NguoiDung) request.getSession().getAttribute("user");
		u.setMatkhau(user.getMatkhau());
		u.setNgaytao(user.getNgaytao());
		u.setVaitro(user.getVaitro());
		if ("".equals(u.getHinhanh())) {
			u.setHinhanh(user.getHinhanh());
		}
		try {
			usvc.update(u);
			request.getSession().setAttribute("message", "Cập nhập thông tin thành công!");
			request.getSession().setAttribute("user", u);
		} catch (Exception e) {
			request.getSession().setAttribute("error", "Lỗi cập nhập thông tin!");
			e.printStackTrace();
		}
		return "redirect:/profile";
	}

	@PostMapping("/profile/changepass")
	public String update(ModelMap map, HttpServletRequest request, @RequestParam(name = "password") String password,
			@RequestParam(name = "newpassword") String newpassword,
			@RequestParam(name = "renewpassword") String renewpassword, @RequestParam(name = "id") int id) {
		NguoiDung u = usvc.findById(id);
		if (u.getMatkhau().equals(password)) {
			if (renewpassword.equals(newpassword)) {
				u.setMatkhau(renewpassword);
				try {
					usvc.update(u);
					request.getSession().setAttribute("message", "Thay đổi mật khẩu thành công!");
				} catch (Exception e) {
					request.getSession().setAttribute("error", "Lỗi thay đổi mật khẩu!");
					e.printStackTrace();
				}
			} else {
				request.getSession().setAttribute("error", "Mật khẩu xác nhận không trùng khớp!");
			}
		} else {
			request.getSession().setAttribute("error", "Mật khẩu hiện tại không chính xác!");
		}
		return "redirect:/profile";
	}

	@GetMapping("/logout")
	public String logout(ModelMap map, HttpServletRequest request) {
		request.getSession().setAttribute("user", null);
		map.addAttribute("view", "/WEB-INF/views/action/login.jsp");
		return "layout";
	}
}
