package com.toy.project.service;

import com.toy.project.mapper.AuthMapper;
import com.toy.project.mapper.HostMapper;
import com.toy.project.mapper.UsersMapper;
import com.toy.project.security.PrincipalUser;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
public class AuthService {
    private final AuthMapper authMapper;
    private final UsersMapper usersMapper;
    private final HostMapper hostMapper;
    private final PasswordEncoder passwordEncoder;

    public boolean pwCheck(PrincipalUser principalUser, String new_pwd){
        return passwordEncoder.matches(new_pwd, principalUser.getPassword());
    }

    public void updatePW(int sc_no, String password) {
        String encPwd = passwordEncoder.encode(password);
        authMapper.updatePW(sc_no, encPwd);
    }
}
