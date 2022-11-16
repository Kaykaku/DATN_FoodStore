package com.foodstore.service.impl;

import java.sql.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodstore.dao.CommentDAO;
import com.foodstore.model.extend.Comment;
import com.foodstore.service.CommentService;


@Service
public class CommentServiceImpl implements CommentService {
	@Autowired private CommentDAO commentDAO;
	
	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Comment getById(Long id) {
		return commentDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public List<Comment> getAll() {
		return commentDAO.findAll();
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Comment create(Comment entiy) {
		return commentDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Comment update(Comment entiy) {
		return commentDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public void delete(Long id) {
		commentDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<Comment> getAll(Pageable pageable) {
		return commentDAO.findAll(pageable);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<Comment> getByReviewId( Long id,Pageable pageable) {
		return commentDAO.findByReviewId(id,pageable);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<Comment> getByKeyword(String keyword,Pageable pageable) {
		return commentDAO.findByKeyword(keyword, pageable);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<Comment> getByKeyword(String keyword, int status,Pageable pageable) {
		List<Comment> list = commentDAO.findAllByKeyword(keyword).stream().filter(c->c.getStatus()==status).collect(Collectors.toList());
		return new PageImpl<Comment>(list, pageable, list.size());
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<Comment> getByKeyword(String keyword, boolean isDislay,Pageable pageable ) {
		List<Comment> list = commentDAO.findAllByKeyword(keyword).stream().filter(c->c.is_display()==isDislay).collect(Collectors.toList());
		return new PageImpl<Comment>(list, pageable, list.size());
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<Comment> getByKeyword(String keyword, int status, boolean isDislay,Pageable pageable) {
		List<Comment> list = commentDAO.findAllByKeyword(keyword).stream().filter(c->c.is_display()==isDislay && c.getStatus()==status).collect(Collectors.toList());
		return new PageImpl<Comment>(list, pageable, list.size());
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<Comment> getByFilter(String keyword, Optional<Integer> status,
			Optional<Date> createDate, Optional<Boolean> isDisplay,Pageable pageable) {
		List<Comment> list = commentDAO.findAllByKeyword(keyword);
		if(status.isPresent()) list = list.stream().filter(o-> o.getStatus() == status.get()).collect(Collectors.toList());
		if(createDate.isPresent()) list = list.stream().filter(o-> o.getCreate_date() == createDate.get()).collect(Collectors.toList());
		if(isDisplay.isPresent()) list = list.stream().filter(o-> o.is_display() == isDisplay.get()).collect(Collectors.toList());
		return new PageImpl<Comment>(list, pageable, list.size());
	}

}
