package com.bookstore.domain;

import java.io.Serializable;

public class BookBean implements Serializable{
	private String bookid;
	private String bookname;
	private String author;
	private String publishing;
	private String categoryid;
	private double price;
	private double quantityin;
	private double quantityout;
	private double quantityloss;
	private String picture;
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublishing() {
		return publishing;
	}
	public void setPublishing(String publishing) {
		this.publishing = publishing;
	}
	public String getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(String categoryid) {
		this.categoryid = categoryid;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getQuantityin() {
		return quantityin;
	}
	public void setQuantityin(double quantityin) {
		this.quantityin = quantityin;
	}
	public double getQuantityout() {
		return quantityout;
	}
	public void setQuantityout(double quantityout) {
		this.quantityout = quantityout;
	}
	public double getQuantityloss() {
		return quantityloss;
	}
	public void setQuantityloss(double quantityloss) {
		this.quantityloss = quantityloss;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}


	


}