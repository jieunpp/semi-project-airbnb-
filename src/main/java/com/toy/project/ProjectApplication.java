package com.toy.project;

import com.toy.project.security.PrincipalUser;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@SpringBootApplication
@Controller
public class ProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectApplication.class, args);
	}

	@GetMapping({"", "/", "/main"})
	public String main(@AuthenticationPrincipal PrincipalUser principalUser, Model model){
		if(principalUser == null) {
			principalUser = new PrincipalUser();
		}
		model.addAttribute("user", principalUser.getAuthInfo());
		return "main";
	}

	@GetMapping("/sessionCheck")
	public @ResponseBody String sessionCheck(@AuthenticationPrincipal PrincipalUser principalUser) {
		return principalUser.getAuthInfo().toString();
	}


}
