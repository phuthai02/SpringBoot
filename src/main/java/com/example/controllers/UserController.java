package com.example.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entities.NguoiDung;
import com.example.services.UserService;

@Controller
@RequestMapping("/nguoi-dung")
public class UserController {
	int pageNumber = 0;
	@Autowired
	private UserService usvc;

	@GetMapping("/index")
	public String index(ModelMap map) {
		map.addAttribute("users", usvc.getPage(pageNumber, false).getContent());
		map.addAttribute("pageNumber", pageNumber + 1);
		map.addAttribute("pageMax", usvc.getPage(pageNumber, false).getTotalPages());
		map.addAttribute("view", "/WEB-INF/views/admin/user/index.jsp");
		return "layout";
	}

	private String Page(ModelMap map) {
		map.addAttribute("users", usvc.getPage(pageNumber, false).getContent());
		map.addAttribute("pageNumber", pageNumber + 1);
		return "redirect:/nguoi-dung/index";
	}

	@GetMapping("/first")
	public String getFirtPage(ModelMap map) {
		pageNumber = 0;
		return Page(map);
	}

	@GetMapping("/last")
	public String getLastPage(ModelMap map) {
		pageNumber = usvc.getPage(0, false).getTotalPages() - 1;
		return Page(map);
	}

	@GetMapping("/next")
	public String getNextPage(ModelMap map) {
		if (pageNumber < usvc.getPage(0, false).getTotalPages() - 1) {
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

	@GetMapping("/find")
	public String find(ModelMap map, @RequestParam(name = "role", required = false) Boolean vaitro,
			@RequestParam(name = "name", required = false) String hoten) {
		if (vaitro == null) {
			pageNumber = 0;
			map.addAttribute("users", usvc.findByNameLike("%" + hoten + "%"));
		} else if (vaitro != null) {
			map.addAttribute("users", usvc.findByNameAndRoleLike("%" + hoten + "%", vaitro));
		}
		map.addAttribute("view", "/WEB-INF/views/admin/user/index.jsp");
		map.addAttribute("pageNumber", pageNumber + 1);
		return "layout";
	}

	@GetMapping("/create")
	public String create(ModelMap map) {
		map.addAttribute("view", "/WEB-INF/views/admin/user/create.jsp");
		return "layout";
	}

	@PostMapping("/store")
	public String store(NguoiDung u, HttpServletRequest request) {
		try {
			usvc.create(u);
			pageNumber = 0;
			request.getSession().setAttribute("message", "Thêm người dùng thành công!");
			return "redirect:/nguoi-dung/index";
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Thêm người dùng thất bại!");
			return "redirect:/nguoi-dung/create";
		}
	}

	@GetMapping("/delete")
	public String delete(@RequestParam(name = "id") int id, HttpServletRequest request) {
		try {
			usvc.delete(id);
			pageNumber = 0;
			request.getSession().setAttribute("message", "Xóa người dùng thành công!");

		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Xóa người dùng thất bại!");
		}
		return "redirect:/nguoi-dung/index";
	}

	@GetMapping("/edit")
	public String edit(ModelMap map, @RequestParam(name = "id") int id) {
		map.addAttribute("u", usvc.findById(id));
		map.addAttribute("view", "/WEB-INF/views/admin/user/edit.jsp");
		return "layout";
	}

	@PostMapping("/update")
	public String update(ModelMap map, @RequestParam(name = "id") int id, NguoiDung s, HttpServletRequest request) {
		try {
			s.setId(id);
			usvc.update(s);
			request.getSession().setAttribute("message", "Chỉnh sửa người dùng thành công!");
			return "redirect:/nguoi-dung/index";
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Chỉnh sửa người dùng thất bại!");
			return "redirect:/nguoi-dung/edit?id=" + id;
		}
	}

	@GetMapping("/deleteList")
	public String deleteList(String[] chk, HttpServletRequest request) {
		if (chk != null) {
			List<Integer> list = new ArrayList<>();
			for (String c : chk) {
				list.add(Integer.parseInt(c));
			}
			usvc.delete(list);
			pageNumber = 0;
			request.getSession().setAttribute("message", "Người dùng đã bạn chọn đã bị xóa!");
		} else {
			request.getSession().setAttribute("error", "Vui lòng chọn người dùng cần xóa!");
	
		}
		return "redirect:/nguoi-dung/index";
	}

}
