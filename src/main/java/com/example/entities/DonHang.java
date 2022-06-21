package com.example.entities;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "donhang")
@Getter
@Setter
@NoArgsConstructor
@ToString
public class DonHang {
	@Id
	@Column(name = "madonhang", columnDefinition = "nvarchar(255)")
	private String madonhang;
	
	@Column(name = "nguoidungid")
	private Integer nguoidungid;
	
	@Column(name = "tongsanpham")
	private Integer tongsanpham;
	
	@Column(name = "tongtien")
	private BigDecimal tongtien;
	
	@Column(name = "ngaytao")
	private Date ngaytao;
	
	@Column(name = "diachi", columnDefinition = "nvarchar(255)")
	private String diachi;
	
	@Column(name = "trangthai", columnDefinition = "nvarchar(255)")
	private String trangthai;
	
	@Column(name = "ship")
	private BigDecimal ship;
	
	@Column(name = "hoten", columnDefinition = "nvarchar(255)")
	private String hoten;
	
	@Column(name = "sodienthoai", columnDefinition = "nvarchar(255)")
	private String sodienthoai;
	
	@Column(name = "giaohang", columnDefinition = "nvarchar(255)")
	private String giaohang;
	
	@Column(name = "thanhtoan", columnDefinition = "nvarchar(255)")
	private String thanhtoan;
}
