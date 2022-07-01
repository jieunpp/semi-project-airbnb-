package com.toy.project.service;

import com.toy.project.dto.House;
import com.toy.project.dto.HouseRoom;
import com.toy.project.dto.HouseRoomImages;
import com.toy.project.dto.Review;
import com.toy.project.mapper.HouseMapper;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class HouseService {

    private final HouseMapper houseMapper;

    public HouseService(HouseMapper houseMapper) {
        this.houseMapper=houseMapper;
    }

//숙소 등록
    public void insert(House house){houseMapper.insert(house);}

//메인 검색
    public List<HouseRoom> searchValue(String local) {return houseMapper.searchValue(local);}

//    public List<HouseRoom> getList(String local){ return houseMapper.getList(local);}

//// mypage_ room -detail
//    public List<HouseRoom> hostMyhouse(int h_no){
//    return houseMapper.hostMyhouse(h_no);
//}

//mypage_ghouse_detail
    public List<HouseRoomImages> houseDetail(int gh_no) {
        return houseMapper.houseDetail(gh_no);}




}

