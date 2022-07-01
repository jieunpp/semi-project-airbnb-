package com.toy.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Review {
    private int rv_no; // 리뷰번호 x
    private String rv_content; // 내용 o
    private int rv_star; // 별갯수 o
    private String u_nick;

}
