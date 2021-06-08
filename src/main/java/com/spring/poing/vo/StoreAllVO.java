package com.spring.poing.vo;

public class StoreAllVO {
	
	int idx;
	String category;
	String store_name;
	String introduce;
	String location1;
	String location2;
	String main_img;
	float star;
	int countAllReview;
	
	String addr;
	String tel;
	String opening_hours;
	String closed_days;
	String parking;
	String maxNumPeople;
	
	int likeStore;

	public int getLikeStore() {
		return likeStore;
	}
	public void setLikeStore(int likeStore) {
		this.likeStore = likeStore;
	}
	public int getCountAllReview() {
		return countAllReview;
	}
	public void setCountAllReview(int countAllReview) {
		this.countAllReview = countAllReview;
	}
	public String getMaxNumPeople() {
		return maxNumPeople;
	}
	public void setMaxNumPeople(String maxNumPeople) {
		this.maxNumPeople = maxNumPeople;
	}
	public float getStar() {
		return star;
	}
	public void setStar(float star) {
		this.star = star;
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
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getStore_name() {
		return store_name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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

}
