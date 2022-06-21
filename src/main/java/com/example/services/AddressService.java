package com.example.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.entities.DiaChi;
import com.example.repository.IAddress;
@Service
public class AddressService {
	@Autowired
	private IAddress aServ;

	public DiaChi create(DiaChi d) {
		d.setId(null);
		aServ.save(d);
		return d;
	}

	public DiaChi update(DiaChi d) {
		aServ.save(d);
		return d;
	}

	public Integer delete(Integer id) {
		aServ.deleteById(id);
		return id;
	}
	
	public DiaChi findByNguoiDungId(Integer id) {
		return aServ.findByNguoidungid(id);
	}
}
