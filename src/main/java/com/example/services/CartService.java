package com.example.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.entities.GioHang;
import com.example.repository.ICartRepository;

@Service
public class CartService {
	@Autowired
	private ICartRepository rep;
	
	public List<GioHang> findByNguoiDungId(int nguoidungid){
		return rep.findByNguoiDungId(nguoidungid);
	}
	
	@Transactional
	public void deleteByNguoiDungIdAndSanPhamId(int uid, int pid) {
		rep.deleteByNguoiDungIdAndSanPhamId(uid, pid);
	}
	
	public List<GioHang> findBySanPhamID(Integer pid) {
		return rep.findBySanphamid(pid);
	}
	
	@Transactional
	public void deleteByNguoiDungId(int uid) {
		rep.deleteByNguoiDungId(uid);
	}

	public GioHang findByNguoiDungIdAndSanPhamId(int uid, int pid) {
		return rep.findByNguoiDungIdAndSanPhamId(uid, pid);
	}

	public GioHang create(GioHang g) {
		g.setId(null);
		g.setNgaytao(new Date());
		return rep.save(g);
	}

	public GioHang update(GioHang g) throws Exception {
		int id = g.getId();
		g.setNgaytao(rep.findById(id).get().getNgaytao());
		if (rep.findById(id).isPresent())
			return rep.save(g);
		else
			throw new Exception("Không tồn tại");
	}

	public Integer delete(Integer id) throws Exception {
		if (rep.findById(id).isPresent()) {
			rep.deleteById(id);
			return id;
		} else
			throw new Exception("Không tìm thấy");
	}

}
