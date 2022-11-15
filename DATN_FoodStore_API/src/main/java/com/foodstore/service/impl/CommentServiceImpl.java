package com.foodstore.service.impl;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

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
	public Page<Comment> getByReviewId(Pageable pageable, Long id) {
		return commentDAO.findByReviewId(pageable,id);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<Comment> getByKeyword(Pageable pageable, String keyword) {
		return commentDAO.findByKeyword(pageable,keyword);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<Comment> getByKeyword(Pageable pageable, String keyword, int status) {
		List<Comment> list = commentDAO.findAllByKeyword(keyword).stream().filter(c->c.getStatus()==status).toList();
		return new PageImpl<Comment>(list, pageable, list.size());
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<Comment> getByKeyword(Pageable pageable, String keyword, boolean isDislay) {
		List<Comment> list = commentDAO.findAllByKeyword(keyword).stream().filter(c->c.is_display()==isDislay).toList();
		return new PageImpl<Comment>(list, pageable, list.size());
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<Comment> getByKeyword(Pageable pageable, String keyword, int status, boolean isDislay) {
		List<Comment> list = commentDAO.findAllByKeyword(keyword).stream().filter(c->c.is_display()==isDislay && c.getStatus()==status).toList();
		return new PageImpl<Comment>(list, pageable, list.size());
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<Comment> getByFilter(Pageable pageable, String keyword, Optional<Integer> status,
			Optional<Date> createDate, Optional<Boolean> isDisplay) {
		List<Comment> list = commentDAO.findAllByKeyword(keyword);
		if(status.isPresent()) list = list.stream().filter(o-> o.getStatus() == status.get()).toList();
		if(createDate.isPresent()) list = list.stream().filter(o-> o.getCreate_date() == createDate.get()).toList();
		if(isDisplay.isPresent()) list = list.stream().filter(o-> o.is_display() == isDisplay.get()).toList();
		return new PageImpl<Comment>(list, pageable, list.size());
	}

}
