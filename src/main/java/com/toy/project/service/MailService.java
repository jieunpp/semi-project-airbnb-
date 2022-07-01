package com.toy.project.service;

import com.toy.project.mapper.UsersMapper;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class MailService {
    private final JavaMailSender mailSender;
    private static final String FROM_ADDRESS = "geepark82@gmail.com";
    private final UsersMapper mapper;

    public MailService(JavaMailSender mailSender, UsersMapper mapper) {
        this.mailSender = mailSender;
        this.mapper = mapper;
    }


}
