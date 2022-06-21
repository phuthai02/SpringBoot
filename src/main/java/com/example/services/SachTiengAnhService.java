package com.example.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.entities.CapDo;
import com.example.entities.SachTiengAnh;
import com.example.repository.ISachTiengAnhRepository;

@Service
public class SachTiengAnhService {
	@Autowired
	private ISachTiengAnhRepository repository;
	
	public SachTiengAnh update(SachTiengAnh p) throws Exception {
		int id = p.getId();
		p.setNgayTao(repository.findById(id).get().getNgayTao());
		if (repository.findById(id).isPresent())
			return repository.save(p);
		else
			throw new Exception("Không tồn tại");
	}

	public SachTiengAnh add(SachTiengAnh p) {
		p.setId(null);
		p.setNgayTao(new Date());
		return repository.save(p);
	}

	public SachTiengAnh findById(Integer id) {
		if(repository.findById(id).isPresent()) {
			return repository.findById(id).get();
		} else return null;
	}

	public Integer delete(Integer id) throws Exception {
		if (repository.findById(id).isPresent()) {
			repository.deleteById(id);
			return id;
		} else
			throw new Exception("Không tìm thấy");
	}

	public List<SachTiengAnh> findByNameLike(String tenSach) {
		return repository.findByTenSachLike(tenSach);
	}

	public List<SachTiengAnh> findByNameAndTypeLike(String tenSach, CapDo capDo) {
		return repository.findByTenSachAndCapDoLike(tenSach, capDo);
	}
	
	public List<SachTiengAnh> getAll() {
		return repository.findAll();
	}

	public Page<SachTiengAnh> getPage(int pageIndex, Boolean sortType) {
		if (sortType) {
			return repository.findAll(PageRequest.of(pageIndex, 10, Sort.by("id").ascending()));
		} else {
			return repository.findAll(PageRequest.of(pageIndex, 10, Sort.by("id").descending()));
		}
	}
	
	public List<Integer> delete(List<Integer> list) {
		if (list != null) {
			List<SachTiengAnh> listu = repository.findAllById(list);
			repository.deleteAll(listu);
			return list;
		} else
			return null;
	}

}
