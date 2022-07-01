package com.toy.project.controller;

import com.toy.project.dto.House;
import com.toy.project.dto.HouseRoom;
import com.toy.project.dto.HouseRoomImages;
import com.toy.project.service.HouseService;


import lombok.SneakyThrows;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/house")
public class HouseController {

    private final HouseService houseService;

    public HouseController(HouseService houseService) {
        this.houseService = houseService;
    }

    //메인에서 검색바에 지역입력 조회 해서 하우스리스트로
    @RequestMapping(value = "/searchValue", method = RequestMethod.GET)
    public String searchValue(HttpServletRequest request, Model model) {
        String local = request.getParameter("local");
        List<HouseRoom> show = this.houseService.searchValue(local);
        model.addAttribute("list", show);
        return "/slp001";
    }

//  숙소리스트에서 숙소 클릭시 숙소정보로 이동
    @RequestMapping(value = "/detail/{gh_no}", method = RequestMethod.GET)
    public String houseDetail(@PathVariable("gh_no") String gh_no, Model model) {
        int num_no = Integer.parseInt(gh_no);
        List<HouseRoomImages> houseRoomImages = this.houseService.houseDetail(num_no);
        model.addAttribute("griList", houseRoomImages);
        return "/slp002";
    }



//  숙소 등록 (사진경로까지)
    @PostMapping("/insert/{h_no}")
    public String insert(House house, @RequestParam("files") MultipartFile file, @PathVariable("h_no") int h_no)
            throws IOException {
        String fileAddr = "C:\\Users\\sjinc\\IdeaProjects\\project\\src\\main\\resources\\static\\gh_image\\";

        String OriginName = file.getOriginalFilename();
        String transfer = fileAddr + OriginName;

        try {
            house.setGh_image(OriginName);
            File transfers = new File(transfer);
            file.transferTo(transfers);

        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }
        house.setGh_hno(h_no);
        house.setGh_image(OriginName);
//        System.out.println("house.toString() : " + house.toString());
//        System.out.println(OriginName);

        houseService.insert(house);
        return "redirect:/host/mypage_host/"+h_no;
    }


//    // 메인 지역명검색해서 리스트로 가는
//    @RequestMapping(value = "/getList", method = RequestMethod.GET)
//    public String getList(HttpServletRequest request, Model model){
//        String local = request.getParameter("local");
//        if(local == null) {
//            local = "";
//        }
//        List<HouseRoom> show = this.houseService.getList(local);
//        System.out.println(show);
//        model.addAttribute("list", show);
//        return "/slp001";
//    }

}
