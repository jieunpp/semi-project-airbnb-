package com.toy.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Booking {
    private int b_no;
    private Date b_in;
    private Date b_out;
    private int b_state;
    private int b_pno;
    private int b_price;
    private Timestamp b_time;
    private int b_rno;
    private int b_uno;

}
