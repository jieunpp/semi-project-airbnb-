package com.toy.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;


import java.sql.Date;
import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BookingRoomGhouseUsers {

    private int b_no;
    private Date b_in;
    private Date b_out;
    private int b_state;
    private int b_price;
    private int b_pno;
    private Timestamp b_time;
    private int b_rno;
    private int b_uno;

    private int r_no;
    private String r_name;
    private int r_per;
    private int r_fee;
    private String r_detail;
    private String r_title;
    private int r_ghno;

    private int gh_no;
    private String gh_name;
    private String gh_image;
    private String gh_addr1;
    private String gh_addr2;
    private String gh_detail;
    private String gh_title;
    private int gh_hno;

    private int u_no;
    private String u_name;
    private String u_nick;
    private String u_mail;
    private String u_gender;
    private String u_phone;
    private String u_pw;
    private Timestamp u_join;

    private String h_mail;
    private String h_brand;
    private String h_name;
    private String h_phone;
    private String h_pw;
    private Timestamp h_join;
}
