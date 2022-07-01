package com.toy.project.mapper;

import com.toy.project.dto.House;
import com.toy.project.dto.HouseRoom;
import com.toy.project.dto.HouseRoomImages;
import com.toy.project.dto.Review;
import com.toy.project.mapper.sql.HouseSQL;
import org.apache.ibatis.annotations.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface HouseMapper {

    @Options(useGeneratedKeys = true, keyProperty = "house.gh_no")
    @InsertProvider(type = HouseSQL.class, method = "insert")
    void insert(@Param("house") House house);

    @SelectProvider(type = HouseSQL.class, method = "searchValue")
    List<HouseRoom> searchValue(String local);

//mypage_ghouse_detail
    @Options(useGeneratedKeys = true, keyProperty = "HouseRoomImages.gh_no")
    @SelectProvider(type = HouseSQL.class, method = "houseDetail")
    List<HouseRoomImages> houseDetail(int gh_no);




    //    List<HouseRoom> hostMyhouse(int h_no);
// house insert
// 메인 검색
////
//    @SelectProvider(type = HouseSQL.class, method = "getList")
//    List<HouseRoom> getList(String local);
//
////mypage_room_detail
//    @SelectProvider(type = HouseSQL.class, method = "hostMyhouse")

}
