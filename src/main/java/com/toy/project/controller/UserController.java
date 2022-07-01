package com.toy.project.controller;

import com.toy.project.dto.BookingRoomGhouseUsers;
import com.toy.project.dto.Users;
import com.toy.project.security.AuthValue;
import com.toy.project.security.PrincipalUser;
import com.toy.project.service.AuthService;
import com.toy.project.service.BookService;
import com.toy.project.service.UserService;
import com.toy.project.vo.AuthInfo;
import com.toy.project.vo.UserVO;
import lombok.AllArgsConstructor;
import org.apache.catalina.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/user")
public class UserController {

    private final UserService userService;
    private final AuthService authService;

    // 마이페이지 메인 (간략유저 정보와 최신예약현황 조회)
    @RequestMapping(value = "/mypage_user/{u_no}", method = RequestMethod.GET)
    public String mypage_user(@PathVariable("u_no")String u_no, Model model) {
        BookingRoomGhouseUsers info = this.userService.getBook(u_no);
//        System.out.println(info);
        model.addAttribute("info", info);
        return "u_myp001";
    }

    // 마이페이지 메인에서 내정보 수정으로 넘어가는(내정보 가져오기)
    @RequestMapping(value = "/mypage_user_info/{u_no}", method = RequestMethod.GET)
    public String mypage_userInfo(@PathVariable("u_no")String u_no, Model model) {
        UserVO userinfo = this.userService.getOneUser(Integer.parseInt(u_no));

        model.addAttribute("uinfo", userinfo);
        return "u_myp002";
    }


    // USER 정보 업데이트
    @PostMapping("/updateInfo")
    public String updateUserInfo(@AuthenticationPrincipal PrincipalUser principalUser, Users user, HttpServletRequest request){
        UserVO userInfo =(UserVO) principalUser.getAuthInfo();
        user.setU_no(String.valueOf(userInfo.getU_no()));
        userService.updateUserInfo(user);

        String password = request.getParameter("pw");
        if(password != null){
            AuthValue authValue = ((AuthInfo) principalUser.getAuthInfo()).getAuthValue();
            authService.updatePW(authValue.getSc_no(), password);
        }
        return "redirect:/user/mypage_user_info/"+userInfo.getU_no();
    }

    // 정보 수정 버튼 클릭시 비번 인증하는 팝업
    @RequestMapping("/mypage_check")
    public String mypage_host_check(HttpServletRequest request , Model model) {
        String no = request.getParameter("no");
        model.addAttribute("no",no);
        return "u_mypage_check";
    }

    //비밀번호 체크하는
    @ResponseBody
    @PostMapping("/pw_check")
    public boolean pwCheck(@AuthenticationPrincipal PrincipalUser principalUser, @RequestParam("pw") String new_pwd){
        return authService.pwCheck(principalUser, new_pwd);
    }


    //user: 유저 마이페이지 예약리스트
    @RequestMapping(value = "/mypage_user_booking_list/{u_no}", method = RequestMethod.GET)
    public String mypage_user_booking_list(@PathVariable("u_no")String u_no, Model model) {
        List<BookingRoomGhouseUsers> myBookList = this.userService.getMyBookList(u_no);

        model.addAttribute("myBookList", myBookList);
//        System.out.println(myBookList);
        return "/myp001";
    }

// user: 예약리스트 상세
    @RequestMapping(value = "/mypage_user_booking_detail/{b_no},{u_no}", method = RequestMethod.GET)
    public String myBookSelectOneDetail(@PathVariable("u_no")String u_no, @PathVariable("b_no") String b_no, Model model){
        BookingRoomGhouseUsers bookingDetail = this.userService.myBookSelectOneDetail(u_no,b_no);
        model.addAttribute("mbd",bookingDetail);
        return "/u_myp003";
    }





}
