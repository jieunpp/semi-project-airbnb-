package com.toy.project.controller;

import com.toy.project.dto.*;
import com.toy.project.security.AuthValue;
import com.toy.project.security.PrincipalUser;
import com.toy.project.service.AuthService;
import com.toy.project.service.BookService;
import com.toy.project.service.HostService;
import com.toy.project.vo.AuthInfo;
import com.toy.project.vo.HostVO;
import lombok.AllArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@AllArgsConstructor
@Controller
@RequestMapping("/host")
public class HostController {

    private final HostService hostService;
    private final AuthService authService;
    private final BookService bookService;

    // 마이페이지 메인(하우스정보가져오기)
    @RequestMapping(value = "/mypage_host/{h_no}", method = RequestMethod.GET)
    public String myHouse_host(@PathVariable("h_no") int h_no, Model model) {
        House house = this.hostService.myPageHostGhouse(h_no); // house 정보가져올때
        model.addAttribute("gh", house);
        return "h_myp005";

    }

    // 마이페이지 메인에서 정보수정으로(내정보 가져오기)
    @RequestMapping(value = "/host_myGhouse/{h_no}", method = RequestMethod.GET)
    public String myGhosue(@PathVariable("h_no") String h_no, Model model){
        HostVO hostInfo = hostService.getOneHost(Integer.parseInt(h_no));
        model.addAttribute("hostInfo", hostInfo);
        return "h_myp001";
    }

    //나의 정보 수정하는(update)
    @PostMapping("/updateInfo")
    public String updateHostInfo(@AuthenticationPrincipal PrincipalUser principalUser, Host host, HttpServletRequest request) {
        HostVO hostInfo = (HostVO) principalUser.getAuthInfo();
        host.setH_no(hostInfo.getH_no());
        hostService.updateInfo(host);

        String password = request.getParameter("pw");
        if(password != null){
            AuthValue authValue = ((AuthInfo) principalUser.getAuthInfo()).getAuthValue();
            authService.updatePW(authValue.getSc_no(), password);
        }
        return "redirect:/host/host_myGhouse/"+hostInfo.getH_no();
    }

    //정보수정시 비번으로 인증하는 팝업
    @RequestMapping("/mypage_check")
    public String mypage_host_check(HttpServletRequest request , Model model) {
        String no = request.getParameter("no");
        model.addAttribute("no",no);
        return "h_mypage_check";
    }

    // 정보수정 팝업에서 비밀번호 일치체크
    @ResponseBody
    @PostMapping("/pw_check")
    public boolean pwCheck(@AuthenticationPrincipal PrincipalUser principalUser, @RequestParam("pw") String new_pwd){
        return authService.pwCheck(principalUser, new_pwd);
    }

    // 내 하우스&객실 정보 들고오는
    @RequestMapping("/mypage_house_info/{h_no}")
    public String mypage_house_info(@PathVariable("h_no") String h_no, Model model) {
        // house 정보
        House ghouse = this.hostService.myPageHostGhouse(Integer.parseInt(h_no));
        model.addAttribute("ghInfo", ghouse);

        // 객실정보
        List<HouseRoom> houseRoom = this.hostService.roomAndGhouse(h_no);
//        model.addAttribute("grList", ghouseRoom);
        model.addAttribute("roomList", houseRoom);
//		System.out.println(ghouseRoom.toString());
        return "/h_myp002";
    }

    // 나의 객실정보(객실이미지도같이)
    @RequestMapping(value = "/mypageRoomInfo/{r_no}", method = RequestMethod.GET)
    public String mypageRoomInfo(@PathVariable("r_no")int r_no, Model model){
        List<RoomImages> roomImages = hostService.mypageRoomInfo(r_no);;
        model.addAttribute("room", roomImages);
        return "/h_myp003";
    }

    // 하우스 정보 수정(update)
    @PostMapping("/GhouseUpdate/{h_no}")
    public String GhouseUpdate(House house, @PathVariable("h_no")int h_no){
//        System.out.println(ghouse.toString());
        hostService.GhouseUpdate(house);
        return "redirect:/host/mypage_host/"+h_no;
    }

    // 객실수정(update)
    @RequestMapping("/RoomUpdate/{h_no}")
    public String RoomUpdate(Rooms room, @PathVariable("h_no")int h_no){
//        System.out.println("room.toString : " + room.toString());
        hostService.RoomUpdate(room);
        return "redirect:/host/mypage_house_info/"+h_no;
    }

    // 객실삭제하려면 묶여있는 사진부터 삭제해야함으로 객실연결 사진 삭제
    @RequestMapping("/ImagesDelete/{r_no},{h_no}")
    public String ImagesDelete(@PathVariable("r_no") int r_no, @PathVariable("h_no") int h_no){
        hostService.ImagesDelete(r_no);
        return "redirect:/host/RoomDelete/"+r_no+','+h_no;
    }

    //위 사진 삭제와 함께 객실 삭제(db묶여있음)
    @RequestMapping("/RoomDelete/{r_no},{h_no}")
    public String RoomDelete(@PathVariable("r_no") int r_no, @PathVariable("h_no")int h_no){
//        System.out.println("roomDel r_no : " + r_no);
        hostService.RoomDelete(r_no);
        return "redirect:/host/mypage_house_info/"+h_no;
    }

    // 예약고객 리스트(예약테이블이랑 필요테이블조인해서 필요컬럼들고)
    @RequestMapping("/mypage_host_customerList")
    public String mypage_host_customerList(@AuthenticationPrincipal PrincipalUser principalUser,  Model model) {
        int h_no = ((HostVO) principalUser.getAuthInfo()).getH_no();
        List<BookingHost> hostList = bookService.bookingListForHost(h_no);
        model.addAttribute("bookList", hostList);
        return "/h_myp004";
    }

    // 예약고객리스트 수락 거절(b_state update)
    @ResponseBody
    @PostMapping("/updateBookingState")
    public int updateBookingState(@RequestParam("b_no") int b_no, @RequestParam("b_state") int b_state) {
        return bookService.updateBookingState(b_no, b_state);
    }


}
