package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.extend.Comment;


@Service
public interface CommentService extends IService<Comment> {
	Page<Comment> getByReviewId(Pageable pageable,Long id);
	
	Page<Comment> getByKeyword(Pageable pageable,String keyword);
	
	Page<Comment> getByKeyword(Pageable pageable,String keyword ,int status);
	
	Page<Comment> getByKeyword(Pageable pageable,String keyword ,boolean isDislay);
	
	Page<Comment> getByKeyword(Pageable pageable,String keyword ,int status ,boolean isDislay);
}
