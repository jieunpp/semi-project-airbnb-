package com.toy.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor // 파라미터없는 기본 생성자
@AllArgsConstructor // 모든 필드값을 파라미터로 받는 생성자
@Data // getter, setter, toString, equals...
public class Users {
    private String u_no;
    private String u_name;
    private String u_nick;
    private String u_mail;
    private String u_gender;
    private String u_phone;
    private String u_pw;
    private Timestamp u_join;

}
