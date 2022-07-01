package com.toy.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class HouseRoomImages {
    private int gh_no;
    private String gh_name;
    private String gh_image;
    private String gh_addr1;
    private String gh_addr2;
    private String gh_detail;
    private String gh_title;
    private int gh_hno;

    private int r_no;
    private String r_name;
    private int r_per;
    private int r_fee;
    private String r_detail;
    private String r_title;
    private int r_ghno;

    private int i_no;
    private String i_name;
    private String i_path;
    private int i_rno;
}
