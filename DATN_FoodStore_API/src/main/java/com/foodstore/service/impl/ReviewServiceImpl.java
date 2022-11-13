package com.foodstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.ReviewDAO;
import com.foodstore.model.transaction.Review;
import com.foodstore.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired private ReviewDAO reviewDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Review getById(Long id) {
		return reviewDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<Review> getAll() {
		return reviewDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Review create(Review entiy) {
		return reviewDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Review update(Review entiy) {
		return reviewDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		reviewDAO.deleteById(id);
	}
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Review> getAll(Pageable pageable) {
		return reviewDAO.findAll(pageable);
	}
}
