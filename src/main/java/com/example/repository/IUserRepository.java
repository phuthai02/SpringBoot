package com.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.entities.NguoiDung;

public interface IUserRepository extends JpaRepository<NguoiDung, Integer> {
	@Query("Select o from NguoiDung o where o.hoten like ?1")
	List<NguoiDung> findByHoTenLike(String hoten);

	@Query("Select o from NguoiDung o where o.hoten like ?1 and o.vaitro=?2")
	List<NguoiDung> findByHoTenAndVaitroLike(String hoten, Boolean vaitro);

	NguoiDung findByEmail(String email);

	void deleteByIdIn(List<Integer> ids);
}
