package com.toy.project.service;

import com.toy.project.dto.BookingRoomGhouseUsers;
import com.toy.project.dto.Users;
import com.toy.project.mapper.AuthMapper;
import com.toy.project.mapper.UsersMapper;
import com.toy.project.security.AuthValue;
import com.toy.project.security.PrincipalUser;
import com.toy.project.vo.HostVO;
import com.toy.project.vo.UserVO;
import lombok.AllArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.UpdateProvider;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.util.List;

@AllArgsConstructor
@Service
public class UserService {

    private final UsersMapper usersMapper;
    private final AuthMapper authMapper;
    private final PasswordEncoder passwordEncoder;

    public void insertUser(AuthValue authValue, Users user) {
        String mail = authValue.getUsername().replace(",", "");
        String encPwd = passwordEncoder.encode(authValue.getPassword());
        authValue.setUsername(mail);
        authValue.setPassword(encPwd);
        authValue.setRole("USER");
        authMapper.insertAuthValue(authValue);

        String phone = user.getU_phone().replace(",", "");
        user.setU_phone(phone);
        usersMapper.insertUser(authValue, user);
    }
// 이메일 중복체크 registercontoller에서
    public int check_mail(String u_mail){
        return  usersMapper.check_mail(u_mail);
    }
// 낙네임 중복체크 registercontoller에서
    public int nickCheck(String u_nick){
        return usersMapper.nickCheck(u_nick);
    }

    public int updateUserInfo(Users user){
        String phone = user.getU_phone().replace(",", "");
        user.setU_phone(phone);
        return usersMapper.updateUserInfo(user);
    }

    public UserVO getOneUser(int u_no){
        return usersMapper.getOneUser(u_no);
    }

    public BookingRoomGhouseUsers getBook(String u_no){return usersMapper.getBook(u_no);}

    public List<BookingRoomGhouseUsers> getMyBookList(String u_no){return usersMapper.getMyBookList(u_no);}

    public BookingRoomGhouseUsers myBookSelectOneDetail(String u_no, String b_no){return usersMapper.myBookSelectOneDetail(b_no,u_no);}

//    public int bookingCancel (int b_no,int b_state){ return usersMapper.bookingCancel(b_no,b_state);}

//    public int emailCheck(String username){
//        return usersMapper.emailCheck(username);
//    }





}
