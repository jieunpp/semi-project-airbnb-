package com.toy.project.security;

import com.toy.project.mapper.AuthMapper;
import com.toy.project.mapper.HostMapper;
import com.toy.project.mapper.UsersMapper;
import com.toy.project.vo.AuthInfo;
import lombok.AllArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
public class PrincipalUserService implements UserDetailsService {

    private final UsersMapper usersMapper;
    private final HostMapper hostMapper;
    private final AuthMapper authMapper;

    @Override // 유저정보 가져오기
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        AuthValue authValue = authMapper.loadUserByName(username);
        AuthInfo authInfo = null;

        switch (authValue.getRole()) {
            case "USER":
                authInfo = usersMapper.loadUserBySecurityNo(authValue.getSc_no());
                break;
            case "HOST":
                authInfo = hostMapper.loadUserBySecurityNo(authValue.getSc_no());
                break;
        }

        if(authInfo != null) {
            return new PrincipalUser(authValue, authInfo);
        }
        return null;
    }

}
