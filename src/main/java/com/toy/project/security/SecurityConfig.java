package com.toy.project.security;

import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final AuthFailHandler authFailHandler;

    @Bean // 비밀번호 인코딩
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        if (encodedPassword == null || encodedPassword.length() == 0) {
            System.out.println("w");
            return false;
        }

        return BCrypt.checkpw(rawPassword.toString(), encodedPassword);
    }
    @Bean
    public AuthenticationFailureHandler failureHandler(){
            return new AuthFailHandler();
        }


    @Override
    protected void configure (HttpSecurity http) throws Exception{
        http.csrf().disable(); // 토큰검사 비활성화
        http.authorizeRequests()// 요청에 대한 권한 지정
                .antMatchers("/sessionCheck").authenticated()  // 세션 인증이 되어야 접근가능
                .antMatchers("/user/**").hasRole("USER")
                .antMatchers("/host/**").hasRole("HOST")
                .anyRequest().permitAll()// 모두접근허용
                .and()
                    .logout()
                    .logoutSuccessUrl("/")
                .and()
                    .formLogin()
                    .loginPage("/login")
                .loginProcessingUrl("/loginNormal") // 로그인form
                .defaultSuccessUrl("/")
//                .failureUrl("/login_error")
                .failureHandler(authFailHandler)
                //                .successHandler()
                    .and()
                    .exceptionHandling().accessDeniedPage("/error");



    }

}
