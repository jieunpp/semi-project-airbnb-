package com.toy.project.mapper.sql;

import com.toy.project.dto.Users;
import com.toy.project.security.AuthValue;
import org.apache.ibatis.jdbc.SQL;
import org.apache.jasper.tagplugins.jstl.core.Set;

public class UserSQL {

    private static final String USERS = "USERS";


    public String insertUser(AuthValue authValue, Users user) {
        System.out.println(user.getU_phone());
        return new SQL()
                .INSERT_INTO(USERS)
                .VALUES("SC_NO", "#{authValue.sc_no}")
                .VALUES("U_MAIL", "#{authValue.username}")
                .VALUES("U_NAME", "#{user.u_name}")
                .VALUES("U_NICK", "#{user.u_nick}")
                .VALUES("U_PW", "#{authValue.password}")
                .VALUES("U_GENDER", "#{user.u_gender}")
                .VALUES("U_PHONE", "#{user.u_phone}")
                .toString();
    }

    public String loadUserBySecurityNo(int sc_no) {
        return new SQL()
                .SELECT("*")
                .FROM(USERS)
                .WHERE("SC_NO = #{sc_no}")
                .toString();
    }

    public String updateUserInfo(Users user) {
        return new SQL()
        .UPDATE("USERS")
        .SET("U_NICK = #{user.u_nick}")
        .SET("U_PHONE = #{user.u_phone}")
        .WHERE("U_NO = CAST(#{user.u_no} AS INTEGER)")
        .toString();
    }

    public String getBook(String u_no){
        return new SQL()
                .SELECT("*")
                .FROM("BOOKING")
                .JOIN("ROOMS R on R.R_NO = BOOKING.B_RNO")
                .JOIN("HOUSE G on G.GH_NO = R.R_GHNO")
                .JOIN("HOST H on H.H_NO = G.GH_HNO")
                .WHERE("B_UNO =  CAST(#{u_no}AS INTEGER) ")
                .ORDER_BY("B_TIME desc")
                .LIMIT(1)
                .toString();
    }

    public String getOneUser(int u_no) {
        return new SQL()
                .SELECT("*")
                .FROM("USERS")
                .WHERE("U_NO = CAST(#{u_no}AS INTEGER)")
                .toString();
    }

    // UsermyPage-> getBookList
    public String getMyBookList(String u_no){
        return new SQL()
                .SELECT("GH_NO, GH_IMAGE, GH_NAME, GH_ADDR1, GH_ADDR2, " +
                        "       R_NO, R_NAME, R_FEE, " +
                        "       U_NO, U_PHONE, U_NICK, U_GENDER, B_NO,B_NO, B_IN, " +
                        "       B_OUT, B_PNO, B_STATE, B_TIME, " +
                        "       H_NO, H_PHONE")
                .FROM("USERS")
                .JOIN("BOOKING B on USERS.U_NO = B.B_UNO")
                .JOIN("ROOMS R on R.R_NO = B.B_RNO")
                .JOIN("HOUSE G on G.GH_NO = R.R_GHNO")
                .JOIN("HOST H on H.H_NO = G.GH_HNO")
                .WHERE("U_NO = CAST(#{u_no}AS INTEGER)")
                .ORDER_BY("B_TIME DESC")
                .toString();
    }
    public String check_mail(String u_mail){
        return new SQL()
                .SELECT("count(*)")
                .FROM("SECURITY")
                .WHERE("USERNAME= #{u_mail}")
                .toString();
    }

    public String nickCheck(String u_nick){
        return new SQL()
                .SELECT("count(*)")
                .FROM("USERS")
                .WHERE("U_NICK = #{U_NICK}")
                .toString();
    }

    public String userBookingCancel(int b_no, int u_no){
        return new SQL()
                .UPDATE("BOOKING")
                .SET("B_STATE = 3")
                .WHERE("B_NO = #{b_no}")
                .WHERE("B_UNO = #{u_no}")
                .toString();
    }

    public String myBookSelectOneDetail(String b_no, String u_no){
        return new SQL()
                .SELECT("*")
                .FROM("USERS")
                .JOIN("BOOKING B on USERS.U_NO = B.B_UNO")
                .JOIN("ROOMS R on R.R_NO = B.B_RNO")
                .JOIN("HOUSE G on G.GH_NO = R.R_GHNO")
                .JOIN("HOST H on H.H_NO = G.GH_HNO")
                .WHERE("B_NO = CAST(#{b_no}AS INTEGER)")
                .WHERE("U_NO = CAST(#{u_no}AS INTEGER)")
                .toString();
    }

//    public String bookingCancel(int b_state, int b_no){
//        return new SQL()
//                .UPDATE("BOOKING")
//                .SET("B_STATE = #{b_state}")
//                .WHERE("B_NO = #{b_no}")
//                .toString();
//    }


}
