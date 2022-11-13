package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.ReviewDAO;
import com.foodstore.model.transaction.Review;
import com.foodstore.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public Review getById(Long id) {
		Optional<Review> result = reviewDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<Review> getAll() {
		return reviewDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Review create(Review cart) {
		return reviewDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Review update(Review cart) {
		return reviewDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			reviewDAO.deleteById(id);
		}
	}

}
