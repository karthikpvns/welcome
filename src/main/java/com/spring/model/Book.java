package com.spring.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="bookapp")
public class Book implements Serializable {
	@Id
	@Column(name="isbn")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int isbn;
	@NotEmpty(message="title iyyi !!!")
	private String title;
	//private String category;
	@NotEmpty(message="the publisher is compulsory")
	private String publisher;
	@Min(value=100,message="The limit is not reached")
	private double price;
	@ManyToOne
	@JoinColumn(name="category")
	private Category category;
	
	@Transient
	private MultipartFile bookImage;
	
	public MultipartFile getBookImage() {
		return bookImage;
	}
	public void setBookImage(MultipartFile bookImage) {
		this.bookImage = bookImage;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public int getIsbn() {
		return isbn;
	}
	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}

	
}
