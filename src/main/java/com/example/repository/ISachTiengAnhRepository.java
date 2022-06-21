package com.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.entities.CapDo;
import com.example.entities.SachTiengAnh;

public interface ISachTiengAnhRepository extends JpaRepository<SachTiengAnh, Integer> {
	@Query("Select o from SachTiengAnh o where o.tenSach like ?1")
	List<SachTiengAnh> findByTenSachLike(String tenSach);
	@Query("Select o from SachTiengAnh o where o.tenSach like ?1 and o.capDo=?2")
	List<SachTiengAnh> findByTenSachAndCapDoLike(String tenSach, CapDo capDo);
	void deleteByIdIn(List<Integer> ids);
	
}
