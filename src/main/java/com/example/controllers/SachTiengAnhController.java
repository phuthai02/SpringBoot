package com.example.controllers;

import java.math.BigDecimal;
import java.util.ArrayList;
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

import com.example.entities.CapDo;
import com.example.entities.GioHang;
import com.example.entities.NguoiDung;
import com.example.entities.SachTiengAnh;
import com.example.services.CartService;
import com.example.services.SachTiengAnhService;

@Controller
@RequestMapping("/sach-tieng-anh")
public class SachTiengAnhController {
	private int pageNumber = 0;
	@Autowired
	private SachTiengAnhService EBService;
	@Autowired
	private CartService cartService;

	private String Page(ModelMap map) {
		map.addAttribute("products", EBService.getPage(pageNumber, false).getContent());
		map.addAttribute("pageNumber", pageNumber + 1);
		return "redirect:/sach-tieng-anh/index";
	}

	@GetMapping("")
	public String show(ModelMap map) {
		map.addAttribute("products", EBService.getAll());
		map.addAttribute("pageNumber", pageNumber + 1);
		map.addAttribute("view", "/WEB-INF/views/admin/product/show.jsp");
		return "layout";
	}

	@GetMapping("/first")
	public String getFirtPage(ModelMap map) {
		pageNumber = 0;
		return Page(map);
	}

	@GetMapping("/last")
	public String getLastPage(ModelMap map) {
		pageNumber = EBService.getPage(0, false).getTotalPages() - 1;
		return Page(map);
	}

	@GetMapping("/next")
	public String getNextPage(ModelMap map) {
		if (pageNumber < EBService.getPage(0, false).getTotalPages() - 1) {
			pageNumber++;
		}
		return Page(map);
	}

	@GetMapping("/previus")
	public String getPreviusPage(ModelMap map) {
		if (pageNumber > 0) {
			pageNumber--;
		}
		return Page(map);
	}

	@GetMapping("/index")
	public String getAll(ModelMap map) {
		map.addAttribute("products", EBService.getPage(pageNumber, false).getContent());
		map.addAttribute("pageNumber", pageNumber + 1);
		map.addAttribute("pageMax", EBService.getPage(pageNumber, false).getTotalPages());
		map.addAttribute("view", "/WEB-INF/views/admin/product/index.jsp");
		return "layout";
	}

	@GetMapping("/create")
	public String create(ModelMap map) {
		map.addAttribute("view", "/WEB-INF/views/admin/product/create.jsp");
		return "layout";
	}

	@GetMapping("/find")
	public String find(ModelMap map, @RequestParam(name = "level", required = false) CapDo capDo,
			@RequestParam(name = "name", required = false) String tenSach) {
		if (capDo == null) {
			pageNumber = 0;
			map.addAttribute("products", EBService.findByNameLike("%" + tenSach + "%"));
		} else if (capDo != null) {
			pageNumber = 0;
			map.addAttribute("products", EBService.findByNameAndTypeLike("%" + tenSach + "%", capDo));
		}
		map.addAttribute("view", "/WEB-INF/views/admin/product/index.jsp");
		map.addAttribute("pageNumber", pageNumber + 1);
		return "layout";
	}

	@PostMapping("/store")
	public String store(ModelMap map, SachTiengAnh s, HttpServletRequest request) {
		try {
			EBService.add(s);
			request.getSession().setAttribute("message", "Thêm sản phẩm thành công!");
			pageNumber = 0;
			return "redirect:/sach-tieng-anh/index";
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Thêm sản phẩm thất bại!");
			return "redirect:/sach-tieng-anh/create";
		}
	}

	@GetMapping("/delete")
	public String delete(@RequestParam(name = "id") int id, HttpServletRequest request) {
		try {
			EBService.delete(id);
			request.getSession().setAttribute("message", "Xóa sản phẩm thành công!");
			pageNumber = 0;
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Xóa sản phẩm thất bại!");
		}
		return "redirect:/sach-tieng-anh/index";
	}

	@GetMapping("/edit")
	public String edit(ModelMap map, @RequestParam(name = "id") int id) {
		map.addAttribute("product", EBService.findById(id));
		map.addAttribute("view", "/WEB-INF/views/admin/product/edit.jsp");
		return "layout";
	}

	private void setCarts(HttpServletRequest request, int nguoidungid) {
		int soluong = 0;
		BigDecimal sotien = new BigDecimal(0);
		HttpSession s = request.getSession();
		List<GioHang> list = cartService.findByNguoiDungId(nguoidungid);
		for (GioHang g : list) {
			soluong += g.getSoluong();
			sotien = sotien.add(new BigDecimal(g.getSoluong()).multiply(g.getGia()));
		}
		s.setAttribute("carts", list);
		s.setAttribute("sizeCarts", soluong);
		s.setAttribute("priceCarts", sotien);
	}

	@PostMapping("/update")
	public String update(ModelMap map, @RequestParam(name = "id") int id, SachTiengAnh s, HttpServletRequest request) {
		if(s.getHinhAnh()=="") {
			s.setHinhAnh(EBService.findById(id).getHinhAnh());
		}
		s.setId(id);
		try {
			EBService.update(s);
			List<GioHang> list = cartService.findBySanPhamID(id);
			for (GioHang g : list) {
				g.setGia(s.getGia());
				g.setHinhanh(s.getHinhAnh());
				g.setTensanpham(s.getTenSach());
				g.setCapdo(s.getCapDo());
				g.setTheloai(s.getTheLoai());
				cartService.update(g);
			}
			NguoiDung u = (NguoiDung) request.getSession().getAttribute("user");
			setCarts(request, u.getId());
			request.getSession().setAttribute("message", "Chỉnh sửa sản phẩm thành công!");
			return "redirect:/sach-tieng-anh/index";
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Chỉnh sửa sản phẩm thất bại!");
			return "redirect:/sach-tieng-anh/edit?id=" + id;
		}
	}

	@GetMapping("/deleteList")
	public String deleteList(String[] chk, HttpServletRequest request) {
		if (chk != null) {
			List<Integer> list = new ArrayList<>();
			for (String c : chk) {
				list.add(Integer.parseInt(c));
			}
			EBService.delete(list);
			pageNumber = 0;
			request.getSession().setAttribute("message", "Các sản phẩm đã bạn chọn đã bị xóa!");
		} else {
			request.getSession().setAttribute("error", "Vui lòng chọn sản phẩm cần xóa!");

		}
		return "redirect:/sach-tieng-anh/index";
	}

	@GetMapping("/detail")
	public String detail(ModelMap map, int id) {
		SachTiengAnh s = EBService.findById(id);
		map.addAttribute("p", s);
		map.addAttribute("view", "/WEB-INF/views/admin/product/detail.jsp");
		map.addAttribute("products", EBService.findByNameAndTypeLike("%%", s.getCapDo()));
		return "layout";
	}

}
