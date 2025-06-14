package com.example.test01.controller;

import com.example.test01.dto.BoardDTO;
import com.example.test01.entity.BoardEntity;
import com.example.test01.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class BoardController {

    @Autowired
    BoardService boardService;

    @GetMapping("/insertBoardForm")
    public String insertBoardForm() {
        return "boardForm";
    }

    @PostMapping("/insertBoard")
    public String insertBoard(BoardDTO boardDTO, @RequestParam("id")String id, RedirectAttributes rttr){
        boardDTO.setId(id);
        System.out.println(boardDTO);
        String result = boardService.insertBoard(boardDTO);
        rttr.addFlashAttribute("msg", result);

        return "redirect:/";
    }

    @GetMapping("/boardList")
    public String boardList(Model model){
        List<BoardEntity> list = boardService.boardList();
        model.addAttribute("list", list);
        return "boardList";
    }

    @GetMapping("/boardInfo/{bno}")
    public String boardInfo(@PathVariable("bno")long bno, Model model){
        BoardEntity board = boardService.boardInfo(bno);
        model.addAttribute("board", board);
        return "boardInfo";
    }

    @GetMapping("/boardDelete/{bno}")
    public String boardDelete(@PathVariable("bno")long bno, RedirectAttributes rttr){
        String result = boardService.boardDelete(bno);
        rttr.addFlashAttribute("msg", result);
        return "redirect:/boardList";
    }

    @GetMapping("/boardUpdateForm/{bno}")
    public String boardUpdateForm(@PathVariable("bno")long bno, Model model){
        BoardEntity board = boardService.boardInfo(bno);
        model.addAttribute("board", board);
        return "boardUpdateForm";
    }

    @PostMapping("/boardUpdate")
    public String boardUpdate(BoardDTO boardDTO, RedirectAttributes rttr){
        String result = boardService.updateBoard(boardDTO);
        rttr.addFlashAttribute("msg", result);
        return "redirect:/boardList";
    }
}
