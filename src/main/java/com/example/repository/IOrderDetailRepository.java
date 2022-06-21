package com.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.example.entities.DonHangChiTiet;

public interface IOrderDetailRepository extends JpaRepository<DonHangChiTiet, Integer> {
	@Query("Select o from DonHangChiTiet o where o.madonhang = ?1")
	List<DonHangChiTiet> findByMaDonHang(String madonhang);
	@Modifying
	@Query("Delete from DonHangChiTiet o where o.madonhang = ?1")
	Integer deleteByMaDonHang(String madonhang);
	@Query("select o.tensanpham, sum(o.soluong)"
			+ " from DonHangChiTiet o"
			+ " group by o.tensanpham"
			+ " order by sum(o.soluong) DESC")
	List<Object[]> selectByQuantity();
	@Query("select o.tensanpham, sum(o.gia*o.soluong)"
			+ " from DonHangChiTiet o"
			+ " group by o.tensanpham"
			+ " order by sum(o.gia*o.soluong) DESC")
	List<Object[]> selectBySales();
}

