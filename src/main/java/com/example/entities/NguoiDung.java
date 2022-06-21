package com.example.entities;

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
@Table(name = "nguoidung")
@Getter
@Setter
@NoArgsConstructor
@ToString
public class NguoiDung {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="email", columnDefinition = "nvarchar(255)")
	private String email;
	
	@Column(name="matkhau", columnDefinition = "nvarchar(255)")
	private String matkhau;
	
	@Column(name="gioitinh")
	private Boolean gioitinh;
	
	@Column(name = "diachi", columnDefinition = "nvarchar(255)")
	private String diachi;
	
	@Column(name="ngaytao")
	private Date ngaytao;
	
	@Column(name="vaitro")
	private Boolean vaitro;
	
	@Column(name="hoten", columnDefinition = "nvarchar(255)")
	private String hoten;
	
	@Column(name="hinhanh", columnDefinition = "nvarchar(255)")
	private String hinhanh;
}
