package com.spring.poing.common;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.poing.member.service.MemberService;

@Controller
public class MailController {
	
	@Autowired
	JavaMailSender mailSender;

	@Autowired
	MemberService memberService;

	@ResponseBody
	@RequestMapping("/findPw.do")
	public String findPwAction(String id) {
		
		char[] words = {
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
				'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
				'U', 'V', 'W', 'X', 'Y', 'Z'
		};
		
		StringBuilder newPw = new StringBuilder();
		Random r = new Random();
		
		for(int i=0; i<6; i++) {
			newPw.append(words[r.nextInt(words.length)]);
		}
		
		String state = memberService.findPw(id, newPw.toString());
		
		if(state.equals("no member")) {
			return state;
		}
		
		String setFrom = "yhjava00@gmail.com";
		String toMail = id;
		String title = "안녕하세요 poing입니다.";
		String content = "새로운 비밀번호는 '" + newPw + "' 입니다.";
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setFrom);
			messageHelper.setTo(toMail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return state;
	}
	
	@RequestMapping("/mailSend.do")
	public String mailSend() {
		
		String setFrom = "yhjava00@gmail.com";
		String toMail = "yhjava00@naver.com";
		String title = "test";
		String content = "testing";
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setFrom);
			messageHelper.setTo(toMail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return "redirect:/main";
	}

}
