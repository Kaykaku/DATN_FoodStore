package com.foodstore.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public Page<Review> getByFoodId( Long id,Pageable pageable) {
		return reviewDAO.findByFoodId(id,pageable);
	}

	@Override
	public Page<Review> getByCustomerId(Long id,Pageable pageable) {
		return reviewDAO.findByCustomerId(id,pageable);
	}

	@Override
	public double getAverageRating(Long foodId) {
		return getByFoodId(foodId).stream().mapToInt(r-> r.getRating()).average().orElse(0);
	}

	@Override
	public Map<Integer, Integer> getStatictisRating(Long foodId) {
		Map<Integer,Integer> map = new HashMap<>();
		
		map.put(1,(int) getByFoodId(foodId).stream().mapToInt(r-> r.getRating()).filter(n -> n==1).count());
		map.put(2,(int) getByFoodId(foodId).stream().mapToInt(r-> r.getRating()).filter(n -> n==2).count());
		map.put(3,(int) getByFoodId(foodId).stream().mapToInt(r-> r.getRating()).filter(n -> n==3).count());
		map.put(4,(int) getByFoodId(foodId).stream().mapToInt(r-> r.getRating()).filter(n -> n==4).count());
		map.put(5,(int) getByFoodId(foodId).stream().mapToInt(r-> r.getRating()).filter(n -> n==5).count());
		return map;
	}

	@Override
	public List<Review> getByFoodId(Long id) {
		return reviewDAO.findByFoodId(id);
	}

	@Override
	public List<Review> getByCustomerId(Long id) {
		return reviewDAO.findByCustomerId(id);
	}

//	@Override
//	public Review getByCustomerIdAndFoodId(Pageable pageable, Long customerId, Long foodId) {
//		return reviewDAO.findByCustomerIdAndFoodId(pageable,customerId,foodId).orElse(null);
//	}

//	@Override
//	public Page<Review> getByAllStatus(Pageable pageable, int status, boolean isFavorite, boolean isDisplay) {
//		return reviewDAO.findByAllStatus(pageable,status,isFavorite,isDisplay);
//	}
}
