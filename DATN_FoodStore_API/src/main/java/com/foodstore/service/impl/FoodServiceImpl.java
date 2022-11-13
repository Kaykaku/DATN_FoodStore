package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.FoodDAO;
import com.foodstore.model.entity.Food;
import com.foodstore.service.FoodService;

@Service
public class FoodServiceImpl implements FoodService {

	@Autowired
	private FoodDAO foodDAO;

	@Override
	public Food getById(Long id) {
		Optional<Food> result = foodDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<Food> getAll() {
		return foodDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Food create(Food cart) {
		return foodDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Food update(Food cart) {
		return foodDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			foodDAO.deleteById(id);
		}
	}
}
