package com.example.jjwt01.utils;

import java.nio.charset.StandardCharsets;
import java.util.Date;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Jwts;

@Component
public class JWTUtil {
	private SecretKey secretKey;
	
	public JWTUtil(@Value("${spring.jwt.secret}")String secret) {
		this.secretKey = new SecretKeySpec(secret.getBytes(StandardCharsets.UTF_8),
									Jwts.SIG.HS256.key().build().getAlgorithm());
		
		System.out.println("secretKey: "+secretKey.toString() + ", algrithm: " + secretKey.getAlgorithm());									
	}
	
	//토큰에서 사용자 정보 추출
	public String getUsername(String token) {
		String username = Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token)
						  .getPayload().get("username", String.class);
		return username;
	}
	
	//토큰에서 이메일 정보 추출
	public String getUseremail(String token) {
		String email = Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token)
						  .getPayload().get("email", String.class);
		return email;
	}
	
	//토큰에서 이름 정보 추출
	public String getName(String token) {
		String name = Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token)
						  .getPayload().get("name", String.class);
		return name;
	}
	
	//토큰에서 역할 정보 추출
	public String getRole(String token) {
		String role = Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token)
						  .getPayload().get("role", String.class);
		return role;
	}
	
	//로그인 성공시 토큰 생성 : 시간 계산 - 1000 * 60 * 3L : 3분
	public String createJwt(String username, String role, String name, Long expirationMs) {
		String token = Jwts.builder()
						   .claim("username", username)
						   .claim("role", role)
						   .claim("name", name)
						   .issuedAt(new Date(System.currentTimeMillis()))
						   .expiration(new Date(System.currentTimeMillis() + expirationMs)) //토큰 유효시간
						   .signWith(secretKey)
						   .compact();
		return token;
	}
	
	public SecretKey getSecretKey() {
		return secretKey;
	}
}
