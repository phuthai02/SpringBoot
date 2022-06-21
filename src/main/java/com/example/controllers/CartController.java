package com.example.controllers;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entities.GioHang;
import com.example.entities.NguoiDung;
import com.example.entities.SachTiengAnh;
import com.example.services.CartService;
import com.example.services.OrderService;
import com.example.services.SachTiengAnhService;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	private CartService cServ;
	@Autowired
	private SachTiengAnhService pServ;
	@Autowired
	private OrderService oServ;

	private void setCarts(HttpServletRequest request, int nguoidungid) {
		int soluong = 0;
		BigDecimal sotien = new BigDecimal(0);
		HttpSession s = request.getSession();
		List<GioHang> list = cServ.findByNguoiDungId(nguoidungid);
		for (GioHang g : list) {
			soluong += g.getSoluong();
			sotien = sotien.add(new BigDecimal(g.getSoluong()).multiply(g.getGia()));
		}
		s.setAttribute("carts", list);
		s.setAttribute("sizeCarts", soluong);
		s.setAttribute("priceCarts", sotien);
	}

	@PostMapping("/add")
	public String add(ModelMap map, int nguoidungid, int sanphamid, int soluong, HttpServletRequest request) {
		try {
			GioHang g = cServ.findByNguoiDungIdAndSanPhamId(nguoidungid, sanphamid);
			SachTiengAnh s = pServ.findById(sanphamid);
			if (g == null) {
				g = new GioHang();
				g.setNguoidungid(nguoidungid);
				g.setSanphamid(sanphamid);
				g.setSoluong(soluong);
				g.setCapdo(s.getCapDo());
				g.setTheloai(s.getTheLoai());
				g.setHinhanh(s.getHinhAnh());
				g.setTensanpham(s.getTenSach());
				g.setGia(s.getGia());
				cServ.create(g);
			} else {
				int sl = g.getSoluong() + soluong;
				if (sl > s.getSoLuong()) {
					sl = s.getSoLuong();
				}
				g.setSoluong(sl);
				cServ.update(g);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setCarts(request, nguoidungid);
		return "redirect:/sach-tieng-anh";
	}

	@PostMapping("/delete")
	public String delete(ModelMap map, int nguoidungid, int sanphamid, int soluong, HttpServletRequest request) {
		try {
			cServ.deleteByNguoiDungIdAndSanPhamId(nguoidungid, sanphamid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		setCarts(request, nguoidungid);
		return "layout";
	}

	@GetMapping("/index")
	public String index(ModelMap map, HttpServletRequest request) {
		map.addAttribute("view", "/WEB-INF/views/user/cart/index.jsp");
		return "layout";
	}

	@PostMapping("/plus")
	public String plus(ModelMap map, @RequestParam(name = "nguoidungid") int nguoidungid,
			@RequestParam(name = "sanphamid") int sanphamid, HttpServletRequest request) {
		GioHang g = cServ.findByNguoiDungIdAndSanPhamId(nguoidungid, sanphamid);
		SachTiengAnh s = pServ.findById(sanphamid);
		int sl = g.getSoluong() + 1;
		if (sl > s.getSoLuong()) {
			sl = s.getSoLuong();
		}
		g.setSoluong(sl);
		try {
			cServ.update(g);
			setCarts(request, nguoidungid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "layout";
	}

	@PostMapping("/sub")
	public String sub(ModelMap map, @RequestParam(name = "nguoidungid") int nguoidungid,
			@RequestParam(name = "sanphamid") int sanphamid, HttpServletRequest request) {
		GioHang g = cServ.findByNguoiDungIdAndSanPhamId(nguoidungid, sanphamid);
		if (g.getSoluong() == 1) {
			cServ.deleteByNguoiDungIdAndSanPhamId(nguoidungid, sanphamid);
			setCarts(request, nguoidungid);
			return "layout";
		}
		try {
			g.setSoluong(g.getSoluong() - 1);
			cServ.update(g);
			setCarts(request, nguoidungid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "layout";
	}

	@GetMapping("/myorder")
	public String myorder(ModelMap map, HttpServletRequest request) {
		try {
			NguoiDung u = (NguoiDung) request.getSession().getAttribute("user");
			map.addAttribute("orders", oServ.findByNguoiDungId(u.getId()));
		} catch (Exception e) {
		}
		map.addAttribute("view", "/WEB-INF/views/user/cart/myorder.jsp");
		return "layout";
	}
}
