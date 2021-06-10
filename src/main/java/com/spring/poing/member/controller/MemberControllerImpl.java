package com.spring.poing.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.spring.poing.common.NaverLoginBO;
import com.spring.poing.member.service.MemberService;
import com.spring.poing.vo.MemberVO;

@Controller
public class MemberControllerImpl implements MemberController{

	private static final String PROFILE_PATH = "C:\\lyh_java_2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\poing\\resources\\profile\\";
	
	@Autowired
	NaverLoginBO naverLoginBO;
	
	@Autowired
	MemberService memberService;

	@Override
	@RequestMapping("/login")
	public String login(Model model, HttpSession session) {
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		model.addAttribute("url", naverAuthUrl);
		
		return "login";
	}
	
	@Override
	@ResponseBody
	@RequestMapping("/login.do")
	public String loginAction(HttpServletRequest request, String id, String pw) {
		
		String loginState = memberService.login(id, pw);
		
		if(loginState.equals("login")) {
			HttpSession session = request.getSession();
			session.setAttribute("loginCheck", id);
			session.setMaxInactiveInterval(60*60*3);
		}
		
		return loginState;
	}
	
	@Override
	@RequestMapping("/naverLogin.do")
	public String naverLoginAction(String code, String state, HttpSession session) throws IOException, ParseException {
		
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		
		JSONObject json = (JSONObject) new JSONParser().parse(apiResult);
		JSONObject info = (JSONObject) json.get("response");
		
		String id = (String) info.get("email");
		String nickname = (String) info.get("nickname");
		
		String loginState = memberService.naverLogin(id, nickname);
		
		if(loginState.equals("exist member"))
			return "redirect:/exist_member";
		
		session.setAttribute("loginCheck", id);
		
		return "redirect:/main";
	}
	
	@Override
	@RequestMapping("/findPw")
	public String findPw() {
		return "findPw";
	}
	
	@Override
	@RequestMapping("/logOut.do")
	public String logOutAction(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("loginCheck");
		
		return "redirect:/main";
	}
	
	@Override
	@RequestMapping("/signUp")
	public String signUp() {
		return "signUp";
	}
	
	@Override
	@ResponseBody
	@RequestMapping("/signUp.do")
	public String signUpAction(MemberVO vo) {
		
		String signUpState = memberService.signUp(vo);
		
		return signUpState;
	}

	@Override
	@ResponseBody
	@RequestMapping("/upload_profile.do")
	public String uploadProfilAction(HttpServletRequest request, MultipartFile profile) {
		
		String id = (String) request.getSession().getAttribute("loginCheck");
		
		String fileName = profile.getOriginalFilename();
		
		if(profile.getSize()!=0){
			
			String savePath = PROFILE_PATH + id;
			
			File file = new File(savePath, fileName);
			
			if(!file.getParentFile().exists()) {
				file.getParentFile().mkdir();
			}
			
			try {
				profile.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
				return "error";
			}
			
			long time = System.currentTimeMillis();
			
			String newFileName = time + fileName;
			
			file.renameTo(new File(savePath, newFileName));
			
			String beforeName = memberService.changeProfile(id, newFileName);
			
			if(beforeName!=null) {
				File beforeFile =  new File(savePath, beforeName);
				beforeFile.delete();
			}
			
		}
		
		return "success";
	}

	@Override
	@RequestMapping("/update_nickname.do")
	public String updateNicknameAction(HttpServletRequest request, String nickname) {

		String id = (String) request.getSession().getAttribute("loginCheck");
		
		memberService.updateNickname(id, nickname);
		
		return "redirect:/myPage";
	}
	
	@Override
	@ResponseBody
	@RequestMapping("/update_password.do")
	public String updatePasswordAction(HttpServletRequest request, String pw, String newPw) {

		String id = (String) request.getSession().getAttribute("loginCheck");
		
		String state = memberService.updatePassword(id, pw, newPw);
		
		return state;
	}

	@Override
	@ResponseBody
	@RequestMapping("/withdrawal.do")
	public String withdrawalAction(HttpServletRequest request, String pw) {
		 
		String id = (String) request.getSession().getAttribute("loginCheck");
		
		String state = memberService.withdrawal(id, pw);
		
		if(state.equals("success")) {
			request.getSession().removeAttribute("loginCheck");
		}
		
		return state;
	}
	
}
