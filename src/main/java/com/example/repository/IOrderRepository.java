package com.example.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.entities.DonHang;

public interface IOrderRepository extends JpaRepository<DonHang, String> {
	@Query("Select o from DonHang o where o.nguoidungid = ?1")
	List<DonHang> findByNguoiDungId(int nguoidungid);
	List<DonHang> findByTrangthai(String trangthai);
	List<DonHang> findByNgaytaoBetween(Date from, Date to);
}
