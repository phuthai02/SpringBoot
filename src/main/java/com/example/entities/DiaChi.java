package com.example.entities;


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
@Table(name = "diachi")
@Getter
@Setter
@NoArgsConstructor
@ToString
public class DiaChi {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "nguoidungid")
	private Integer nguoidungid;

	@Column(name = "diachi", columnDefinition = "nvarchar(255)")
	private String diachi;

	@Column(name = "hoten", columnDefinition = "nvarchar(255)")
	private String hoten;

	@Column(name = "sodienthoai", columnDefinition = "nvarchar(255)")
	private String sodienthoai;

}
