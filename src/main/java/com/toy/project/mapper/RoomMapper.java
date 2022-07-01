package com.toy.project.mapper;

import com.toy.project.dto.*;
import com.toy.project.mapper.sql.RoomSQL;
import com.toy.project.vo.HostVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface RoomMapper {

    @Options(useGeneratedKeys = true, keyProperty = "RoomImages.r_no")
    @SelectProvider(type = RoomSQL.class, method = "getDetail")
    List<RoomImages> getDetail(@Param("r_no") int r_no);

    @InsertProvider(type = RoomSQL.class, method = "insertRoom")
    void insertRoom(@Param("room") Rooms rooms);

    @SelectProvider(type = RoomSQL.class, method = "houseInRoom")
    Rooms houseInRoom(@Param("r_ghno") int r_ghno);

    @InsertProvider(type = RoomSQL.class, method = "imageInsert")
    void imageInsert(@Param("images") Images images);

    @SelectProvider(type = RoomSQL.class, method = "mypageRoomInfo")
    List<RoomImages> mypageRoomInfo(@Param("r_no")int r_no);

    @SelectProvider(type = RoomSQL.class, method = "getR_ghno")
    HouseRoom getR_ghno(@Param("h_no") int h_no);






}
