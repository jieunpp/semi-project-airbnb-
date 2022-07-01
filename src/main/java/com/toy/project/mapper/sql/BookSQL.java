package com.toy.project.mapper.sql;

import com.toy.project.dto.Booking;
import com.toy.project.dto.BookingRoomGhouseUsers;
import org.apache.ibatis.jdbc.SQL;

public class BookSQL {

    public String insertBook(Booking booking) {
        return new SQL()
                .INSERT_INTO("booking")
                .INTO_COLUMNS("B_PRICE","B_IN", "B_OUT", "B_PNO","B_STATE", "B_RNO", "B_UNO")
                .INTO_VALUES("#{booking.b_price}","#{booking.b_in}", "#{booking.b_out}","#{booking.b_pno}", "#{booking.b_state}", "#{booking.b_rno}", "#{booking.b_uno}")
                .toString();
    }

    //    public String getBookInfo(int u_no, int r_no){
//        return new SQL()
//                .SELECT("GH_NO, GH_IMAGE, GH_NAME, GH_ADDR1, GH_ADDR2," +
//                        "R_NO, R_NAME, R_FEE," +
//                        "U_NO, U_PHONE, U_NICK, U_GENDER," +
//                        "B_NO, DATE_FORMAT(B_IN, '%Y-%m-%d')'B_IN', DATE_FORMAT(B_OUT, '%Y-%m-%d')'B_OUT', B_PNO, B_STATE, B_JOIN")
//                .FROM("USERS join BOOKING B on USERS.U_NO = B.B_UNO join ROOMS R on R.R_NO = B.B_RNO " +
//                        "join GHOUSE G on G.GH_NO = R.R_GHNO join HOST H on H.H_NO = G.GH_HNO")
//                .WHERE("U_NO=#{u_no}")
//                .WHERE("R_NO=#{r_no}")
//                .ORDER_BY("B_JOIN DESC")
//                .toString();
//    }

    public String getBookingConfirm(BookingRoomGhouseUsers info) {
        return "select gh_image, gh_name, gh_addr1, gh_addr2, r_name, r_fee, u_no , u_phone, u_nick, u_gender\n" +
                "from house, rooms ,users\n" +
                "where gh_no = (select r_ghno from rooms where r_no = #{info.r_no})\n" +
                "and r_no = #{info.r_no}\n" +
                "and u_no = #{info.u_no}";
    }
    public String bookingListForHost(int h_no) {
        return new SQL()
                .SELECT("BOOKING.*, R_NAME, U.U_NAME, U.U_PHONE, G.GH_NAME")
                .FROM("BOOKING")
                .JOIN("USERS U on BOOKING.B_UNO = U.U_NO")
                .JOIN("ROOMS R on R.R_NO = BOOKING.B_RNO")
                .JOIN("HOUSE G on R.R_GHNO = G.GH_NO")
                .JOIN("HOST H on G.GH_HNO = H.H_NO")
                .WHERE("H.H_NO = #{h_no}")
                .toString();
    }

    public String updateBookingState(int b_no, int b_state) {
        return new SQL()
                .UPDATE("BOOKING")
                .SET("B_STATE = #{b_state}")
                .WHERE("B_NO = #{b_no}")
                .toString();
    }

    public String getUserInfo(int u_no){
        return new SQL()
                .SELECT("*")
                .FROM("booking")
                .WHERE("B_UNO = #{u_no}")
                .toString();
    }

    public String bookConfirmInfo(int u_no, int r_no){
        return new SQL()
                .SELECT("*")
                .FROM("booking")
                .WHERE("B_UNO = #{u_no}")
                .WHERE("B_RNO = #{r_no}")
                .toString();
    }

}
