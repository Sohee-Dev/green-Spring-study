package com.example.jjwt01.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="tbl_member4")
@Getter
@Setter
@ToString
public class MemberEntity {

	@Id
	private String username;
	private String password;
	private String name;
	private String role;
	
}
