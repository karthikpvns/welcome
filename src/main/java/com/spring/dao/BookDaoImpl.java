package com.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.Book;

@Repository
public class BookDaoImpl implements BookDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Book> getAllBooks() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		List<Book> books=session.createQuery("from Book").list();
		session.flush();
		session.close();
		
		return books;
	}

	public Book getBookByIsbn(int isbn) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Book book=(Book) session.get(Book.class, isbn);
		session.flush();
		session.close();
		
		return book;
		
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void deletebook(int isbn) {
		// TODO Auto-generated method stub

		Session session=sessionFactory.openSession();
		Book book=(Book) session.get(Book.class, isbn);
		session.delete(book);
		session.flush();
		session.close();
	}

	public void addBook(Book book) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		session.save(book);
		session.flush();
		session.close();
		
		
	}

	public void editBook(Book book) {
		// TODO Auto-generated method stub
		Session session= sessionFactory.openSession();
		session.update(book);
		session.flush();
		session.close();
		
	}

}
