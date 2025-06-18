package com.example.jjwt01.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.jjwt01.entity.MemberEntity;

public interface MemberRepository extends JpaRepository<MemberEntity, String>{

	MemberEntity findByUsernameAndPassword(String username, String password);
}
