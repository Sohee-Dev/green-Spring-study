package com.example.test01.repository;

import com.example.test01.entity.BoardEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BoardRepository extends JpaRepository<BoardEntity, Long> {

    @Query("SELECT b FROM BoardEntity b JOIN FETCH b.memberEntity")
    List<BoardEntity> findAllWithMember();
}
