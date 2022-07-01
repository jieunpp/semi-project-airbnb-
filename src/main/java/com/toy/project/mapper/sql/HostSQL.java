package com.toy.project.mapper.sql;

import com.toy.project.dto.Host;
import com.toy.project.dto.House;
import com.toy.project.dto.Rooms;
import com.toy.project.security.AuthValue;
import org.apache.ibatis.jdbc.SQL;

public class HostSQL {
    public static final String GET_HOST_LIST = "SELECT * FROM HOST";

    public String insertHost(AuthValue authValue, Host host) {
        return new SQL()
                .INSERT_INTO("HOST")
                .VALUES("H_NO", "#{authValue.sc_no}")
                .VALUES("H_NAME","#{host.h_name}")
                .VALUES("H_BRAND","#{host.h_brand}")
                .VALUES("H_MAIL","#{authValue.username}")
                .VALUES("H_PHONE","#{host.h_phone}")
                .VALUES("H_PW","#{authValue.password}")
                .toString();
    }

    public String loadUserBySecurityNo(int sc_no) {
        return new SQL()
                .SELECT("*")
                .FROM("HOST")
                .WHERE("H_NO = #{sc_no}")
                .toString();
    }

    public String updateInfo(Host host) {
        return new SQL()
                .UPDATE("HOST")
                .SET("H_PHONE = #{host.h_phone}")
                .WHERE("H_NO = #{host.h_no}")
                .toString();
    }

    public String getOneHost(int h_no) {
        return new SQL()
                .SELECT("*")
                .FROM("HOST")
                .WHERE("H_NO = #{h_no}")
                .toString();
    }

    public String myHouse(int h_no){
        return new SQL()
                .SELECT("*")
                .FROM("HOUSE")
                .WHERE("GH_HNO = #{h_no}")
                .toString();
    }

    public String myPageHostGhouse(int h_no){
        return new SQL()
                .SELECT("*")
                .FROM("HOUSE")
                .WHERE("GH_HNO =#{h_no}")
                .toString();
    }

    public String roomAndGhouse(String h_no){
        return new SQL()
                .SELECT("*")
                .FROM("HOUSE")
                .JOIN("ROOMS R on HOUSE.GH_NO = R.R_GHNO")
                .WHERE("GH_HNO =  CAST(#{h_no}AS INTEGER)")
                .ORDER_BY("R_NO")
                .toString();
    }

    public String mypageRoomInfo(int r_no){
        return new SQL()
                .SELECT("*")
                .FROM("ROOMS")
                .JOIN("IMAGES I on ROOMS.R_NO = I.I_RNO")
                .WHERE("I_RNO = #{r_no}")
                .ORDER_BY("I_NO DESC")
                .toString();
    }

    // for room del
    public String ImagesDelete(int r_no){
        return new SQL()
                .DELETE_FROM("IMAGES")
                .WHERE("I_RNO = #{r_no}")
                .toString();
    }

    // for room del
    public String RoomDelete(int r_no){
        return new SQL()
                .DELETE_FROM("ROOMS")
                .WHERE("R_NO = #{r_no}")
                .toString();
    }

    public String RoomUpdate(Rooms room){
        return new SQL(){{
            UPDATE("ROOMS");
            SET("R_NAME = #{room.r_name}");
            SET("R_PER = #{room.r_per}");
            SET("R_FEE = #{room.r_fee}");
            SET("R_DETAIL = #{room.r_detail}");
            SET("R_TITLE = #{room.r_title}");
            WHERE("R_NO = #{room.r_no}");
        }}.toString();
    }

    public String GhouseUpdate(House house){
        return new SQL(){{
            UPDATE("HOUSE");
            SET("GH_DETAIL = #{house.gh_detail}");
            SET("GH_TITLE = #{house.gh_title}");
            WHERE("GH_HNO = #{house.gh_hno}");
            WHERE("GH_NO = #{house.gh_no}");
        }}.toString();
    }






}
