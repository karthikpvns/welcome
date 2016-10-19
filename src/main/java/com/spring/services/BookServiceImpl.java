package com.spring.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.BookDao;
import com.spring.model.Book;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDao bookDao;

	
	
	public BookDao getBookDao() {
		return bookDao;
	}

	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}

	
	@Transactional
	public List<Book> getAllBooks() {
		// TODO Auto-generated method stub
	 return bookDao.getAllBooks();
	}

	@Transactional
	public Book getBookByIsbn(int isbn) {
		// TODO Auto-generated method stub
		return bookDao.getBookByIsbn(isbn);
	}
	

	@Transactional
	public void deletebook(int isbn) {
		// TODO Auto-generated method stub
		bookDao.deletebook(isbn);
		
	}

	@Transactional
	public void addBook(Book book) {
		// TODO Auto-generated method stub
		bookDao.addBook(book);
		
	}

	@Transactional
	public void editBook(Book book) {
		// TODO Auto-generated method stub
		bookDao.editBook(book);
		
	}

}
