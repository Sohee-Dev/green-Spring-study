package com.example.jjwt01.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.jjwt01.dto.LoginDTO;
import com.example.jjwt01.utils.JWTUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
public class JwtTestController {
	
	@Value("${spring.jwt.secret}")
	private String secretKey;
	
	@Autowired
	private JWTUtil jwtUtil;
	
	@PostMapping("/login")
	public String login(@RequestBody LoginDTO loginDTO, 
						HttpServletResponse response) {
		//로그인 성공 하면
		if("user01".equals(loginDTO.getUsername()) && "1234".equals(loginDTO.getPassword())) {
			//토큰이 만들어짐 (makeJwt), 토큰 준비
			String token = makeJwt(loginDTO.getUsername());
			
			//토큰 발행
			response.setHeader("userAuth", token);
			return "good";
		}
		
		
		return "bad";
	}

	private String makeJwt(String username) {
		String jwt = jwtUtil.createJwt(username);
		String token ="Bearer " + jwt;
		return token;
	}
	
	@GetMapping("/user")
	public String getUserInfo(HttpServletRequest request) {
		String userAuth = request.getHeader("userAuth");
		if(userAuth == null || userAuth.isEmpty()) {
			return "bad";
		}
		
		String jwt = userAuth.split(" ")[1];
		String username = jwtUtil.getUsername(jwt);
		
		return username;
	}
}
