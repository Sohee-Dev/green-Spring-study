package com.example.jjwt01.controller;

import java.nio.charset.StandardCharsets;
import java.util.Date;

import javax.crypto.SecretKey;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpClientErrorException.BadRequest;

import com.example.jjwt01.Demo9Application;
import com.example.jjwt01.dto.LoginDTO;
import com.example.jjwt01.entity.MemberEntity;
import com.example.jjwt01.repository.MemberRepository;
import com.example.jjwt01.utils.JWTUtil;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.JwtParser;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
public class JwtTestController {

    private final Demo9Application demo9Application;
    
    @Autowired
    private MemberRepository memberRepository;
	
	@Value("${spring.jwt.secret}")
	private String secretKey;
	
	@Autowired
	private JWTUtil jwtUtil;

    JwtTestController(Demo9Application demo9Application) {
        this.demo9Application = demo9Application;
    }
	
	@PostMapping("/login")
	public ResponseEntity<String> login(@RequestBody LoginDTO loginDTO, 
						HttpServletResponse response, Model model) {
		
		MemberEntity member = memberRepository.findByUsernameAndPassword(loginDTO.getUsername(), loginDTO.getPassword());
		
		//로그인 성공 하면
		if(member != null) {
			//토큰이 만들어짐 (makeJwt), 토큰 준비
			String token = makeJwt(member.getUsername(), member.getRole(), member.getName());
			
			//토큰 발행
			response.setHeader("userAuth", token);
			model.addAttribute("token", true);
			model.addAttribute("msg", "로그인 성공");
			return ResponseEntity.ok().build();
		}
		
		
		return ResponseEntity.badRequest().build();
	}

	//토큰 생성
	private String makeJwt(String username, String role, String name) {
		String jwt = jwtUtil.createJwt(username, role, name, 1000*60*1l);
		String token ="Bearer " + jwt;
		return token;
	}
	
	@GetMapping("/user")
	public ResponseEntity<String> getUserInfo(HttpServletRequest request) {
//		String userAuth = request.getHeader("userAuth");
//		
//		if(userAuth == null || userAuth.isEmpty()) {
//			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("인증이 필요합니다.");
//		}
//		
//		String jwt = userAuth.split(" ")[1];
//		
//		try {
//			SecretKey key = Keys.hmacShaKeyFor(secretKey.getBytes(StandardCharsets.UTF_8));
//			JwtParser parser = Jwts.parser()
//					.verifyWith(key)
//					.build();
//			
//			Jws<Claims> jws = parser.parseSignedClaims(jwt); // 서명 검증 + 파싱
//			Claims claims = jws.getPayload();
//			
//			Date iat = claims.getIssuedAt(); 	//iat
//			Date exp = claims.getExpiration();	//exp
//			
//			System.out.println("발급(iat) : " + iat);
//			System.out.println("만료(exp) : " + exp);
//		}catch(Exception e){
//			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("토큰이 만료되었습니다. 재로그인 해주세요.");
//		}
		
		
		
//		String username = jwtUtil.getUsername(jwt);
//		String name = jwtUtil.getName(jwt);
//		String role = jwtUtil.getRole(jwt);
		//String email = jwtUtil.getUseremail(jwt);
		
		
		
		String username = (String) request.getAttribute("username");
		String name = (String) request.getAttribute("name");
		String role = (String) request.getAttribute("role");
		
		return ResponseEntity.ok().body(username + ", " + name + ", " + role);
	}
}
