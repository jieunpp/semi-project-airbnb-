package com.toy.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Host {
    private int h_no;
    private String h_name;
    private String h_brand;
    private String h_mail;
    private String h_phone;
    private String h_pw;
    private Timestamp h_join;
}
