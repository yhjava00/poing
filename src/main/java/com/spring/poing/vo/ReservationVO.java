package com.spring.poing.vo;

public class ReservationVO {
	
	private int idx;
	private int store_idx;
	private String member_id;
	private String resDate;
	private String time;
	private int people_num;
	
	private String store_name;
	private String introduce;
	private String location1;
	private String location2;
	private String main_img;
	
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getLocation1() {
		return location1;
	}
	public void setLocation1(String location1) {
		this.location1 = location1;
	}
	public String getLocation2() {
		return location2;
	}
	public void setLocation2(String location2) {
		this.location2 = location2;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getStore_idx() {
		return store_idx;
	}
	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	public int getPeople_num() {
		return people_num;
	}
	public void setPeople_num(int people_num) {
		this.people_num = people_num;
	}

}
