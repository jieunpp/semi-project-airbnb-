package com.toy.project.mapper;

import com.toy.project.dto.BookingRoomGhouseUsers;
import com.toy.project.dto.Users;
import com.toy.project.mapper.sql.HostSQL;
import com.toy.project.mapper.sql.UserSQL;
import com.toy.project.security.AuthValue;
import com.toy.project.vo.HostVO;
import com.toy.project.vo.UserVO;
import org.apache.catalina.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UsersMapper {

    List<UserVO> getUsersList();

//    @Options(useGeneratedKeys = true, keyProperty = "user.u_no")
//    @InsertProvider(type = UserSQL.class, method = "insertUser")
//    void insertUser(@Param("user") Users user);

    @Options(useGeneratedKeys = true, keyProperty = "user.u_no")
    @InsertProvider(type = UserSQL.class, method = "insertUser")
    void insertUser(@Param("authValue") AuthValue authValue, @Param("user") Users user);

    @SelectProvider(type = UserSQL.class, method = "check_mail")
    int check_mail(String u_mail);

    @SelectProvider(type = UserSQL.class, method = "nickCheck")
    int nickCheck(String u_nick);

    @UpdateProvider(type = UserSQL.class, method = "updateUserInfo")
    int updateUserInfo(@Param("user") Users user);


    @SelectProvider(type = UserSQL.class, method = "loadUserBySecurityNo")
    UserVO loadUserBySecurityNo(@Param("sc_no") int sc_no);

    @SelectProvider(type = UserSQL.class, method = "getBook")
    BookingRoomGhouseUsers getBook(String u_no);

    @SelectProvider(type = UserSQL.class, method = "getMyBookList")
    List<BookingRoomGhouseUsers> getMyBookList(String u_no);

//    @SelectProvider(type = UserSQL.class, method = "emailCheck")
//    int emailCheck(String username);

    @SelectProvider(type = UserSQL.class, method = "getOneUser")
    UserVO getOneUser(int u_no);

    @SelectProvider(type = UserSQL.class, method = "myBookSelectOneDetail")
    BookingRoomGhouseUsers myBookSelectOneDetail(String b_no, String u_no);

//    @UpdateProvider(type = UserSQL.class, method = "bookingCancel")
//    int bookingCancel(@Param("b_no") int b_no,@Param("b_state")int b_state);




}
