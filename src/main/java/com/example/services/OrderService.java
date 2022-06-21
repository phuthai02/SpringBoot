package com.example.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.entities.DonHang;
import com.example.repository.IOrderRepository;

@Service
public class OrderService {
	@Autowired
	private IOrderRepository rep;

	public DonHang create(DonHang o) {
		o.setNgaytao(new Date());
		return rep.save(o);
	}

	public List<DonHang> findAll() {
		return rep.findAll();
	}

	public DonHang update(DonHang o) throws Exception {
		String id = o.getMadonhang();
		o.setNgaytao(rep.findById(id).get().getNgaytao());
		if (rep.findById(id).isPresent())
			return rep.save(o);
		else
			throw new Exception("Không tồn tại");
	}

	public String delete(String id) throws Exception {
		if (rep.findById(id).isPresent()) {
			rep.deleteById(id);
			return id;
		} else
			throw new Exception("Không tìm thấy");
	}

	public DonHang findById(String id) {
		if (rep.findById(id).isPresent()) {
			return rep.findById(id).get();
		} else {
			return null;
		}
	}

	public List<DonHang> findByNguoiDungId(int nguoidungid) {
		return rep.findByNguoiDungId(nguoidungid);
	}

	public List<DonHang> findByTrangThai(String trangthai) {
		return rep.findByTrangthai(trangthai);
	}

	public List<DonHang> findByNgayTaoBetween(Date from, Date to) {
		return rep.findByNgaytaoBetween(from, to);
	}

}
