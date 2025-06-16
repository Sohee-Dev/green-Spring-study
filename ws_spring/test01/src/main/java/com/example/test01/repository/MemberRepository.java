package com.example.test01.repository;

import com.example.test01.entity.MemberEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MemberRepository extends JpaRepository<MemberEntity, String> {

    Integer countByIdAndPassword(String id, String password);
}
