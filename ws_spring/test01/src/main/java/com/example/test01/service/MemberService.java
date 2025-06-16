package com.example.test01.service;

import com.example.test01.dto.MemberDTO;
import com.example.test01.entity.MemberEntity;
import com.example.test01.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    MemberRepository memberRepository;

    @Autowired
    ChangeEntityDTO changeEntityDTO;

    public String registMember(MemberDTO member){
        MemberEntity memberEntity = changeEntityDTO.toEntity(member);
        String msg = "";
        try {
            MemberEntity memberEntity1 = memberRepository.save(memberEntity);
            if(memberEntity1.getId() != null){
                msg = "회원가입 성공";
            }
        }catch (Exception e){
            msg = "가입 실패: " + e.getMessage();
        }
        return msg;
    }

    public int login(MemberDTO memberDTO){
        int result = memberRepository.countByIdAndPassword(memberDTO.getId(), memberDTO.getPassword());

        return result;
    }
}
