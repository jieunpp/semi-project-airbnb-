package com.toy.project.controller;

import com.toy.project.dto.Host;
import com.toy.project.dto.Users;
import com.toy.project.security.AuthValue;
import com.toy.project.service.HostService;
import com.toy.project.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@AllArgsConstructor
@Controller
@RequestMapping("/register")
public class RegisterController {

    private final UserService usersService;
    private final HostService hostService;

// 타입에 따른 회원가입
    @GetMapping("/{user_type}_join")
    public String registerPage(@PathVariable("user_type") String user_type) {
        return ("/"+user_type+"/"+user_type+"_join");
    }

    @PostMapping("/user")
    public String insertUser(AuthValue authValue, Users user) {
        usersService.insertUser(authValue, user);
        return "redirect:/lgn_conf";
    }

    @PostMapping("/host")
    public String insertHost(AuthValue authValue, Host host) {
        hostService.insertHost(authValue, host);
        return "redirect:/lgn_conf";
    }

// 이메일 중복체크
    @PostMapping("/checkSignup")
    @ResponseBody
    public String AjaxView(@RequestParam(value = "u_mail") String u_mail){
        String str = "";
        int idcheck = usersService.check_mail(u_mail);
        if(idcheck == 1){ //이미 존재하는 계정
            str = "NO";
        }else if(idcheck == 0){	//사용 가능한 계정
            str = "YES";
        }
//        System.out.println("dsfnjdskfs@@@#"+str);
        return str;

//        return idcheck;
    }

// 닉네임 중복체크
    @PostMapping("/nickCheck.do")
    @ResponseBody
    public String nickCheck(@RequestParam(value = "u_nick") String u_nick){

        String str = ""; // 값을 넘겨줄
        int result =  usersService.nickCheck(u_nick);
        if(result == 0){
            str= "Y";
        }else if(result ==1){
            str="N";
        }
//        System.out.println("@#@#@"+str);

        return str;
    }


}
