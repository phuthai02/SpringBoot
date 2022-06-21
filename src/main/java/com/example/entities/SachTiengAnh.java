package com.example.entities;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "sanpham")
@Getter
@Setter
@NoArgsConstructor
@ToString
public class SachTiengAnh {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "tensach", columnDefinition = "nvarchar(255)")
	private String tenSach;
	
	@Column(name = "theloai")
	private TheLoai theLoai;
	
	@Column(name = "capdo")
	private CapDo capDo;
	
	@Column(name = "gia")
	private BigDecimal gia;
	
	@Column(name = "hinhanh", columnDefinition = "nvarchar(255)")
	private String hinhAnh;
	
	@Column(name = "ngaytao")
	private Date ngayTao;
	
	@Column(name = "sotrang")
	private Integer soTrang;
	
	@Column(name = "soluong")
	private Integer soLuong;

}
