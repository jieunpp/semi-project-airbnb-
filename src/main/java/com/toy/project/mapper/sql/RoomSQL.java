package com.toy.project.mapper.sql;

import com.toy.project.dto.Images;
import com.toy.project.dto.Rooms;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.jdbc.SQL;

public class RoomSQL {

// slp002에서 slp003으로 객실상세정보
    public String getDetail(int r_no) {
        return new SQL()
                .SELECT("*")
                .FROM("ROOMS,IMAGES")
                .WHERE("R_NO = #{r_no}")
                .WHERE("I_RNO = #{r_no}")
                .ORDER_BY("I_NO DESC")
                .toString();
    }

    public String insertRoom(Rooms room){
        return new SQL()
                .INSERT_INTO("ROOMS")
                .VALUES("R_NAME","#{room.r_name}")
                .VALUES("R_PER","#{room.r_per}")
                .VALUES("R_FEE","#{room.r_fee}")
                .VALUES("R_DETAIL","#{room.r_detail}")
                .VALUES("R_GHNO","#{room.r_ghno}")
                .VALUES("R_TITLE","#{room.r_title}")
                .toString();
    }

    public String getR_ghno(int h_no){
        return "SELECT r_ghno FROM HOST\n" +
                "JOIN house h on host.h_no = h.gh_hno\n" +
                "JOIN rooms r on h.gh_no = r.r_ghno\n" +
                "WHERE H_NO = #{h_no}";

    }

// 숙소에연결된 객실1개만들고오기
    public String houseInRoom(int r_ghno) {
        return new SQL()
                .SELECT("*")
                .FROM("ROOMS")
                .WHERE("R_GHNO = #{r_ghno}")
                .ORDER_BY("R_NO DESC")
                .LIMIT(1)
                .toString();
    }

// 객실이미지insert
    public String imageInsert(Images images) {
        return new SQL()
                .INSERT_INTO("IMAGES")
                .VALUES("I_NAME","#{images.i_name}")
                .VALUES("I_PATH","#{images.i_path}")
                .VALUES("I_RNO","#{images.i_rno}")
                .toString();
    }

    public String mypageRoomInfo(int r_no) {
        return "select * from rooms, images\n" +
                "where r_no = #{r_no}\n" +
                "and i_rno = #{r_no}\n" +
                "order by i_no desc";
    }


}
