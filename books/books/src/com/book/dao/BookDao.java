package com.book.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.entity.Book;
import com.book.entity.Sort;

public interface BookDao {
	// limit ?,?
	public List<Book> findByPage(@Param("index")int index,@Param("size")int pageSize);
	
	public int findTotalCount();
	
	public List<Sort> findAllSort();
	
	public int addBook(Book book);
	
	public int delBook(Integer id);
}
