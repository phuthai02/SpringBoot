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
@Table(name = "giohang")
@Getter
@Setter
@NoArgsConstructor
@ToString
public class GioHang {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "nguoidungid")
	private Integer nguoidungid;
	
	@Column(name = "sanphamid")
	private Integer sanphamid;
	
	@Column(name = "soluong")
	private Integer soluong;
	
	@Column(name = "ngaytao")
	private Date ngaytao;
	
	@Column(name = "tensanpham", columnDefinition = "nvarchar(255)")
	private String tensanpham;
	
	@Column(name = "theloai")
	private TheLoai theloai;
	
	@Column(name = "capdo")
	private CapDo capdo;
	
	@Column(name = "hinhanh", columnDefinition = "nvarchar(255)")
	private String hinhanh;
	
	@Column(name = "gia")
	private BigDecimal gia;
}
