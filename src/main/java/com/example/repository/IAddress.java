package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entities.DiaChi;

public interface IAddress extends JpaRepository<DiaChi,Integer>{
	DiaChi findByNguoidungid(int nguoidungid);
}
