package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.Book;
import com.spring.model.Category;
import com.spring.services.BookService;

@Controller
public class BookController {

	@Autowired
	private BookService bookService;

	public BookService getBookService() {
		return bookService;
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	@RequestMapping("/home")
	public String home(){
		return "home";
	}
	
	@RequestMapping("/about")
	public String Aboutus(){
		return "about";
	}
	@RequestMapping("/Sample5")
	public String Sample5(){
		return "Sample5";
	}
	
	@RequestMapping("/getBooksList")
	public @ResponseBody List<Book> getBooksListInJSON(){
		return bookService.getAllBooks();
		
	}
	
	@RequestMapping("/booksListAngular")
	public String getbooksangular(){
		return "booksListAngular";
	}
	
	/*
	@RequestMapping("/gap")
	public ModelAndView getallproducts(){
		   List<Book>books=  bookService.getAllBooks();
		   return new ModelAndView("bookview","books",books);		
	}*/
	
	@RequestMapping("/gbyid/{id}")
	public ModelAndView getallproductbyid(@PathVariable(value="id") int i){
		
		Book book=bookService.getBookByIsbn(i);
		
		return new ModelAndView("bookid","book",book);
		
	}
	
	@RequestMapping("/delete/{isbn}")
	public String deletebook(@PathVariable(value="isbn")int i){
		Path path=Paths.get("D:/niit_daiy tasks/welcome/src/main/webapp/WEB-INF/resources/images/"+i+".png");
		if(Files.exists(path)){
			try {
				
				Files.delete(path);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		bookService.deletebook(i);
		
		return "redirect:/gap";
		
	}
	
	@RequestMapping(value="/admin/book/addBook",method=RequestMethod.GET)
	public String getBookForm(Model model){

		Book book=new Book();
		Category category=new Category();
		category.setCid(1);
		book.setCategory(category);
		model.addAttribute("bookObj", book);
		return "bookForm";
	}
	
	@RequestMapping(value="/admin/book/addBook",method=RequestMethod.POST)
	public String addBook(@Valid @ModelAttribute(value="bookObj") Book book ,BindingResult result){
		if(result.hasErrors()){
			return "bookForm";
		}
		bookService.addBook(book);
		MultipartFile image=book.getBookImage();
		if(!image.isEmpty() && image!=null){
		Path path=Paths.get("D:/niit_daiy tasks/welcome/src/main/webapp/WEB-INF/resources/images/"+book.getIsbn()+".png");
		try {
			image.transferTo(new File(path.toString()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		}
		
		
		return "redirect:/gap";
	}
	
	@RequestMapping("/admin/book/editBook/{isbn}")
	public ModelAndView geteditForm(@PathVariable(value="isbn") int i){
		Book book=bookService.getBookByIsbn(i);
		return new ModelAndView("editBookForm","editbookObj",book);
		
	}
	@RequestMapping(value="/admin/book/editBook",method=RequestMethod.POST)
	public String editBook(@ModelAttribute(value="editbookObj") Book book){
		bookService.editBook(book);
		MultipartFile image=book.getBookImage();
		if(!image.isEmpty() && image!=null){
		Path path=Paths.get("D:/niit_daiy tasks/welcome/src/main/webapp/WEB-INF/resources/images/"+book.getIsbn()+".png");
		try {
			image.transferTo(new File(path.toString()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		}
		
		return "redirect:/gap";
		
	}
	
	@RequestMapping("/login")
	public String login(@RequestParam(value="error",required=false)String error,@RequestParam(value="registrationSuccess",required=false)String registrationSuccess,
		@RequestParam(value="logout",required=false) String logout ,Model model){
		if(error!=null){
			model.addAttribute("error", "Invalid Credentials...!!!!");
		}
		if(registrationSuccess!=null){
			model.addAttribute("registrationSuccess", "You Have Registrated Successfully... To Continue Use Your Credentials");
		}
		
		if(logout!=null){
			model.addAttribute("logout", "LoggedOut Successfully");
		}
		return "login";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/login?logout";
	}
	
	
}
