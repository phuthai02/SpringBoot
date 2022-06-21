package com.example.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.services.OrderDetailService;

@Controller
@RequestMapping("/thong-ke")
public class ChartController {
	@Autowired
	private OrderDetailService odSer;

	@GetMapping("/san-pham")
	public String sanpham(ModelMap map) {
		
		List<Object[]> list = odSer.getByQuantity();
		List<Object[]> list2 = odSer.getBySales();
		
		String listString = "[";
		String listString2 = "[";

		for (int i = 0; i < 5; i++) {
			listString += "{name:'" + list.get(i)[0] + "', value:" + list.get(i)[1] + "},";
		}
		for (int i = 0; i < 5; i++) {
			listString2 += "{name:'" + list2.get(i)[0] + "', value:" + list2.get(i)[1] + "},";
		}
		
		listString += "]";
		listString2 += "]";
		
		map.addAttribute("listString", listString);
		map.addAttribute("listString2", listString2);
		
		map.addAttribute("list", list);
		map.addAttribute("list2", list2);
		
		
		map.addAttribute("view", "/WEB-INF/views/chart/index.jsp");
		return "layout";
	}
}
