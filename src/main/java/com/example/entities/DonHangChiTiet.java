package com.example.entities;

import java.math.BigDecimal;

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
@Table(name = "DonHangChiTiet")
@Getter
@Setter
@NoArgsConstructor
@ToString
public class DonHangChiTiet {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "madonhang", columnDefinition = "nvarchar(255)")
	private String madonhang;

	@Column(name = "sanphamid")
	private Integer sanphamid;

	@Column(name = "tensanpham", columnDefinition = "nvarchar(255)")
	private String tensanpham;

	@Column(name = "hinhanh", columnDefinition = "nvarchar(255)")
	private String hinhanh;

	@Column(name = "theloai")
	private TheLoai theloai;

	@Column(name = "capdo", columnDefinition = "nvarchar(255)")
	private CapDo capdo;

	@Column(name = "soluong")
	private Integer soluong;
	
	@Column(name = "gia")
	private BigDecimal gia;
}
