package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.FoodCouponDAO;
import com.foodstore.model.transaction.FoodCoupon;
import com.foodstore.service.FoodCouponService;

@Service
public class FoodCouponServiceImpl implements FoodCouponService {

	@Autowired
	private FoodCouponDAO foodCouponDAO;

	@Override
	public FoodCoupon getById(Long id) {
		Optional<FoodCoupon> result = foodCouponDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<FoodCoupon> getAll() {
		return foodCouponDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public FoodCoupon create(FoodCoupon cart) {
		return foodCouponDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public FoodCoupon update(FoodCoupon cart) {
		return foodCouponDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			foodCouponDAO.deleteById(id);
		}
	}

}
