package com.spring.poing.vo;

public class StoreInfoVO {
	
	private int idx;
	private int stroe_idx;
	private String addr;
	private String tel;
	private String opening_hours;
	private String closed_days;
	private char parking;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getStroe_idx() {
		return stroe_idx;
	}
	public void setStroe_idx(int stroe_idx) {
		this.stroe_idx = stroe_idx;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getOpening_hours() {
		return opening_hours;
	}
	public void setOpening_hours(String opening_hours) {
		this.opening_hours = opening_hours;
	}
	public String getClosed_days() {
		return closed_days;
	}
	public void setClosed_days(String closed_days) {
		this.closed_days = closed_days;
	}
	public char getParking() {
		return parking;
	}
	public void setParking(char parking) {
		this.parking = parking;
	}

}
