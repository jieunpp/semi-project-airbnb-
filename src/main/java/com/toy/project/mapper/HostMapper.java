package com.toy.project.mapper;

import com.toy.project.dto.*;
import com.toy.project.mapper.sql.HostSQL;
import com.toy.project.security.AuthValue;
import com.toy.project.vo.HostVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface HostMapper {
    @InsertProvider(type = HostSQL.class, method = "insertHost")
    void insertHost(@Param("authValue") AuthValue authValue, @Param("host") Host host);

    @SelectProvider(type = HostSQL.class, method = "loadUserBySecurityNo")
    HostVO loadUserBySecurityNo(@Param("sc_no") int sc_no);

    @UpdateProvider(type = HostSQL.class, method = "updateInfo")
    int updateInfo(@Param("host") Host host);

    @SelectProvider(type = HostSQL.class, method = "getOneHost")
    HostVO getOneHost(int h_no);

    @SelectProvider(type = HostSQL.class, method = "myHouse")
    House myHouse(int h_no);

    @SelectProvider(type = HostSQL.class, method = "myPageHostGhouse")
    House myPageHostGhouse(@Param("h_no")int h_no);

    @SelectProvider(type = HostSQL.class, method = "roomAndGhouse")
    List<HouseRoom> roomAndGhouse(String h_no);

    @SelectProvider(type = HostSQL.class, method = "mypageRoomInfo")
    List<RoomImages> mypageRoomInfo(@Param("r_no")int r_no);

    @DeleteProvider(type = HostSQL.class, method = "ImagesDelete")
    int ImagesDelete(int r_no);

    @DeleteProvider(type = HostSQL.class, method = "RoomDelete")
    int RoomDelete(@Param("r_no") int r_no);

    @UpdateProvider(type = HostSQL.class, method = "RoomUpdate")
    void RoomUpdate(@Param("room") Rooms room);

    @UpdateProvider(type = HostSQL.class, method = "GhouseUpdate")
    int GhouseUpdate(@Param("house")House house);

}
