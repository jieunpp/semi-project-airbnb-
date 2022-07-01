package com.toy.project.service;

import com.toy.project.dto.*;
import com.toy.project.mapper.RoomMapper;
import com.toy.project.vo.HostVO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomService {
    private final RoomMapper roomMapper;

    public RoomService(RoomMapper roomMapper){
        this.roomMapper=roomMapper;
    }

    public List<RoomImages> getDetail(int r_no) { return roomMapper.getDetail(r_no);}

    public void insertRoom(Rooms room) {
        roomMapper.insertRoom(room);
    }

    public Rooms houseInRoom(int r_ghno) {
        return roomMapper.houseInRoom(r_ghno);
    }

    public void imageInsert(Images images) {
        roomMapper.imageInsert(images);
    }

    public List<RoomImages> mypageRoomInfo(int r_no){
        return roomMapper.mypageRoomInfo(r_no);
    }

    public HouseRoom getR_ghno(int h_no) {
        return roomMapper.getR_ghno(h_no);
    }
}
