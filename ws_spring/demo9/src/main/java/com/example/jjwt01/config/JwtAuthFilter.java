package com.example.jjwt01.config;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Date;

import javax.crypto.SecretKey;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.jjwt01.utils.JWTUtil;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.JwtParser;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class JwtAuthFilter implements Filter{
	
	private final JWTUtil jwtUtil;
	
	public JwtAuthFilter(JWTUtil jwtUtil) {
		this.jwtUtil = jwtUtil;
	}
	

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		
		HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        String userAuth = req.getHeader("userAuth");
        System.out.println(userAuth);
		
		if(userAuth == null || userAuth.isEmpty()) {
			res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			return;
		}
		
		String jwt = userAuth.split(" ")[1];
		
		try {
			SecretKey key = jwtUtil.getSecretKey();
			JwtParser parser = Jwts.parser()
					.verifyWith(key)
					.build();
			
			Jws<Claims> jws = parser.parseSignedClaims(jwt); // 서명 검증 + 파싱
			Claims claims = jws.getPayload();
			
			Date iat = claims.getIssuedAt(); 	//iat
			Date exp = claims.getExpiration();	//exp
			
			System.out.println("발급(iat) : " + iat);
			System.out.println("만료(exp) : " + exp);
			
			String username = jwtUtil.getUsername(jwt);
			String name = jwtUtil.getName(jwt);
			String role = jwtUtil.getRole(jwt);
			
			req.setAttribute("username", username);
			req.setAttribute("name", name);
			req.setAttribute("role", role);
			
			chain.doFilter(request, response);
		}catch(Exception e){
			System.out.println(e.toString());
			res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			return;
		}
	}
	
}
