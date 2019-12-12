package com.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.entity.Book;
import com.book.entity.Page;
import com.book.entity.Sort;
import com.book.service.BookBiz;

@Controller
public class BookController {
	@Autowired
	private BookBiz  bookBiz;
	
	@RequestMapping("/addBookUi")
	public String addBookUi(Model model){
		//查询类别
		List<Sort> sorts = bookBiz.findAllSort();
		model.addAttribute("sorts", sorts);
		return "addBook";
	}
	
	@RequestMapping("/bookinfo")
	public String bookinfo(Integer currNo,Model model){
		if(currNo ==null){
			currNo = 1;//初始访问第一页
		}
		
		Page page = bookBiz.findByPage(currNo);
		model.addAttribute("bookpage", page);
		return "index";
	}
	@RequestMapping("/addBook")
	public String addSort(Book book){
		try {
			bookBiz.addBook(book);
			//去列表页面
			return "redirect:/bookinfo";
		} catch (Exception e) {
			e.printStackTrace();
			return "addBook";
		}
		
	}
	
	@RequestMapping("/delBook")
	@ResponseBody
	public String delBook(Integer id){
		String msg = "{\"msg\":\"true\"}";
		try {
			bookBiz.delBook(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "{\"msg\":\"false\"}";
		}
		return msg;
	}
	
	
}
