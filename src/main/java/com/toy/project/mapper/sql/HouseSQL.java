package com.toy.project.mapper.sql;

import com.toy.project.dto.House;
import com.toy.project.dto.HouseRoomImages;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.jdbc.SQL;

public class HouseSQL {

    public String insert(House house){
        return new SQL()
                .INSERT_INTO("HOUSE")
                .VALUES("GH_NAME","#{house.gh_name}")
                .VALUES("GH_IMAGE","#{house.gh_image}")
                .VALUES("GH_ADDR1","#{house.gh_addr1}")
                .VALUES("GH_ADDR2","#{house.gh_addr2}")
                .VALUES("GH_TITLE","#{house.gh_title}")
                .VALUES("GH_DETAIL","#{house.gh_detail}")
                .VALUES("GH_HNO","#{house.gh_hno}")
                .toString();
    }


// 메인검색에서 리스트로 slp001
    public String searchValue(String local) {
        return new SQL()
                .SELECT("GH_NO, GH_NAME, GH_IMAGE,GH_TITLE,GH_ADDR1,GH_ADDR2,MIN(R_FEE) AS R_FEE ")
                .FROM("HOUSE, ROOMS")
                .WHERE("GH_ADDR1 LIKE '%"+local+"%'")
                .GROUP_BY("GH_NO").toString();
    }

//숙소상세정보 + 객실들 들고오는거
    public String houseDetail(int gh_no) {
        return "SELECT *\n" +
                "FROM (SELECT h.gh_no\n" +
                "           , h.gh_name\n" +
                "           , h.gh_image\n" +
                "           , h.gh_addr1\n" +
                "           , h.gh_addr2\n" +
                "           , h.gh_detail\n" +
                "           , h.gh_hno\n" +
                "           , h.gh_title\n" +
                "           , r.r_no\n" +
                "           , r.r_name\n" +
                "           , r.r_per\n" +
                "           , r.r_fee\n" +
                "           , r.r_detail\n" +
                "           , r.r_ghno\n" +
                "           , r.r_title\n" +
                "           , i.i_no\n" +
                "           , i.i_name\n" +
                "           , i.i_path\n" +
                "           , i.i_rno\n" +
                "           , ROW_NUMBER() OVER(PARTITION BY h.gh_no, r.r_no ORDER BY i.i_no) rn\n" +
                "      FROM images i\n" +
                "               JOIN rooms r ON r.r_no  = i.i_rno\n" +
                "               JOIN house h ON h.gh_no = r.r_ghno\n" +
                "      WHERE h.gh_no = #{gh_no}\n" +
                "     ) a\n" +
                "WHERE rn = 1";

    }


//    public String hostMyhouse(int h_no){
//
//        return "select * from host\n" +
//                "join house h on host.h_no = h.gh_hno\n" +
//                "join host h2 on h2.h_no = h.gh_hno\n" +
//                "join rooms r on h.gh_no = r.r_ghno\n" +
//                "where h2.h_no =#{h_no}";
//    }

    //    //list
//    public String getList(String local) {
//        return new SQL()
//                .SELECT("*")
//                .FROM("HOUSE")
//                .JOIN("ROOMS R ON HOUSE.GH_NO = R.R_GHNO")
//                .WHERE("GH_ADDR1 LIKE '%"+local+"%' " +
//                        "AND R_FEE IN (SELECT MIN(R_FEE) FROM ROOMS " +
//                        "JOIN HOUSE G ON G.GH_NO = ROOMS.R_GHNO" +
//                        "GROUP BY G.GH_NO)")
//                .toString();
//    }

}
