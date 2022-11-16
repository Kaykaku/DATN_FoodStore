package com.foodstore.service;

import java.sql.Date;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.extend.Comment;


@Service
public interface CommentService extends IService<Comment> {
	Page<Comment> getByReviewId(Long id,Pageable pageable);
	
	Page<Comment> getByKeyword(String keyword,Pageable pageable);
	
	Page<Comment> getByFilter(String keyword ,Optional<Integer> status , Optional<Date> createDate , Optional<Boolean> isDisplay,Pageable pageable);
	
	Page<Comment> getByKeyword(String keyword ,int status,Pageable pageable);
	
	Page<Comment> getByKeyword(String keyword ,boolean isDislay,Pageable pageable);
	
	Page<Comment> getByKeyword(String keyword ,int status ,boolean isDislay,Pageable pageable);
}
