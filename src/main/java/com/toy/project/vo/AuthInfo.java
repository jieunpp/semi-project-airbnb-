package com.toy.project.vo;

import com.toy.project.security.AuthValue;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuthInfo {
    private AuthValue authValue;
}
