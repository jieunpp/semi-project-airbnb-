package com.toy.project.controller;

import com.toy.project.dto.*;
import com.toy.project.service.RoomService;
import com.toy.project.vo.HostVO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/room")
public class RoomController {

    private final RoomService roomService;

    public RoomController(RoomService roomService){
        this.roomService = roomService;
    }

    //하우스 정보에서 객실 등록하기페이지로
    @RequestMapping(value = "/write/{gh_no}", method = RequestMethod.GET)
    public String write(@PathVariable("gh_no")int gh_no, Model model){
        model.addAttribute("gh_no", gh_no);
        return "/h_slp002";
    }

    // 객실 등록하기에서 insert 후 객실사진등록하기로
    @RequestMapping(value = "/room_write")
    public String room_write(Rooms room){
//        System.out.println(room);
        roomService.insertRoom(room);
        return "redirect:/room/detail/"+room.getR_ghno();//이미지 업로드로
    }

    //insert했던 객실 한개 정보 들고와서 사진업로드 페이지로
    @RequestMapping(value = "/detail/{r_ghno}")
    public String houseInRoom(@PathVariable("r_ghno") int r_ghno, Model model) {
        Rooms room = roomService.houseInRoom(r_ghno);
        model.addAttribute("rm",room);

        return "/h_slp003";
    }

    //객실이미지 insert
    @PostMapping("/h_slp003/{r_no1}")
    public String imageInsert(Images images, @PathVariable("r_no1") int r_no1, @RequestParam("files") List<MultipartFile> files) {
        images.setI_rno(r_no1);
        String fileAddr = "C:\\Users\\sjinc\\IdeaProjects\\project\\src\\main\\resources\\static\\room_image\\";
        List<String> saveDB = new ArrayList<>();
        List<Integer> r_no = new ArrayList<>();

        try{
            for (int i = 0; i < files.toArray().length; i++) {
                String imageName = String.valueOf(System.currentTimeMillis());
                String OriginName = files.get(i).getOriginalFilename();
                String transfer = fileAddr +  OriginName;
                File transferto = new File(transfer);

                saveDB.add(OriginName);
                r_no.add(images.getI_rno());
//                System.out.println(safeDB.get(i));
                files.get(i).transferTo(transferto);
            }
        } catch (IOException | IllegalStateException e) {
            e.printStackTrace();
//        System.out.println("safeDB.toString : " + safeDB);
//        System.out.println("images.toString : " + images);
        }
        try {
            for (int i = 0; i < saveDB.size(); i++) {
                images.setI_name(saveDB.get(i));
                images.setI_rno(r_no.get(i));
                images.setI_path(fileAddr);
                roomService.imageInsert(images);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }

// slp002(예약버튼)에서 slp003 객실 상세정보로
    @RequestMapping(value = "/getDetail/{r_no}", method = RequestMethod.GET)
    public String getDetail(@PathVariable("r_no") int r_no, Model model) {
        List<RoomImages> roomImages = this.roomService.getDetail(r_no);
        model.addAttribute("getDetail", roomImages);
        return "/slp003";
    }




//    @RequestMapping(value = "/mypageRoomInfo/{r_no}", method = RequestMethod.GET)
//    public String mypageRoomInfo(@PathVariable("r_no")int r_no, Model model){
//        List<RoomImages> roomImages = roomService.mypageRoomInfo(r_no);
////        System.out.println("roomImages.toString() : "+roomImages.toString());
////        System.out.println(roomImages.get(0).toString());
//        model.addAttribute("room", roomImages);
//        return "h_myp003";
//    }


}
