package com.foodstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.FoodCouponDAO;
import com.foodstore.model.transaction.CustomerCoupon;
import com.foodstore.model.transaction.FoodCoupon;
import com.foodstore.service.FoodCouponService;

@Service
public class FoodCouponServiceImpl implements FoodCouponService {
	@Autowired 
	private FoodCouponDAO foodCouponDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public FoodCoupon getById(Long id) {
		return foodCouponDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<FoodCoupon> getAll() {
		return foodCouponDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public FoodCoupon create(FoodCoupon entiy) {
		return foodCouponDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public FoodCoupon update(FoodCoupon entiy) {
		return foodCouponDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		foodCouponDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<FoodCoupon> getAll(Pageable pageable) {
		return foodCouponDAO.findAll(pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<FoodCoupon> getByFoodId(Pageable pageable, Long id) {
		return foodCouponDAO.findByFoodId(pageable,id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<FoodCoupon> getByCouponId(Pageable pageable, Long id) {
		return foodCouponDAO.findByCouponId(pageable,id);
	}
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<FoodCoupon> getByStatus(Pageable pageable, int status) {
		return foodCouponDAO.findByStatus(pageable,status);
	}

	@Override
	public CustomerCoupon getByFoodIdAndCouponId(Long foodId, Long couponId) {
		return foodCouponDAO.findByFoodIdAndCouponId(foodId,couponId).orElse(null);
	}

}
