package com.toy.project.controller;

import com.toy.project.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@AllArgsConstructor
@Controller
public class HomeController {
    private final UserService userService;

    @RequestMapping("/")/*main*/
    public String home(){
        System.out.println("@@## 메인 ");
        return "/main";
    }
    @RequestMapping("/login")/*로그인*/
    public String login(){
        return "login";
    }

    @RequestMapping("/login_error")/*로그인_ㅇ로류*/
    public String login_error(){
        return "login_error";
    }

    @RequestMapping("/lgn_conf")/*회원가입_완료*/
    public String login_conf(){
        return "lgn_conf";
    }

    @RequestMapping("/join_check")/*회원가입 회원구분*/
    public String join_check(){ return "join_check"; }

   @RequestMapping("/u_lgn001")//*유저회원가입*//
    public String userJoin(){
        return "u_lgn001";
    }

    @RequestMapping("/lgn002")/*아이디찾기*/
    public String findId() { return "lgn002"; }

    @RequestMapping("/lgn003")/*비밀번호찾기*/
    public String findPw() {return "lgn003"; }

    @RequestMapping("/lgn002c")/*아이디확인*/
    public String showId(){ return "lgn002c"; }

    @RequestMapping("/lgn003c")/*비밀번호확인*/
    public String showPw() { return "lgn003c"; }

    @RequestMapping("/map") /*지도api 확인*/
    public String map() { return "map"; }

    /*
     *  호스트
     * */

    @RequestMapping("/h_lgn001") /* host 회원가입*/
    public String hostJoin(){ return "h_lgn001"; }

    @RequestMapping("/h_slp001") /* host 숙소올리기 */
    public String writeHouse(){ return "h_slp001"; }

    @RequestMapping("/h_slp002") /*host 객실올리기*/
    public String writeRoom(){ return "h_slp002"; }

    @RequestMapping("/h_slp003") /*host 객실이미지올리기*/
    public String writeRoomImage(){ return "h_slp003"; }



    /*
     * 숙소
     * */
    @RequestMapping("/slp001") /*숙소리스트*/
    public String houseList(){ return "slp001"; }

    @RequestMapping("/slp002") /* 숙소상세정보*/
    public String houseDetail(){ return "slp002"; }

    @RequestMapping("/slp003") /* 객실상세정보*/
    public String roomDetail(){ return "slp003"; }

    @RequestMapping("/jusoo")
    public String juso(){ return "review_write"; }


    /*
     * 예약
     * */

    @RequestMapping("/rev001") /* 예약확인*/
    public String booking(){ return "rev001"; }

    @RequestMapping("/rev002") /* 예약최종*/
    public String bookingConfirm(){ return "rev002"; }

    /*
     * 마이페이지
     * */
    @RequestMapping("/myp001") /* 예약최종 user*/
    public String mypageBookList(){ return "myp001"; }


    /*
     * 마이페이지 host
     * */

    @RequestMapping("/h_myp002") /* host 숙소 정보*/
    public String myhouseInfo(){ return "h_myp002"; }

    @RequestMapping("/h_myp003") /* host 객실 정보*/
    public String myroomInfo(){ return "h_myp003"; }

    @RequestMapping("/h_myp004") /*예약고객리스트 승인/거절 */
    public String customerList(){ return "h_myp004"; }

    @RequestMapping("/h_myp005") /*예약고객리스트 승인/거절 */
    public String myInfo(){ return "h_myp005"; }

    @RequestMapping("/u_myp001") /*예약고객리스트 승인/거절 */
    public String userMyInfo(){ return "u_myp001"; }

    @RequestMapping("/test") /*예약고객리스트 승인/거절 */
    public String tests(){ return "test"; }

    @RequestMapping("/jstree")
    public String tree(){ return  "jstree"; }

    @RequestMapping("/treeview")
    public String treeView(){ return  "treeView"; }


    /*
     * error
     * */

//    @RequestMapping("/error")
//    public String error(){ return "error"; }
}
