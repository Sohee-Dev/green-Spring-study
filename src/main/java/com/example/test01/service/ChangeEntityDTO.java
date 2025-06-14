package com.example.test01.service;

import com.example.test01.dto.BoardDTO;
import com.example.test01.dto.MemberDTO;
import com.example.test01.entity.BaseEntity;
import com.example.test01.entity.BoardEntity;
import com.example.test01.entity.MemberEntity;
import org.springframework.stereotype.Component;

@Component
public class ChangeEntityDTO {
    public MemberDTO toDTO(MemberEntity memberEntity){
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setId(memberEntity.getId());
        memberDTO.setName(memberEntity.getName());
        memberDTO.setPassword(memberEntity.getPassword());
        memberDTO.setPhone(memberEntity.getPhone());

        return memberDTO;
    }

    public MemberEntity toEntity(MemberDTO memberDTO){
        MemberEntity memberEntity = new MemberEntity();
        memberEntity.setId(memberDTO.getId());
        memberEntity.setName(memberDTO.getName());
        memberEntity.setPassword(memberDTO.getPassword());
        memberEntity.setPhone(memberDTO.getPhone());

        return memberEntity;
    }

    public BoardEntity toBoardEntity(BoardDTO boardDTO){
        BoardEntity boardEntity = new BoardEntity();
        MemberEntity memberEntity = new MemberEntity();
        memberEntity.setId(boardDTO.getId());

        boardEntity.setTitle(boardDTO.getTitle());
        boardEntity.setContent(boardDTO.getContent());
        boardEntity.setMemberEntity(memberEntity);

        return boardEntity;
    }

    public BoardDTO toBoardDTO(BoardEntity boardEntity){
        BoardDTO boardDTO = new BoardDTO();

        boardDTO.setBno(boardEntity.getBno());
        boardDTO.setTitle(boardEntity.getTitle());
        boardDTO.setContent(boardEntity.getContent());
        boardDTO.setId(boardEntity.getMemberEntity().getId());
        boardDTO.setRegdate(boardEntity.getCreatedAt().toLocalDate());
        boardDTO.setModdate(boardEntity.getModifiedAt().toLocalDate());

        return boardDTO;
    }
}
