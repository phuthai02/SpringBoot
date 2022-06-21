package com.example.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.entities.NguoiDung;
import com.example.repository.IUserRepository;

@Service
public class UserService {
	@Autowired
	private IUserRepository rep;

	public NguoiDung findById(int id) {
		return rep.findById(id).get();
	}

	public NguoiDung findByEmail(String email) {
		return rep.findByEmail(email);
	}

	public NguoiDung create(NguoiDung u) {
		u.setId(null);
		u.setNgaytao(new Date());
		return rep.save(u);
	}

	public NguoiDung update(NguoiDung u) throws Exception {
		int id = u.getId();
		u.setNgaytao(rep.findById(id).get().getNgaytao());
		if (rep.findById(id).isPresent())
			return rep.save(u);
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

	public Page<NguoiDung> getPage(int pageIndex, Boolean sortType) {
		if (sortType) {
			return rep.findAll(PageRequest.of(pageIndex, 10, Sort.by("id").ascending()));
		} else {
			return rep.findAll(PageRequest.of(pageIndex, 10, Sort.by("id").descending()));
		}
	}

	public List<NguoiDung> findByNameLike(String hoten) {
		return rep.findByHoTenLike(hoten);
	}

	public List<NguoiDung> findByNameAndRoleLike(String hoten, Boolean vaitro) {
		return rep.findByHoTenAndVaitroLike(hoten, vaitro);
	}

	public List<Integer> delete(List<Integer> list) {
		if (list != null) {
			List<NguoiDung> listu = rep.findAllById(list);
			rep.deleteAll(listu);
			return list;
		} else
			return null;
	}

}
