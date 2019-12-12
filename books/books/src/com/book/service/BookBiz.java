package com.book.service;

import java.util.List;

import com.book.entity.Book;
import com.book.entity.Page;
import com.book.entity.Sort;

public interface BookBiz {
	
	public Page findByPage(int currNo);
	
	public List<Sort> findAllSort();
	
	public int addBook(Book book);
	
	public int delBook(Integer id);

}
