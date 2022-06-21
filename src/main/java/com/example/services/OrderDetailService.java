package com.example.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.entities.DonHangChiTiet;
import com.example.repository.IOrderDetailRepository;

@Service
public class OrderDetailService {
	@Autowired
	private IOrderDetailRepository rep;

	public DonHangChiTiet create(DonHangChiTiet o) {
		o.setId(null);
		return rep.save(o);
	}

	public DonHangChiTiet update(DonHangChiTiet o) throws Exception {
		int id = o.getId();
		if (rep.findById(id).isPresent()) {
			return o;
		} else
			throw new Exception("Không tồn tại");
	}
	public List<Object[]> getByQuantity(){
		return rep.selectByQuantity();
	}
	public List<Object[]> getBySales(){
		return rep.selectBySales();
	}
	public Integer delete(Integer id) throws Exception {
		if (rep.findById(id).isPresent()) {
			rep.deleteById(id);
			return id;
		} else
			throw new Exception("Không tìm thấy");
	}

	public List<DonHangChiTiet> findByMaDonHang(String madonhang) {
		return rep.findByMaDonHang(madonhang);
	}
	
	@Transactional
	public Integer deleteByMaDonHang(String madonhang) {
		return rep.deleteByMaDonHang(madonhang);
	}
}
