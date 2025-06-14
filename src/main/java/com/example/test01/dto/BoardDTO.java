package com.example.test01.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class BoardDTO {
    private long bno;
    private String title;
    private String content;
    private String id;
    private LocalDate regdate;
    private LocalDate moddate;
}
