package com.spring.poing.vo;

public class StoreVO {
	
	private int idx;
	private String category;
	private String store_name;
	private String introduce;
	private String location1;
	private String location2;
	private String main_img;
	private float star;
	private int countAllReview;
	private int store_like;
	
	public int getStore_like() {
		return store_like;
	}
	public void setStore_like(int store_like) {
		this.store_like = store_like;
	}
	public int getCountAllReview() {
		return countAllReview;
	}
	public void setCountAllReview(int countAllReview) {
		this.countAllReview = countAllReview;
	}
	public float getStar() {
		return star;
	}
	public void setStar(float star) {
		this.star = star;
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
