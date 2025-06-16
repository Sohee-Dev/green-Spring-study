package com.example.test01.service;

import com.example.test01.dto.BoardDTO;
import com.example.test01.entity.BoardEntity;
import com.example.test01.entity.MemberEntity;
import com.example.test01.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BoardService {
    @Autowired
    ChangeEntityDTO changeEntityDTO;

    @Autowired
    BoardRepository boardRepository;

    public String insertBoard(BoardDTO boardDTO){
        BoardEntity board = changeEntityDTO.toBoardEntity(boardDTO);
        String msg = "";
        try {
            BoardEntity boardEntity = boardRepository.save(board);
            if(boardEntity.getBno() != null){
                msg = "게시글 등록 성공";
            }
        }catch (Exception e){
            msg = "등록 실패: " + e.getMessage();
        }
        return msg;
    }

    public String updateBoard(BoardDTO boardDTO){
        Optional<BoardEntity> Opboard = boardRepository.findById(boardDTO.getBno());
        BoardEntity boardEntity =Opboard.get();
        boardEntity.setContent(boardDTO.getContent());
        boardEntity.setTitle(boardDTO.getTitle());
                String msg = "";
        try {
            BoardEntity board= boardRepository.save(boardEntity);
            if(board.getBno() != null){
                msg = "게시글 업데이트 성공";
            }
        }catch (Exception e){
            msg = "업데이트 실패: "  + e.getMessage();
        }
        return msg;
    }

    public List<BoardEntity> boardList(){
        List<BoardEntity> list = boardRepository.findAllWithMember();

        return list;
    }

    public BoardEntity boardInfo(long bno) {
        Optional<BoardEntity> board = boardRepository.findById(bno);
        BoardEntity boardEntity = null;
        if (board.isPresent()) {
            boardEntity = board.get();
        }

        return boardEntity;
    }

    public String boardDelete(long bno){
        boardRepository.deleteById(bno);
        return "삭제완료";
    }

}
