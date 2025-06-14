package com.example.test01.controller;


import com.example.test01.dto.MemberDTO;
import com.example.test01.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {

    @Autowired
    MemberService memberService;

    @GetMapping("/")
    public String root(){
        return "index";
    }

    @GetMapping("/registForm")
    public String registForm(Model model){
        model.addAttribute("member", new MemberDTO());
        return "/registForm";
    }

    @PostMapping("/regist")
    public String regist(@Valid @ModelAttribute("member") MemberDTO memberDTO,
                         BindingResult bindingResult,
                         RedirectAttributes rttr){
        if(bindingResult.hasErrors()){
            return "/registForm";
        }
        String msg = memberService.registMember(memberDTO);
        rttr.addFlashAttribute("msg", msg);

        return "/index";
    }

    @GetMapping("/loginForm")
    public String loginForm(){
        return "loginForm";
    }

    @PostMapping("/login")
    public String login(MemberDTO memberDTO, HttpServletRequest request){
        HttpSession session = request.getSession();
        int result = memberService.login(memberDTO);
        if(result > 0){
            session.setAttribute("id", memberDTO.getId());
            return "/index";
        }
        return "loginForm";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, RedirectAttributes rttr){
        HttpSession session = request.getSession();
        session.invalidate();
        String msg = "로그아웃 되었습니다";
        rttr.addFlashAttribute("msg", msg);
        return "redirect:/";
    }

}
