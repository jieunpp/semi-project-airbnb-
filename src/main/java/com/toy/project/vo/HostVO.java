package com.toy.project.vo;

import lombok.*;

@AllArgsConstructor //모든 필드값을 파라미터로 받는 생성자
@NoArgsConstructor //기본생성자 생성
@Getter
@ToString
@EqualsAndHashCode(callSuper = true)
public class HostVO extends AuthInfo {
    private int h_no;
    private String h_mail;
    private String h_brand;
    private String h_name;
    private String h_pw;
    private String h_phone;
    private String h_join;
}
