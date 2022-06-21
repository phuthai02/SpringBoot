package com.example.controllers;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.entities.DonHang;
import com.example.entities.DonHangChiTiet;
import com.example.entities.GioHang;
import com.example.entities.NguoiDung;
import com.example.entities.SachTiengAnh;
import com.example.services.CartService;
import com.example.services.OrderDetailService;
import com.example.services.OrderService;
import com.example.services.SachTiengAnhService;
import com.example.utils.CurrencyUtil;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderService oServ;
	@Autowired
	private OrderDetailService odServ;
	@Autowired
	private CartService cServ;
	@Autowired
	private SachTiengAnhService pServ;

	private void setCarts(HttpServletRequest request, int nguoidungid) {
		int soluong = 0;
		int sotien = 0;
		HttpSession s = request.getSession();
		List<GioHang> list = cServ.findByNguoiDungId(nguoidungid);
		for (GioHang g : list) {
			soluong += g.getSoluong();
			sotien = sotien + g.getSoluong() * Integer.valueOf(g.getGia().intValue());
		}
		s.setAttribute("carts", list);
		s.setAttribute("sizeCarts", soluong);
		s.setAttribute("priceCarts", sotien);
	}

	private String getRandomMDH() {
		Random r = new Random();
		String src = "1234567890QWERTYUIOPASD1234567890FGHJKLZXCVBNM";
		DonHang d;
		String rds;	
		
		do {
			rds = "PTEB";
			for (int i = 0; i < 6; i++) {
				rds += src.charAt(r.nextInt(src.length() - 1));
			}
			d = oServ.findById(rds);
		} while (d!=null);
		
		return rds;
	}

	@GetMapping("/index")
	public String index(ModelMap map, HttpServletRequest request) {		map.addAttribute("view", "/WEB-INF/views/user/order/index.jsp");
		return "layout";
	}

	@GetMapping("/detail")
	public String detail(ModelMap map, @RequestParam(name = "mdh") String madonhang, HttpServletRequest request) {
		DonHang od = oServ.findById(madonhang);
		map.addAttribute("madonhang", madonhang);
		map.addAttribute("order", od);
		map.addAttribute("details", odServ.findByMaDonHang(madonhang));
		map.addAttribute("view", "/WEB-INF/views/user/order/detail.jsp");
		return "layout";
	}

	@PostMapping("/store")
	public String store(ModelMap map, DonHang d, HttpServletRequest request) {
		HttpSession s = request.getSession();
		NguoiDung u = (NguoiDung) s.getAttribute("user");
		List<GioHang> listCart = (List<GioHang>) s.getAttribute("carts");
		Integer sizeCarts = (Integer) s.getAttribute("sizeCarts");
		BigDecimal priceCarts = (BigDecimal) s.getAttribute("priceCarts");
		String madonhang = getRandomMDH();
		d.setNguoidungid(u.getId());
		d.setTongtien(priceCarts);
		d.setTongsanpham(sizeCarts);
		d.setShip(new BigDecimal(priceCarts.compareTo(new BigDecimal(2000000)) < 1 ? 30000 : 0));
		d.setTrangthai("Chờ xác nhận");
		d.setMadonhang(madonhang);
		for (GioHang g : listCart) {
			SachTiengAnh sta = pServ.findById(g.getSanphamid());
			DonHangChiTiet od = new DonHangChiTiet();
			od.setCapdo(g.getCapdo());
			od.setHinhanh(g.getHinhanh());
			od.setMadonhang(madonhang);
			od.setSanphamid(g.getSanphamid());
			od.setSoluong(g.getSoluong());
			od.setTensanpham(g.getTensanpham());
			od.setTheloai(g.getTheloai());
			od.setGia(g.getGia());
			odServ.create(od);
			sta.setSoLuong(sta.getSoLuong() - g.getSoluong());
			try {
				pServ.update(sta);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		cServ.deleteByNguoiDungId(u.getId());
		setCarts(request, u.getId());
		oServ.create(d);
		map.addAttribute("view", "/WEB-INF/views/user/order/done.jsp");
		map.addAttribute("madonhang", madonhang);
		return "layout";
	}

	@PostMapping("xacnhan")
	public String xacnhan(@RequestParam(name = "madonhang") String madonhang) {
		DonHang o = oServ.findById(madonhang);
		o.setTrangthai("Đã xác nhận");
		try {
			oServ.update(o);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "layout";
	}

	@PostMapping("tuchoi")
	public String tuchoi(@RequestParam(name = "madonhang") String madonhang) {
		DonHang o = oServ.findById(madonhang);
		List<DonHangChiTiet> list = odServ.findByMaDonHang(madonhang);
		for (DonHangChiTiet dh : list) {
			SachTiengAnh s = pServ.findById(dh.getSanphamid());
			s.setSoLuong(s.getSoLuong() + dh.getSoluong());
			try {
				pServ.update(s);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		o.setTrangthai("Đã từ chối");
		try {
			oServ.update(o);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "layout";
	}

	@GetMapping("/ordermanager")
	public String ordermanager(ModelMap map) {
		map.addAttribute("mnorders", oServ.findAll());
		map.addAttribute("s1", oServ.findByTrangThai("Đã từ chối").size());
		map.addAttribute("s2", oServ.findByTrangThai("Chờ xác nhận").size());
		map.addAttribute("s3", oServ.findByTrangThai("Đã xác nhận").size());
		map.addAttribute("s4", oServ.findByTrangThai("Đang giao hàng").size());
		map.addAttribute("s5", oServ.findByTrangThai("Đã nhận hàng").size());
		map.addAttribute("view", "/WEB-INF/views/user/order/ordermanager.jsp");
		return "layout";
	}

	@PostMapping("/status")
	public @ResponseBody String status(@RequestParam(name = "trangthai") String trangthai) {
		List<DonHang> list = oServ.findByTrangThai(trangthai);
		String fullTable = "	<table class=\"table mt-3\" id=\"tableAll\">\r\n" + "					<thead>\r\n"
				+ "						<tr>\r\n"
				+ "<th><input type=\"checkbox\" onclick=\"selectAll()\" id=\"chkAll\"\r\n"
				+ "					class=\"form-check-input\"></th>" + "							<th>Mã</th>\r\n"
				+ "							<th>Thông tin nhận hàng</th>\r\n"
				+ "							<th>Tổng SP</th>\r\n" + "							<th>Tổng tiền</th>\r\n"
				+ "							<th>Trạng thái</th>\r\n" + "							<th></th>\r\n"
				+ "						</tr>\r\n" + "					</thead>\r\n" + "					<tbody>";
		String fTable = "</tbody>\r\n" + "				</table>";
		for (DonHang d : list) {
			BigDecimal price = d.getTongtien().add(d.getShip());
			fTable += "<tr>\r\n" + "<td><input type=\"checkbox\" value=\"" + d.getMadonhang() + "\" name=\"chk\"\r\n"
					+ "						class=\"form-check-input\"></td>" + "								<td>"
					+ d.getMadonhang() + "</td>\r\n" + "								<td>" + d.getHoten() + ", "
					+ d.getSodienthoai() + ", " + d.getDiachi() + "</td>\r\n"
					+ "								<td class=\"text-center\">" + d.getTongsanpham() + "</td>\r\n"
					+ "								<td>\r\n" + CurrencyUtil.toCurrencyBig(price)
					+ "								</td>\r\n" + "								<td>" + d.getTrangthai()
					+ "</td>\r\n" + "								<td><a href=\"/order/detail?mdh=" + d.getMadonhang()
					+ "\">Xem chi\r\n" + "										tiết</a></td>\r\n"
					+ "							</tr>";
		}
		return fullTable + fTable;
	}

	@GetMapping("/find")
	public String find(ModelMap map, String trangthai, String from, String to) {
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Date f, t;
		try {
			f = fm.parse(from);
			t = fm.parse(to);
			List<DonHang> list;
			list = oServ.findByNgayTaoBetween(f, t);
			map.addAttribute("orders", list);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "redirect:/cart/myorder";
	}
}
