package com.foodstore.service.impl;

import java.util.List;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.FoodDAO;
import com.foodstore.model.entity.Food;
import com.foodstore.service.FoodService;

@Service
public class FoodServiceImpl implements FoodService {

	@Autowired private FoodDAO foodDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Food getById(Long id) {
		return foodDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<Food> getAll() {
		return foodDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Food create(Food entiy) {
		return foodDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Food update(Food entiy) {
		return foodDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		foodDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Food> getAll(Pageable pageable) {
		return foodDAO.findAll(pageable);
	}
}
