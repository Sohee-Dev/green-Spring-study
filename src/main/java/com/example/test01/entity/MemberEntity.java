package com.example.test01.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.*;

@Entity
@Table(name="tbl_member3")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class MemberEntity {

    @Id
    @Column(length = 30)
    @Pattern(regexp = "^[a-zA-Z][a-zA-Z0-9]{3,29}$", message = "ID는 영문자로 시작하고 영문자와 숫자 조합의 4~30자여야 합니다.")
    private String id;

    @Column(length = 20)
    @Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#$%^&*()\\-_=+\\[\\]{};:'\",.<>/?\\\\|`~])[A-Za-z][A-Za-z\\d!@#$%^&*()\\-_=+\\[\\]{};:'\",.<>/?\\\\|`~]{7,19}$",
            message = "비밀번호는 영문으로 시작하고, 영문/숫자/특수문자를 모두 포함한 8~20자여야 합니다.")
    private String password;

    private String name;

    @Column(length = 13)
    @Size(max = 13, message = "전화번호는 최대 13자리까지 입력됩니다.")
    @Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$", message = "전화번호 형식이 올바르지 않습니다.(예: 010-1234-5678)")
    private String phone;

}
