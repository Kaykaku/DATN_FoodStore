package com.foodstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodstore.dao.CategoryFoodDAO;
import com.foodstore.model.transaction.CategoryFood;
import com.foodstore.service.CategoryFoodService;


@Service
public class CategoryFoodServiceImpl implements CategoryFoodService {
@Autowired private CategoryFoodDAO categoryFoodDAO;
	
	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public CategoryFood getById(Long id) {
		return categoryFoodDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public List<CategoryFood> getAll() {
		return categoryFoodDAO.findAll();
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public CategoryFood create(CategoryFood entiy) {
		return categoryFoodDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public CategoryFood update(CategoryFood entiy) {
		return categoryFoodDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public void delete(Long id) {
		categoryFoodDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<CategoryFood> getAll(Pageable pageable) {
		return categoryFoodDAO.findAll(pageable);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<CategoryFood> getByCategoryId( Long id,Pageable pageable) {
		return categoryFoodDAO.findByCategoryId(id,pageable);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<CategoryFood> getByFoodId(Long id,Pageable pageable) {
		return categoryFoodDAO.findByFoodId(id,pageable);
	}

	@Override
	public CategoryFood getByCategoryIdAndFoodId(Long categoryId, Long foodId) {
		return categoryFoodDAO.findByCategoryIdAndFoodId(categoryId,foodId).orElse(null);
	}
}
