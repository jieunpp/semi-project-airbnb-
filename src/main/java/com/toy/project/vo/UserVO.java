package com.toy.project.vo;

import lombok.*;

@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@Getter
@ToString
public class UserVO extends AuthInfo {
    private int u_no;
    private String u_mail;
    private String u_name;
    private String u_nick;
    private String u_gender;
    private String u_phone;
    private String u_join;

}
