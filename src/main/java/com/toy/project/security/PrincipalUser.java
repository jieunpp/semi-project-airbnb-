package com.toy.project.security;

import com.toy.project.vo.AuthInfo;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

@NoArgsConstructor
@ToString
public class PrincipalUser implements UserDetails {
    private AuthInfo authInfo;


    public PrincipalUser(AuthValue authValue, AuthInfo authInfo){
        this.authInfo = authInfo;
        this.authInfo.setAuthValue(authValue);

    }
    public Object getAuthInfo(){
        return authInfo;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> collection = new ArrayList<>();
        collection.add((GrantedAuthority) () -> "ROLE_"+authInfo.getAuthValue().getRole());
        return collection;
    }

    @Override
    public String getPassword() {
        return authInfo.getAuthValue().getPassword();
    }

    @Override
    public String getUsername() {
        return  authInfo.getAuthValue().getUsername();
//        String name = authInfo.getAuthValue().getUsername();
//        if(name == null) {
//            name = "authInfo";
//        }
//        return name;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
