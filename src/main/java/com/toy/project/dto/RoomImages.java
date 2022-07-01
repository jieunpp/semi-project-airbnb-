package com.toy.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class RoomImages {
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
