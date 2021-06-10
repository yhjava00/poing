package com.spring.poing.vo;

public class MemberVO {
	
	String id;
	String pw;
	String nickname;
	String profile_img;
	String member_type;
	
	public MemberVO() {
	}
	
	public MemberVO(String id, String nickname, String member_type) {
		this.id = id;
		this.nickname = nickname;
		this.member_type = member_type;
		this.pw = "no password";
	}
	
	public String getMember_type() {
		return member_type;
	}
	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}
