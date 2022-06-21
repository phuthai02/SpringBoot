package com.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.entities.GioHang;

public interface ICartRepository extends JpaRepository<GioHang, Integer> {
	@Query("select o from GioHang o where o.nguoidungid = ?1 order by o.id desc")
	List<GioHang> findByNguoiDungId(int nguoidungid);

	@Query("select o from GioHang o where o.nguoidungid = ?1 and o.sanphamid = ?2")
	GioHang findByNguoiDungIdAndSanPhamId(int nguoidungid, int sanphamid);
	
	@Modifying
	@Query("delete from GioHang o where o.nguoidungid=:nguoidungid and o.sanphamid=:sanphamid")
	void deleteByNguoiDungIdAndSanPhamId(@Param("nguoidungid") int nguoidungid,
			@Param("sanphamid") int sanphamid);
	
	@Modifying
	@Query("delete from GioHang o where o.nguoidungid=:nguoidungid")
	void deleteByNguoiDungId(@Param("nguoidungid") int nguoidungid);
	
	List<GioHang> findBySanphamid(Integer sanphamid);
}
