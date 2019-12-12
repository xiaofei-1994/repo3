package com.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.book.dao.BookDao;
import com.book.entity.Book;
import com.book.entity.Page;
import com.book.entity.Sort;
import com.book.service.BookBiz;
@Service("bookBiz")
@Transactional
public class BookBizImpl implements BookBiz {
	@Autowired
	private BookDao bookDao;

	@Override
	public Page findByPage(int currNo) {
		Page page = new Page();
		page.setCurrNo(currNo);
		page.setList(bookDao.findByPage((currNo-1)*page.getPageSize(), page.getPageSize()));
		page.setTotalCount(bookDao.findTotalCount());
		return page;
	}

	@Override
	public List<Sort> findAllSort() {
		// TODO Auto-generated method stub
		return bookDao.findAllSort();
	}

	@Override
	public int addBook(Book book) {
	
		return bookDao.addBook(book);
	}

	@Override
	public int delBook(Integer id) {
		
		return bookDao.delBook(id);
	}

}
