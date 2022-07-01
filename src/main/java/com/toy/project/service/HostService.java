package com.toy.project.service;

import com.toy.project.dto.*;
import com.toy.project.mapper.AuthMapper;
import com.toy.project.mapper.HostMapper;
import com.toy.project.security.AuthValue;
import com.toy.project.vo.HostVO;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@AllArgsConstructor
@Service
public class HostService {

    private final HostMapper hostMapper;
    private final AuthMapper authMapper;
    private final PasswordEncoder passwordEncoder;
// 호스트 회원가입
    public void insertHost(AuthValue authValue, Host host) {
        String mail = authValue.getUsername().replace(",", "");
        String encPwd = passwordEncoder.encode(authValue.getPassword());
        authValue.setUsername(mail);
        authValue.setPassword(encPwd);
        authValue.setRole("HOST");
        authMapper.insertAuthValue(authValue);

        String phone = host.getH_phone().replace(",", "");;
        host.setH_phone(phone);

        hostMapper.insertHost(authValue, host);
    }
    // 정보수정
    public int updateInfo(Host host){
        String phone = host.getH_phone().replace(",", "");
        host.setH_phone(phone);
        return hostMapper.updateInfo(host);
    }
// 호스트 한명 받아오기
    public HostVO getOneHost(int h_no){
        return hostMapper.getOneHost(h_no);
    }
// 호스트연결된 숙소가져오기
    public House myHouse(int h_no) {
        return hostMapper.myHouse(h_no);
    }
// 나의 하우스정보
    public House myPageHostGhouse(int h_no){
        return hostMapper.myPageHostGhouse(h_no);
    }

    public List<HouseRoom> roomAndGhouse(String h_no){
        return hostMapper.roomAndGhouse(h_no);
    }

    public List<RoomImages> mypageRoomInfo(int r_no){return hostMapper.mypageRoomInfo(r_no);}

    public int ImagesDelete(int r_no){
        return hostMapper.ImagesDelete(r_no);
    }

    public int RoomDelete(int r_no){
        return hostMapper.RoomDelete(r_no);
    }

    public void RoomUpdate(Rooms room){hostMapper.RoomUpdate(room);}

    public int GhouseUpdate(House house){
        return hostMapper.GhouseUpdate(house);
    }





}
